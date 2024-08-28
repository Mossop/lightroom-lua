import sys
import os
import re
from pathlib import Path
import shutil

TYPE_MAP = {
    "Boolean": "boolean",
    "bool": "boolean",
    "object": "table",
    "strings": "string[]",
    "tables": "table[]",
    "_PLUGIN": "LrPlugin",
    "LrPublishCollection": "LrPublishedCollection",
    "LrPublishCollectionSet": "LrPublishedCollectionSet",
}

def strip_tags(st):
    return re.sub("<[^>]+>", "", st)

def fix_comment(path, comment):
    return strip_tags(comment).strip()

def fix_type(path, st):
    st = strip_tags(st)

    if "optional" in st:
        return fix_type(path, st.replace("optional", "").strip(" ,")) + "?"

    if st.startswith("array of "):
        inner = fix_type(path, st[9:])
        if inner.endswith("s"):
            inner = inner[0:-1]
        return inner + "[]"

    if " or " in st:
        return "(" + " | ".join([fix_type(path, s) for s in st.split(" or ")]) + ")"

    if ", " in st:
        return "[" + ", ".join([fix_type(path, s) for s in st.split(", ")]) + "]"

    if st in TYPE_MAP:
        return TYPE_MAP[st]

    return st

def write_function(file, name, function):
    if function["comment"] is not None:
        file.write("--- %s\n" % function["comment"])
    for arg in function["args"]:
        file.write("--- @param %s %s" % (arg["name"], arg["type"]))
        if arg["comment"] is not None:
            file.write(" %s" % arg["comment"])
        file.write("\n")

    if function["return"] is not None:
        file.write("--- @return %s" % function["return"]["type"])
        if function["return"]["comment"] is not None:
            file.write(" # %s" % function["return"]["comment"])
        file.write("\n")
    file.write("function %s(" % (name))
    file.write(", ".join([a["name"] for a in function["args"]]))
    file.write(") end\n\n")

def write_meta(file, props):
    for (name, field) in props["fields"].items():
        if field["type"] == "any":
            print("  %s.%s has no known type" % (props["base"], name))
        file.write("--- @field %s %s" % (name, field["type"]))
        if field["comment"] is not None:
            file.write(" %s" % field["comment"])
        file.write("\n")

    file.write("local %s = {}\n\n" % (props["base"]))

    for (name, function) in props["functions"].items():
        write_function(file, props["base"] + name, function)

if len(sys.argv) < 2:
    print("Must provide the path to the Lightroom SDK")
    sys.exit(1)

modules = os.path.join(sys.argv[1], "API Reference", "modules")
p = Path(modules)
target = "library"

shutil.rmtree(target)
os.mkdir(target)

f = open(os.path.join(target, "Globals.lua"), "w")
f.write("""--- @meta

--- The current plugin
--- @type LrPlugin
_PLUGIN = {}

--- Resolves the ZString using the available localisations.
--- @param zstr string The localized ZString
--- @param ... string[] Localization parameters
--- @return string
function LOC(zstr, ...) end
""")
f.close()

for child in p.iterdir():
    if child.suffix != ".html":
        continue

    namespace = child.stem
    if not namespace.startswith("Lr") or " " in namespace:
        continue

    f = open(child)
    lines = list(f)

    idx = 0
    while "<title>" not in lines[idx]:
        idx += 1

    title = lines[idx]
    while "</title>" not in title:
        idx += 1
        title += lines[idx]

    pos = title.find(child.stem)

    if pos < 0:
        print("Error parsing %s" % child.stem)
        continue

    title = title[0:pos]

    is_class = "class" in title.lower()
    is_namespace = "namespace" in title.lower()

    print("%s" % (child.stem))

    classes = {}
    ns_props = {
        "fields": dict(),
        "functions": dict(),
        "base": child.stem,
        "root": None,
    }

    def props_for(name):
        if name == child.stem:
            return ns_props

        if not name in classes:
            classes[name] = {
                "fields": dict(),
                "functions": dict(),
                "base": name if is_namespace else child.stem,
            }

        return classes[name]

    while "\"module_summary_index\"" not in lines[idx]:
        idx += 1

    while not lines[idx].startswith("</div>"):
        match = re.search("<div class=\"function_name\"><a href=\".+\">(.+)([:\.].+)</a>\(", lines[idx])
        if match:
            function = { "name": match.group(1) + match.group(2), "return": None, "comment": None, "args": [] }
            props = props_for(match.group(1))
            props["functions"][match.group(2)] = function

        match = re.search("<div class=\"function_name\"><a href=\".+\">%s</a>\(" % child.stem, lines[idx])
        if match:
            function = { "name": child.stem, "return": None, "comment": None, "args": [] }
            ns_props["root"] = function

        match = re.search("<div class=\"function_summary\">(.+)</div>", lines[idx])
        if match:
            function["comment"] = fix_comment(function["name"], match.group(1))

        match = re.search("<div class=\"property_name\"><a href=\".+\">(.+)\.(.+)</a></div>", lines[idx])
        if match:
            field = { "type": "any", "comment": None }
            props = props_for(match.group(1))
            props["fields"][match.group(2)] = field

            idx += 1

            field_path = "%s.%s" % (match.group(1), match.group(2))
            match = re.search("^\s*<div class=\"property_summary\">\(([^)]+)\) (.+)", lines[idx])
            if match:
                field["type"] = fix_type(field_path, match.group(1))
                field["comment"] = fix_comment(field_path, match.group(2))

        idx += 1

    function = None
    while idx < len(lines):
        match = re.search("<dt><a name=\".+\"></a><strong>%s</strong>\(" % child.stem, lines[idx])
        if match:
            if ns_props["root"] is None:
                ns_props["root"] = { "name": child.stem, "return": None, "comment": None, "args": [] }
            function = ns_props["root"]
            idx += 2

        match = re.search("<dt><a name=\".+\"></a><strong>(.+)([:\.].+)</strong>\(", lines[idx])
        if match:
            props = props_for(match.group(1))
            if match.group(2) not in props["functions"]:
                print("  Unexpected function %s%s" % (props["base"], match.group(2)))
            function = props["functions"][match.group(2)]
            idx += 2

        if function is not None and "<dl class=\"param_list\">" in lines[idx]:
            while "</dl>" not in lines[idx]:
                match = re.search("<dt>\d+. (.+)</dt>", lines[idx])
                if match:
                    arg = {
                        "name": match.group(1),
                        "type": "any", "comment": None,
                    }
                    function["args"].append(arg)

                    idx += 1
                    arg_path = "%s#%s" % (function["name"], arg["name"])
                    match = re.search("<dd>\(([^)]+)\) (.+)</dd>", lines[idx])
                    if match:
                        arg["type"] = fix_type(arg_path, match.group(1))
                        arg["comment"] = fix_comment(arg_path, match.group(2))
                    else:
                        print("  Failed to parse type for %s" % arg_path)

                idx += 1

        if function is not None and "<h3>Return value</h3>" in lines[idx]:
            match = re.search("^\(([^)]+)\) (.+)", lines[idx + 1])
            if match:
                function["return"] = {
                    "type": fix_type(function["name"], match.group(1)),
                    "comment": fix_comment(function["name"], match.group(2)),
                }
            else:
                print("  Failed to parse type for %s" % function["name"])
            idx += 2

        idx += 1

    if is_class:
        file_name = child.stem if not is_namespace else child.stem + "Instances"
        class_file = open(os.path.join(target, "%s.lua" % file_name), "w")
        class_file.write("--- @meta\n")

        for name, class_props in classes.items():
            class_file.write("\n--- @class %s\n" % (class_props["base"]))

            write_meta(class_file, class_props)

        class_file.close()

    if is_namespace:
        namespace_file = open(os.path.join(target, "%s.lua" % ns_props["base"]), "w")
        namespace_file.write("--- @meta %s\n\n--- @class %s\n" % (child.stem, ns_props["base"]))

        if ns_props["root"] is not None:
            write_function(namespace_file, ns_props["base"],ns_props["root"])
        else:
            write_meta(namespace_file, ns_props)

        namespace_file.write("return %s\n" % ns_props["base"])
        namespace_file.close()
