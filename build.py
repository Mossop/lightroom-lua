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
}

TYPE_OVERRIDES = {
    "LrHttp.get": "string, table",
    "LrHttp.get@timeout": "number?",
    "LrHttp.post": "string, table",
    "LrHttp.post@timeout": "number?",
    "LrHttp.post@totalSize": "number?",
    "LrHttp.postMultipart": "string, table",
    "LrHttp.postMultipart@timeout": "number?",
}

def strip_tags(st):
    return re.sub("<[^>]+>", "", st)

def fix_comment(comment):
    return comment.strip()

def fix_type(st):
    if "optional" in st:
        return fix_type(st.replace("optional", "").strip(" ,")) + "?"

    if st.startswith("array of "):
        inner = fix_type(st[9:])
        if inner.endswith("s"):
            inner = inner[0:-1]
        return inner + "[]"

    if " or " in st:
        return "(" + " | ".join([fix_type(s) for s in st.split(" or ")]) + ")"

    if ", " in st:
        return "[" + ", ".join([fix_type(s) for s in st.split(", ")]) + "]"

    if st in TYPE_MAP:
        return TYPE_MAP[st]

    return st

def parse_type_from_tag(tag):
    return parse_type_from_str(text_content(tag))

def parse_type_from_str(st):
    match = re.search("^\(([^)]+)\) (.+)$", st)
    if match:
        return (fix_type(match.group(1)), None, fix_comment(match.group(2)))

    match = re.search("^(\S+)\s+\(([^)]+)\) (.+)$", st)
    if match:
        return (fix_type(match.group(2)), match.group(1), fix_comment(match.group(3)))

    return ("any", None, None)

def find_by_class(tag, class_name):
    return tag.find_all(attrs={ "class": class_name })

def find_by_tag_and_text_content(tag, name, content):
    def search(tag):
        return tag.name == name and text_content(tag) == content

    return tag.find(search)

def text_content(tag):
    return re.sub("\s+", " ", "".join(tag.strings)).strip()

def following_text(child):
    text = ""
    while child:
        if isinstance(child, Tag):
            text += "".join(child.strings)
        else:
            text += str(child)
        child = child.next_sibling

    return re.sub("\s+", " ", text.strip())

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

BASES = dict()

class Base:
    def __init__(self, namespace, name):
        self.namespace = namespace
        self.name = name
        self.properties = dict()
        self.functions = dict()
        self.item_type = "any"

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

    def __init__(self, namespace, name):
        match = re.search("^([^:\.]+)([:\.].+)?$", name)

        if not match.group(1) in BASES:
            BASES[match.group(1)] = Base(namespace, match.group(1))
        self.base = BASES[match.group(1)]

        if match.group(2) is not None:
            self.separator = match.group(2)[0]
            self.name = match.group(2)[1:]

        self.base.add_item(self)

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
        if self.found_type() == "any":
            print("  %s has no known type" % self.path())
        file.write("---@field %s %s" % (self.name, self.found_type()))
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

    def write(self, file):
        file.write("---@param %s %s" % (self.name, self.found_type()))
        if self.comment is not None:
            file.write(" %s" % self.comment)
        file.write("\n")

    def path(self):
        return "%s@%s" % (self.base.path(), self.name)

    def final_path(self):
        return "%s@%s" % (self.base.final_path(), self.name)

class Function(Item):
    comment = None
    return_name = None
    return_comment = None

    def __init__(self, namespace, name):
        match = re.search("^(.+)\((.*)\)$", name)
        super().__init__(namespace, match.group(1))
        self.arguments = dict()
        self.item_type = None

        arg_names = match.group(2).strip()
        if len(arg_names) > 0:
            for arg_name in [s.strip() for s in arg_names.split(",")]:
                self.arguments[arg_name] = Argument(self, arg_name)

    def parse_argument(self, name, tag):
        if not name in self.arguments:
            print("  Unexpected argument %s" % name)
        self.arguments[name].parse(tag)

    def parse_return(self, tags):
        (self.item_type, self.return_name, self.return_comment) = parse_type_from_str(following_text(tags[0]))

    def write(self, file):
        if self.comment is not None:
            file.write("--- %s\n" % self.comment)
        for arg in self.arguments.values():
            arg.write(file)

        if self.found_type() is not None:
            file.write("---@return %s" % self.found_type())
            if self.return_comment is not None:
                file.write(" # %s" % self.return_comment)
            file.write("\n")

        if not ":" in self.final_path() and not "." in self.final_path():
            file.write("local ")
        file.write("function %s(" % self.final_path())
        file.write(", ".join([a.name for a in self.arguments.values()]))
        file.write(") end\n")

if len(sys.argv) < 2:
    print("Must provide the path to the Lightroom SDK")
    sys.exit(1)

modules = os.path.join(sys.argv[1], "API Reference", "modules")
p = Path(modules)
target = "library"

shutil.rmtree(target)
os.mkdir(target)

f = open(os.path.join(target, "Globals.lua"), "w")
f.write("""---@meta
local LrLocalization = require "LrLocalization"

--- The current plugin
---@type LrPlugin
_PLUGIN = {}

LOC = LrLocalization.LOC
""")
f.close()

for child in p.iterdir():
    if child.suffix != ".html":
        continue

    namespace = child.stem
    if not namespace.startswith("Lr") or " " in namespace:
        continue

    BASES = dict()

    print("%s" % (child.stem))

    f = open(child)
    soup = BeautifulSoup(f.read(), "html5lib")

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
                    match = re.search("^\d+\. (.+)$", text_content(param))
                    if match:
                        param_name = match.group(1)

                        param_info = next_element(param)
                        func.parse_argument(param_name, param_info)

            return_header = find_by_tag_and_text_content(function_def, "h3", "Return value")
            if return_header is not None:
                inner = return_header.next_sibling
                return_tags = []
                while inner is not None:
                    return_tags.append(inner)
                    inner = inner.next_sibling

                func.parse_return(return_tags)

    bases = sorted(BASES.values(), key=Base.final_path)

    if len(bases) > 0:
        file = open(os.path.join(target, "%s.lua" % namespace), "w")
        file.write("---@meta\n")

        return_name = None

        for base in bases:
            base.write(file)

            if not base.is_class() and return_name is None:
                return_name = base.final_path()

        if return_name is not None:
            file.write("\nreturn %s\n" % return_name)

        file.close()
