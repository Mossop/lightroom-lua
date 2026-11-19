import io
import sys
import os
import re
from pathlib import Path
import shutil
from bs4 import BeautifulSoup, Tag, NavigableString

TYPE_MAP = {
    "Boolean": "boolean",
    "bool": "boolean",
    "object": "table",
    "strings": "string[]",
    "tables": "table[]",
    "_PLUGIN": "LrPlugin",
    "LrPublishCollection": "LrPublishedCollection",
    "LrPublishCollectionSet": "LrPublishedCollectionSet",
    "builderInstance": "XmlBuilderInstance",
    "xmlDomInstance": "XmlDomInstance",
    "ftpConnection": "LrFtpConnection",
    "color": "LrColor",
    "functionContext": "LrFunctionContext",
    "logger": "LrLogger",
    "progressScope": "LrProgressScope",
    "recursionGuard": "LrRecursionGuard",
    "exportSession": "LrExportSession",
    "LOC": "LrLocalization.LOC",
    "export rendition": "LrExportRendition",
}

TYPE_OVERRIDES = {
    "LrHttp.get@timeout": "number?",
    "LrHttp.post@timeout": "number?",
    "LrHttp.post@totalSize": "number?",
    "LrHttp.postMultipart@timeout": "number?",
    "LrPlugin.id": "string",
    "LrPlugin.path": "string",
    "LrPlugin.enabled": "boolean",
    "LrExportContext.exportSession": "LrExportSession",
    "LrPublishedCollection:getRemoteId": "string | number | nil",
    "LrPublishedCollection:getRemoteUrl": "string | nil",
    "LrDevelopController.setSelectedSpotParams@spotParams": "table",
}

def strip_tags(st):
    return re.sub("<[^>]+>", "", st)

def fix_comment(comment):
    return comment.strip()

def fix_type(st, is_return = False):
    """Converts a type written in the docs to a LuaLS type.

    A comma-separated list is a union, unless it is a return value's type and has no "or", in
    which case it lists multiple return values.
    """
    print("      fix: %s" % st)
    if "optional" in st:
        return fix_type(st.replace("optional", "").strip(" ,")) + "?"

    if "," in st:
        parts = [re.sub(r"^or ", "", s.strip()) for s in st.split(",")]
        parts = [s for s in parts if s != ""]
        types = [fix_type(s) for s in parts]
        if is_return and not re.search(r"\bor\b", st):
            return ", ".join(types)
        return "(" + " | ".join(types) + ")"

    if st.startswith("array of "):
        inner = fix_type(st[9:])
        if inner.endswith("s"):
            inner = inner[0:-1]
        return inner + "[]"

    if " or " in st:
        return "(" + " | ".join([fix_type(s) for s in st.split(" or ")]) + ")"

    if st.startswith("table of "):
        return fix_type(st[9:]) + "[]"

    if st in TYPE_MAP:
        return TYPE_MAP[st]

    return st

def parse_type_from_tag(tag):
    return parse_type_from_str(text_content(tag))

def split_leading_type(st):
    """Splits text that starts with a parenthesised type into (type text, remaining text).

    Nested parentheses are balanced. Returns None if the text doesn't start with "(".
    """
    if not st.startswith("("):
        return None

    depth = 0
    for i, c in enumerate(st):
        if c == "(":
            depth += 1
        elif c == ")":
            depth -= 1
            if depth == 0:
                return (st[1:i], re.sub(r"^\s*[\.:-]?\s*", "", st[i + 1:]))
    return None

def clean_type_text(st):
    """Tidies up the text inside a type's parentheses before it is passed to fix_type."""
    st = st.strip()

    # A callback's signature, such as "function( observer, message )".
    if re.search(r"^function\s*\(", st):
        return "function"

    # "string (or, as of Lightroom 4.1, a function)".
    st = re.sub(r"\s*\(or\b[^()]*?\b(?:an? )?(\w+)\)", r" or \1", st)
    # Any other aside.
    st = re.sub(r"\s*\([^()]*\)", "", st)
    return st

def parse_leading_type(st, is_return):
    split = split_leading_type(st)
    if split is None:
        return None
    (type_text, rest) = split
    comment = fix_comment(rest)
    return (fix_type(clean_type_text(type_text), is_return), comment if comment != "" else None)

def parse_type_from_str(st, is_return = False):
    print("    parse: %s" % st)
    if re.search(r"""^(true|false)[\s\.,$]""", st, re.IGNORECASE):
        return ("boolean", None, fix_comment(st))

    parsed = parse_leading_type(st, is_return)
    if parsed is not None:
        return (parsed[0], None, parsed[1])

    match = re.search(r"""^(\S+)\s+(\(.*)$""", st)
    if match:
        parsed = parse_leading_type(match.group(2), is_return)
        if parsed is not None:
            return (parsed[0], match.group(1), parsed[1])

    match = re.search(r"""^an iterator for all (.+?)s?(\.|$)""", st, re.IGNORECASE)
    if match:
        return ("fun(): number, %s | nil" % fix_type(match.group(1)), None, None)

    # "An LrColor object", "A recursionGuard object."
    match = re.search(r"""^an? (\S+) object\b""", st, re.IGNORECASE)
    if match:
        return (fix_type(match.group(1)), None, fix_comment(st))

    # "Table containing the search description.", "A table with the following information: …"
    if re.search(r"""^(an? )?table\b""", st, re.IGNORECASE):
        return ("table", None, fix_comment(st))

    return (None, None, None)

def find_by_class(tag, class_name):
    return tag.find_all(attrs={ "class": class_name })

def find_by_tag_and_text_content(tag, name, content):
    def search(tag):
        return tag.name == name and text_content(tag) == content

    return tag.find(search)

def pure_text(tag):
    if isinstance(tag, Tag):
        return "".join(tag.strings)
    else:
        return str(tag)

def tags_text_contents(tags):
    text = "".join([pure_text(s) for s in tags])
    return re.sub(r"\s+", " ", text.strip())

def text_content(tag):
    return tags_text_contents(tag.children)

def following_text(child):
    def iter():
        while child is not None:
            yield child
            child = child.next_sibling

    return tags_text_contents(iter())

def next_element(tag):
    tag = tag.next_sibling
    while tag is not None and not isinstance(tag, Tag):
        tag = tag.next_sibling
    return tag

def find_func_summary(soup, func):
    href = "#%s" % func.path()

    def finder(tag):
        return tag.name == "a" and "href" in tag.attrs and tag["href"] == href and tag.parent.name == "div" and "function_name" in tag.parent["class"]

    name = soup.find(finder)
    if name is not None:
        return next_element(name.parent)
    print("  Missing %s" % href)
    return None

def warn_missing_type(item, is_prop = False):
    print("  %s has no known type" % item.final_path())
    # if not is_prop:
    #     raise Exception("Failed to find type")

BASES = dict()

class Base:
    def __init__(self, namespace, name):
        self.namespace = namespace
        self.name = name
        self.properties = dict()
        self.functions = dict()

    def is_ctor(self):
        return not self.is_class() and len(self.functions) == 1 and None in self.functions

    def write(self, file):
        if self.is_ctor():
            file.write("\n")
            self.functions[None].write(file)
        else:
            file.write("\n---@class %s\n" % self.final_path())
            for prop in self.properties.values():
                prop.write(file)

            file.write("local %s = {}\n" % self.final_path())

            for func in self.functions.values():
                file.write("\n")
                func.write(file)

    def add_item(self, item):
        if isinstance(item, Property):
            self.properties[item.name] = item
        else:
            self.functions[item.name] = item

    def path(self):
        return self.name

    def final_path(self):
        if self.name in TYPE_MAP:
            return TYPE_MAP[self.name]

        if len(BASES) == 1:
            return self.namespace

        if self.name == self.namespace and self.is_ctor():
            return "%sConstructor" % self.name

        if self.name == self.namespace:
            for base in BASES.values():
                if base != self and base.final_path() == self.name:
                    return "%sNamespace" % self.name

        return self.name

    def is_class(self):
        for func in self.functions.values():
            if func.separator == ":":
                return True
        return False

class Item:
    base = None
    separator = None
    name = None
    item_type = None

    def __init__(self, namespace, name):
        match = re.search(r"^([^:\.]+)([:\.].+)?$", name)

        if not match.group(1) in BASES:
            BASES[match.group(1)] = Base(namespace, match.group(1))
        self.base = BASES[match.group(1)]

        if match.group(2) is not None:
            self.separator = match.group(2)[0]
            self.name = match.group(2)[1:]

        self.base.add_item(self)

        if "5_202408062022-6258095b" in self.path():
            raise Exception("fioio")

    def found_type(self):
        if self.path() in TYPE_OVERRIDES:
            return TYPE_OVERRIDES[self.path()]
        if self.final_path() in TYPE_OVERRIDES:
            return TYPE_OVERRIDES[self.final_path()]
        return self.item_type

    def path(self):
        if self.name is not None:
            return "%s%s%s" % (self.base.path(), self.separator, self.name)
        return self.base.path()

    def final_path(self):
        if self.name is not None:
            return "%s%s%s" % (self.base.final_path(), self.separator, self.name)
        return self.base.final_path()

class Property(Item):
    comment = None

    def write(self, file):
        if self.found_type() is None:
            warn_missing_type(self, True)
        file.write("---@field %s %s" % (self.name, self.found_type() or "any"))
        if self.comment is not None:
            file.write(" %s" % self.comment)
        file.write("\n")

    def parse_type(self, tag):
        (self.item_type, _, self.comment) = parse_type_from_tag(tag)

class Argument(Item):
    comment = None

    def __init__(self, function, name):
        self.base = function
        self.separator = "#"
        self.name = name

    def parse(self, tag):
        (self.item_type, _, self.comment) = parse_type_from_tag(tag)

    def fixed_type(self):
        if self.name == "id":
            return "string"
        if re.search(r"""^is[A-Z].+""", self.name):
            return "boolean"

    def write(self, file):
        if self.found_type() is None:
            if self.name == "_":
                return

            self.item_type = self.fixed_type()
            if self.found_type() is None:
                warn_missing_type(self)

        file.write("---@param %s %s" % (self.name, self.found_type() or "any"))
        if self.comment is not None:
            file.write(" %s" % self.comment)
        file.write("\n")

    def path(self):
        return "%s@%s" % (self.base.path(), self.name)

    def final_path(self):
        return "%s@%s" % (self.base.final_path(), self.name)

class Function(Item):
    comment = None

    def __init__(self, namespace, name):
        match = re.search(r"^(.+)\((.*)\)$", name)
        super().__init__(namespace, match.group(1))
        self.arguments = dict()
        # A list of (type, comment), one for each return value.
        self.returns = []

        arg_names = match.group(2).strip()
        if len(arg_names) > 0:
            for arg_name in [s.strip() for s in arg_names.split(",")]:
                self.arguments[arg_name] = Argument(self, arg_name)

    def parse_argument(self, name, tag):
        if not name in self.arguments:
            print("  Unexpected argument %s" % name)
        self.arguments[name].parse(tag)

    def parse_return(self, text):
        (return_type, _, comment) = parse_type_from_str(text, is_return = True)
        # "(None) This function does not return any value.", "(nil) Returns nothing."
        if return_type in ("None", "nil"):
            return
        if return_type is None:
            warn_missing_type(self)
            return_type = "any"
        self.returns.append((return_type, comment))

    def found_type(self):
        override = super().found_type()
        if override is not None:
            return override
        if len(self.returns) > 0:
            return ", ".join([t for (t, _) in self.returns])
        return None

    def write_return(self, file, return_type, comment):
        file.write("---@return %s" % return_type)
        if comment is not None:
            file.write(" # %s" % comment)
        file.write("\n")

    def constructed_class(self):
        """For a module constructor, like LrColor( … ), returns the module's instance class."""
        if not self.base.is_ctor():
            return None
        for base in BASES.values():
            if base.is_class() and base.final_path() == self.base.namespace:
                return base.final_path()
        return None

    def write(self, file):
        if self.comment is not None:
            file.write("--- %s\n" % self.comment)
        for arg in self.arguments.values():
            arg.write(file)

        # A constructor whose return value isn't understood returns the module's class.
        cls = self.constructed_class()
        if cls is not None and all(t == "any" for (t, _) in self.returns):
            comment = self.returns[0][1] if len(self.returns) == 1 else None
            self.returns = [(cls, comment)]

        override = super().found_type()
        if override is not None:
            comment = self.returns[0][1] if len(self.returns) == 1 else None
            self.write_return(file, override, comment)
        else:
            for (return_type, comment) in self.returns:
                self.write_return(file, return_type, comment)

        if not ":" in self.final_path() and not "." in self.final_path():
            file.write("local ")
        file.write("function %s(" % self.final_path())
        file.write(", ".join([a.name for a in self.arguments.values()]))
        file.write(") end\n")


GLOBALS = """---@meta
local LrLocalization = require "LrLocalization"

--- The current plugin
---@type LrPlugin
_PLUGIN = {}

LOC = LrLocalization.LOC
"""

def parse_module(namespace, html):
    """Parses a module's API reference HTML, populating and returning BASES."""
    global BASES
    BASES = dict()

    soup = BeautifulSoup(html, "html5lib")

    for property_name in find_by_class(soup, "property_name"):
        prop = Property(namespace, text_content(property_name))
        property_value = next_element(property_name)
        if property_value is not None and "property_summary" in property_value["class"]:
            prop.parse_type(property_value)

    def find_functions(tag):
        return text_content(tag) == "Functions" and tag.name == "h2"
    functions = soup.find(find_functions)

    if functions is not None:
        functions = next_element(functions)
        for function_name in functions.find_all("dt", recursive = False):
            func = Function(namespace, text_content(function_name))

            summary = find_func_summary(soup, func)
            if summary is not None:
                func.comment = text_content(summary)

            function_def = next_element(function_name)

            param_list = function_def.find(attrs = { "class": "param_list" })
            if param_list is not None:
                for param in param_list.find_all("dt"):
                    match = re.search(r"^\d+\. (.+)$", text_content(param))
                    if match:
                        param_name = match.group(1)

                        param_info = next_element(param)
                        func.parse_argument(param_name, param_info)

            return_header = find_by_tag_and_text_content(function_def, "h3", "Return value")
            if return_header is not None:
                inner = return_header.next_sibling
                return_tags = []
                while inner is not None and inner.name != "h3":
                    return_tags.append(inner)
                    inner = inner.next_sibling

                func.parse_return(tags_text_contents(return_tags))

            return_header = find_by_tag_and_text_content(function_def, "h3", "Return values")
            if return_header is not None:
                retval_list = function_def.find(attrs = { "class": "retval_list" })
                for item in retval_list.find_all("li", recursive = False):
                    func.parse_return(text_content(item))

    return BASES

def generate_module(namespace, html):
    """Returns the Lua definitions for a module's API reference HTML, or None if it defines nothing."""
    bases = sorted(parse_module(namespace, html).values(), key=Base.final_path)

    if len(bases) == 0:
        return None

    file = io.StringIO()
    file.write("---@meta\n")

    return_name = None

    for base in bases:
        base.write(file)

        if not base.is_class() and return_name is None:
            return_name = base.final_path()

    if return_name is not None:
        file.write("\nreturn %s\n" % return_name)

    return file.getvalue()

def build(sdk, target):
    modules = Path(sdk, "API Reference", "modules")

    shutil.rmtree(target, ignore_errors = True)
    os.mkdir(target)

    with open(os.path.join(target, "Globals.lua"), "w") as f:
        f.write(GLOBALS)

    for child in modules.iterdir():
        if child.suffix != ".html":
            continue

        namespace = child.stem
        if not namespace.startswith("Lr") or " " in namespace:
            continue

        print("%s" % (child.stem))

        with open(child) as f:
            lua = generate_module(namespace, f.read())

        if lua is not None:
            with open(os.path.join(target, "%s.lua" % namespace), "w") as f:
                f.write(lua)

def main(argv):
    if len(argv) < 2:
        print("Must provide the path to the Lightroom SDK")
        return 1

    build(argv[1], "library")
    return 0

if __name__ == "__main__":
    sys.exit(main(sys.argv))
