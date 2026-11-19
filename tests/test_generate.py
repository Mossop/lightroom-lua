"""Tests generating Lua definitions from small API reference pages shaped like the SDK's."""

import pytest

import build
from build import generate_module
from conftest import function, module_html, prop


def known_bug(reason):
    return pytest.mark.xfail(reason=reason, strict=True)


def lines(lua):
    return lua.splitlines()


def test_empty_module_generates_nothing():
    assert generate_module("LrNothing", module_html()) is None


def test_namespace_module():
    html = module_html(functions=[
        function(
            "LrPathUtils.child", "path, child",
            summary="Appends a leaf name to a path.",
            params=[
                ("path", "(string) The parent path."),
                ("child", "(string) The leaf name."),
            ],
            returns="(string) The combined path.",
        ),
        function(
            "LrPathUtils.exists", "path",
            summary="Reports whether a file exists.",
            params=[("path", "(string) The path.")],
            returns="true if the file exists.",
        ),
    ])

    assert generate_module("LrPathUtils", html) == """---@meta

---@class LrPathUtils
local LrPathUtils = {}

--- Appends a leaf name to a path.
---@param path string The parent path.
---@param child string The leaf name.
---@return string # The combined path.
function LrPathUtils.child(path, child) end

--- Reports whether a file exists.
---@param path string The path.
---@return boolean # true if the file exists.
function LrPathUtils.exists(path) end

return LrPathUtils
"""


def test_class_module_is_named_after_the_namespace():
    # Only one base, so the lowercase instance name takes the module's name.
    html = module_html(
        functions=[function("plugin:hasResource", "name",
                            summary="Reports whether a resource exists.",
                            params=[("name", "(string) The resource name.")],
                            returns="(Boolean) True if it exists.")],
        properties=[
            prop("plugin.enabled", "Reports whether the plug-in is enabled."),
            prop("plugin.id", "Retrieves the unique identifier."),
            prop("plugin.label", "(string) The plug-in's label."),
        ],
    )

    assert generate_module("LrPlugin", html) == """---@meta

---@class LrPlugin
---@field enabled boolean
---@field id string
---@field label string The plug-in's label.
local LrPlugin = {}

--- Reports whether a resource exists.
---@param name string The resource name.
---@return boolean # True if it exists.
function LrPlugin:hasResource(name) end
"""


def test_namespace_alongside_class_of_the_same_name():
    # Like LrFunctionContext: the namespace and the instance class both resolve to the module
    # name, so the namespace gets a "Namespace" suffix.
    html = module_html(functions=[
        function("LrFunctionContext.callWithContext", "name, func",
                 params=[("name", "(string) A name."), ("func", "(function) The function.")]),
        function("functionContext:addCleanupHandler", "func",
                 params=[("func", "(function) The handler.")]),
    ])

    lua = generate_module("LrFunctionContext", html)
    assert "---@class LrFunctionContext" in lines(lua)
    assert "function LrFunctionContext:addCleanupHandler(func) end" in lines(lua)
    assert "---@class LrFunctionContextNamespace" in lines(lua)
    assert "function LrFunctionContextNamespace.callWithContext(name, func) end" in lines(lua)
    assert lua.endswith("\nreturn LrFunctionContextNamespace\n")


def test_constructor_module():
    # Like LrColor: the module is callable, and its instances are a class.
    html = module_html(functions=[
        function("LrColor", "r, g, b",
                 summary="Creates a color.",
                 params=[("r", "(number) Red."), ("g", "(number) Green."), ("b", "(number) Blue.")],
                 returns="(color) The new color."),
        function("color:red", summary="Gets the red value.", returns="(number) The red value."),
    ])

    assert generate_module("LrColor", html) == """---@meta

---@class LrColor
local LrColor = {}

--- Gets the red value.
---@return number # The red value.
function LrColor:red() end

--- Creates a color.
---@param r number Red.
---@param g number Green.
---@param b number Blue.
---@return LrColor # The new color.
local function LrColorConstructor(r, g, b) end

return LrColorConstructor
"""


@pytest.mark.parametrize("returns", [None, "Something undocumented."])
def test_constructor_returns_the_module_class_by_default(returns):
    html = module_html(functions=[
        function("LrColor", "r", params=[("r", "(number) Red.")], returns=returns),
        function("color:red", returns="(number) The red value."),
    ])

    lua = lines(generate_module("LrColor", html))
    assert "---@return LrColor" in lua
    assert "local function LrColorConstructor(r) end" in lua


def test_constructor_without_a_class_is_not_given_one():
    html = module_html(functions=[function("LrFoo", returns="Something undocumented.")])

    assert "---@return any" in lines(generate_module("LrFoo", html))


def test_secondary_classes_use_mapped_names():
    html = module_html(functions=[
        function("LrXml.createXmlBuilder", returns="(builderInstance) The builder."),
        function("builderInstance:serialize", returns="(string) The XML."),
    ])

    lua = generate_module("LrXml", html)
    assert "---@return XmlBuilderInstance # The builder." in lines(lua)
    assert "---@class XmlBuilderInstance" in lines(lua)
    assert "function XmlBuilderInstance:serialize() end" in lines(lua)
    assert lua.endswith("\nreturn LrXml\n")


def test_return_type_inside_code_and_links():
    html = module_html(functions=[
        function("catalog:findPhotoByPath", "path",
                 params=[("path", "(string) The absolute path.")],
                 returns='(<code><a href="LrPhoto.html">LrPhoto</a></code>) The photo, or nil.'),
    ])

    assert "---@return LrPhoto # The photo, or nil." in lines(generate_module("LrCatalog", html))


def test_whitespace_in_descriptions_is_collapsed():
    html = module_html(functions=[
        function("LrFoo.bar", "a",
                 params=[("a", "(string)   The\n\tvalue,\n  spread out.")]),
    ])

    assert "---@param a string The value, spread out." in lines(generate_module("LrFoo", html))


def test_summary_is_used_as_the_comment():
    html = module_html(functions=[function("LrFoo.bar", summary="Does <code>bar</code> things.")])

    assert "--- Does bar things." in lines(generate_module("LrFoo", html))


@known_bug("a missing function_summary takes the next element's text as the comment")
def test_function_without_summary():
    html = module_html(functions=[function("LrFoo.bar"), function("LrFoo.baz", summary="Does baz.")])

    lua = lines(generate_module("LrFoo", html))
    assert lua[lua.index("function LrFoo.bar() end") - 1] == ""


def test_function_without_return_value():
    html = module_html(functions=[function("LrFoo.bar", "a", params=[("a", "(string) A.")])])

    assert not any(l.startswith("---@return") for l in lines(generate_module("LrFoo", html)))


@pytest.mark.parametrize("returns", [
    "(<code>None</code>) This function does not return any value.",
    "(nil) Returns nothing.",
])
def test_documented_lack_of_return_value(returns):
    html = module_html(functions=[function("LrFoo.bar", returns=returns)])

    assert not any(l.startswith("---@return") for l in lines(generate_module("LrFoo", html)))


def test_unparseable_return_value_is_any():
    html = module_html(functions=[function("LrFoo.bar", returns="Whatever the callback returned.")])

    assert "---@return any" in lines(generate_module("LrFoo", html))


def test_unparseable_parameter_is_any():
    html = module_html(functions=[function("LrFoo.bar", "a", params=[("a", "Something or other.")])])

    assert "---@param a any" in lines(generate_module("LrFoo", html))


def test_undocumented_parameters_are_still_declared():
    html = module_html(functions=[function("LrFoo.bar", "a, b", params=[("a", "(string) A.")])])

    lua = lines(generate_module("LrFoo", html))
    assert "---@param a string A." in lua
    assert "---@param b any" in lua
    assert "function LrFoo.bar(a, b) end" in lua


def test_varargs():
    html = module_html(functions=[
        function("logger:info", "...", params=[("...", "Data to be printed, of any type.")]),
    ])

    lua = lines(generate_module("LrLogger", html))
    assert "---@param ... any Data to be printed, of any type." not in lua
    assert "---@param ... any" in lua
    assert "function LrLogger:info(...) end" in lua


@pytest.mark.parametrize("name,expected", [
    ("id", "string"),
    ("isEnabled", "boolean"),
    ("isSelected", "boolean"),
])
def test_parameter_type_inferred_from_name(name, expected):
    html = module_html(functions=[function("LrFoo.bar", name, params=[(name, "Undocumented.")])])

    assert "---@param %s %s" % (name, expected) in lines(generate_module("LrFoo", html))


@pytest.mark.parametrize("name", ["identifier", "island", "is"])
def test_parameter_names_that_only_look_typed(name):
    html = module_html(functions=[function("LrFoo.bar", name, params=[(name, "Undocumented.")])])

    assert "---@param %s any" % name in lines(generate_module("LrFoo", html))


def test_documented_type_beats_name_heuristic():
    html = module_html(functions=[function("LrFoo.bar", "isDone", params=[("isDone", "(number) A count.")])])

    assert "---@param isDone number A count." in lines(generate_module("LrFoo", html))


def test_untyped_underscore_parameter_is_omitted():
    html = module_html(functions=[function("LrFoo.bar", "_, a", params=[("a", "(string) A.")])])

    lua = lines(generate_module("LrFoo", html))
    assert not any(l.startswith("---@param _") for l in lua)
    assert "function LrFoo.bar(_, a) end" in lua


def test_property_types():
    html = module_html(
        functions=[function("LrFoo.bar")],
        properties=[
            prop("LrFoo.kName", "(string) A constant."),
            prop("LrFoo.kFlag", "True when the flag is set."),
            prop("LrFoo.kOther", "Something undocumented."),
        ],
    )

    lua = lines(generate_module("LrFoo", html))
    assert "---@field kName string A constant." in lua
    assert "---@field kFlag boolean True when the flag is set." in lua
    assert "---@field kOther any" in lua


def test_iterator_return():
    html = module_html(functions=[
        function("exportContext:renditions", "params",
                 params=[("params", "(table, optional) Options.")],
                 returns="An iterator for all export renditions."),
    ])

    lua = lines(generate_module("LrExportContext", html))
    assert "---@param params table? Options." in lua
    assert "---@return fun(): number, LrExportRendition | nil" in lua


class TestOverrides:
    def test_override_by_documented_path(self, monkeypatch):
        monkeypatch.setitem(build.TYPE_OVERRIDES, "LrFoo.bar", "integer")
        html = module_html(functions=[function("LrFoo.bar", returns="(number) A count.")])

        assert "---@return integer # A count." in lines(generate_module("LrFoo", html))

    def test_override_by_generated_path(self, monkeypatch):
        # The documented path is "foo:bar" but the generated class is named after the module.
        monkeypatch.setitem(build.TYPE_OVERRIDES, "LrFoo:bar", "integer")
        html = module_html(functions=[function("foo:bar", returns="(number) A count.")])

        assert "---@return integer # A count." in lines(generate_module("LrFoo", html))

    def test_argument_override(self, monkeypatch):
        monkeypatch.setitem(build.TYPE_OVERRIDES, "LrFoo.bar@a", "number?")
        html = module_html(functions=[function("LrFoo.bar", "a", params=[("a", "(number) A.")])])

        assert "---@param a number? A." in lines(generate_module("LrFoo", html))

    def test_argument_override_without_documentation(self, monkeypatch):
        monkeypatch.setitem(build.TYPE_OVERRIDES, "LrFoo.bar@a", "table")
        html = module_html(functions=[function("LrFoo.bar", "a")])

        assert "---@param a table" in lines(generate_module("LrFoo", html))

    def test_real_property_overrides(self):
        html = module_html(
            functions=[function("plugin:type")],
            properties=[prop("plugin.id", "Retrieves the identifier."), prop("plugin.path", "The path.")],
        )

        lua = lines(generate_module("LrPlugin", html))
        assert "---@field id string" in lua
        assert "---@field path string" in lua


def test_modules_do_not_leak_into_each_other():
    generate_module("LrFoo", module_html(functions=[function("LrFoo.bar")]))
    lua = generate_module("LrBaz", module_html(functions=[function("LrBaz.qux")]))

    assert "LrFoo" not in lua
    assert lua.endswith("\nreturn LrBaz\n")


def test_multiple_return_values_in_one_type():
    html = module_html(functions=[
        function("LrFoo.bar", returns="(Boolean, string) Whether it worked, and why not."),
    ])

    assert "---@return boolean, string # Whether it worked, and why not." in lines(generate_module("LrFoo", html))


def test_comma_separated_parameter_type_is_a_union():
    html = module_html(functions=[
        function("LrFoo.bar", "a", params=[("a", "(number, string, Boolean) The time zone.")]),
    ])

    assert "---@param a (number | string | boolean) The time zone." in lines(generate_module("LrFoo", html))


def return_values(name, items):
    """Builds a function whose return values are a "Return values" list, like LrHttp.get."""
    summary, definition = function(name)
    definition = definition.replace("</dd>", """<h3>Return values</h3>
<ol class="retval_list">
%s
</ol>
</dd>""" % "\n".join("\t<li>%s\n\t</li>" % item for item in items))
    return (summary, definition)


def test_return_values_list():
    html = module_html(functions=[return_values("LrFoo.bar", [
        "(string) The body.",
        "(table) A table of tables, one for each header. <ul><li>key: The name.</li></ul>",
    ])])

    lua = lines(generate_module("LrFoo", html))
    i = lua.index("function LrFoo.bar() end")
    assert lua[i - 2:i] == [
        "---@return string # The body.",
        "---@return table # A table of tables, one for each header. key: The name.",
    ]


def test_named_return_values_list():
    # Like LrDigest's Factory.digest.
    html = module_html(functions=[return_values("LrFoo.bar", [
        "digestHex (string) The digest, as a hex string",
        "digestBin (string) The digest, as a binary data string.",
    ])])

    lua = lines(generate_module("LrFoo", html))
    assert "---@return string # The digest, as a hex string" in lua
    assert "---@return string # The digest, as a binary data string." in lua


def test_unparseable_entry_in_return_values_list_is_any():
    # Like photo:getPropertyForPlugin.
    html = module_html(functions=[return_values("LrFoo.bar", [
        "(any) The value.",
        "An error message on error.",
    ])])

    lua = lines(generate_module("LrFoo", html))
    assert "---@return any # The value." in lua
    assert "---@return any" in lua


def test_override_replaces_all_return_values(monkeypatch):
    monkeypatch.setitem(build.TYPE_OVERRIDES, "LrFoo.bar", "string, table?")
    html = module_html(functions=[return_values("LrFoo.bar", ["(string) The body.", "(table) The headers."])])

    lua = lines(generate_module("LrFoo", html))
    assert "---@return string, table?" in lua
    assert not any(l.startswith("---@return string #") for l in lua)
