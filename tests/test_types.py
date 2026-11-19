"""Tests for inferring Lua types from the human-written text in the API reference.

The inputs here are taken from (or closely modelled on) text in the real SDK documentation.
Cases marked xfail document known mis-parses: the expected value is what the generator *should*
produce. They are strict, so fixing one makes the test fail until its marker is removed.
"""

import pytest

from build import fix_type, parse_type_from_str


def known_bug(reason):
    return pytest.mark.xfail(reason=reason, strict=True)


class TestFixType:
    @pytest.mark.parametrize("text,expected", [
        ("string", "string"),
        ("number", "number"),
        ("integer", "integer"),
        ("table", "table"),
        ("function", "function"),
        ("any", "any"),
        ("nil", "nil"),
        ("LrPhoto", "LrPhoto"),
    ])
    def test_plain_types_pass_through(self, text, expected):
        assert fix_type(text) == expected

    @pytest.mark.parametrize("text,expected", [
        ("Boolean", "boolean"),
        ("bool", "boolean"),
        ("object", "table"),
        ("strings", "string[]"),
        ("tables", "table[]"),
    ])
    def test_prose_type_names_are_mapped(self, text, expected):
        assert fix_type(text) == expected

    @pytest.mark.parametrize("text,expected", [
        ("_PLUGIN", "LrPlugin"),
        ("LrPublishCollection", "LrPublishedCollection"),
        ("LrPublishCollectionSet", "LrPublishedCollectionSet"),
        ("builderInstance", "XmlBuilderInstance"),
        ("xmlDomInstance", "XmlDomInstance"),
        ("ftpConnection", "LrFtpConnection"),
        ("color", "LrColor"),
        ("functionContext", "LrFunctionContext"),
        ("logger", "LrLogger"),
        ("progressScope", "LrProgressScope"),
        ("recursionGuard", "LrRecursionGuard"),
        ("exportSession", "LrExportSession"),
        ("LOC", "LrLocalization.LOC"),
        ("export rendition", "LrExportRendition"),
    ])
    def test_informal_class_names_are_mapped(self, text, expected):
        assert fix_type(text) == expected

    @pytest.mark.parametrize("text", [
        "optional, string",
        "optional,string",
        "string, optional",
        "string,optional",
        "optional string",
    ])
    def test_optional_in_any_position(self, text):
        assert fix_type(text) == "string?"

    @pytest.mark.parametrize("text,expected", [
        ("optional, Boolean", "boolean?"),
        ("optional, bool", "boolean?"),
        ("optional, _PLUGIN", "LrPlugin?"),
        ("table, optional", "table?"),
        ("optional, LrCollectionSet", "LrCollectionSet?"),
    ])
    def test_optional_types_are_mapped(self, text, expected):
        assert fix_type(text) == expected

    @pytest.mark.parametrize("text,expected", [
        ("string or number", "(string | number)"),
        ("string or Boolean", "(string | boolean)"),
        ("string or _PLUGIN", "(string | LrPlugin)"),
        ("LrPublishCollection or LrPublishCollectionSet", "(LrPublishedCollection | LrPublishedCollectionSet)"),
        ("LrVideoExportPreset or string", "(LrVideoExportPreset | string)"),
    ])
    def test_unions(self, text, expected):
        assert fix_type(text) == expected

    def test_optional_union(self):
        assert fix_type("optional, string or number") == "(string | number)?"

    @pytest.mark.parametrize("text,expected", [
        ("array of LrPhoto", "LrPhoto[]"),
        ("array of LrKeyword", "LrKeyword[]"),
        ("array of string", "string[]"),
        ("array of LrPublishedCollections", "LrPublishedCollection[]"),
        ("table of LrPhoto", "LrPhoto[]"),
        ("table of LrCollection", "LrCollection[]"),
    ])
    def test_arrays(self, text, expected):
        assert fix_type(text) == expected

    def test_union_including_array(self):
        assert fix_type("LrDevelopPreset or array of LrDevelopPreset") == "(LrDevelopPreset | LrDevelopPreset[])"

    def test_optional_array(self):
        assert fix_type("optional, array of LrPhoto") == "LrPhoto[]?"

    @known_bug("plural is mapped to string[] by TYPE_MAP before the trailing 's' is stripped")
    def test_array_of_plural_mapped_type(self):
        # LrCatalog:batchGetRawMetadata's keys parameter.
        assert fix_type("array of strings") == "string[]"

    @known_bug("'and' is not treated as a union")
    def test_and_union(self):
        assert fix_type("LrCollection and LrCollectionSet") == "(LrCollection | LrCollectionSet)"

    @known_bug("'and' is not treated as a union")
    def test_array_of_and_union(self):
        assert fix_type("array of LrCollection and LrCollectionSet") == "(LrCollection | LrCollectionSet)[]"

    @pytest.mark.parametrize("text,expected", [
        ("string, function, or table", "(string | function | table)"),
        ("nil, number, string, or Boolean", "(nil | number | string | boolean)"),
        # LrDate.timeStampToComponents's timeZone.
        ("number, string, boolean", "(number | string | boolean)"),
    ])
    def test_comma_separated_union(self, text, expected):
        assert fix_type(text) == expected

    @pytest.mark.parametrize("text,expected", [
        ("Boolean, string", "boolean, string"),
        ("number, number", "number, number"),
        ("string,bool", "string, boolean"),
    ])
    def test_comma_separated_return_values(self, text, expected):
        assert fix_type(text, is_return=True) == expected

    def test_comma_separated_union_in_return_value(self):
        assert fix_type("string, function, or table", is_return=True) == "(string | function | table)"

    @known_bug("'arrays' is not a type, so this produces 'arrays[]'")
    def test_table_of_arrays(self):
        # LrCatalog:buildSmartPreviews returns sub-arrays keyed 'created', 'existed' and 'failed'.
        assert fix_type("table of arrays") == "table<string, any[]>"

    @known_bug("'one or more' is parsed as a union with the type 'one'")
    def test_one_or_more(self):
        # LrLogger:enable's varargs.
        assert fix_type("one or more strings") == "string"

    @known_bug("'any type' is not recognised")
    def test_any_type(self):
        assert fix_type("any type") == "any"

    @known_bug("a bare 'array' is not a Lua type")
    def test_bare_array(self):
        assert fix_type("string or array") == "(string | any[])"

    def test_list_without_spaces(self):
        assert fix_type("string,bool") == fix_type("string, bool")


class TestParseTypeFromStr:
    @pytest.mark.parametrize("text,expected", [
        ("(string) The name of the resource.", ("string", None, "The name of the resource.")),
        ("(Boolean) True to show it.", ("boolean", None, "True to show it.")),
        ("(LrPhoto) The corresponding photo object, or nil.", ("LrPhoto", None, "The corresponding photo object, or nil.")),
        ("(array of LrPhoto) The photos.", ("LrPhoto[]", None, "The photos.")),
        ("(optional, string) A title.", ("string?", None, "A title.")),
        ("(string or number) A key.", ("(string | number)", None, "A key.")),
    ])
    def test_parenthesised_type(self, text, expected):
        assert parse_type_from_str(text) == expected

    def test_parenthesised_type_followed_by_period(self):
        assert parse_type_from_str("(LrPhoto). The photo.") == ("LrPhoto", None, "The photo.")

    def test_only_leading_parentheses_are_the_type(self):
        text = '(string) The "Temporary Images" collection (see LrCatalog:setActiveSources()).'
        assert parse_type_from_str(text) == (
            "string", None, 'The "Temporary Images" collection (see LrCatalog:setActiveSources()).')

    def test_comment_is_stripped(self):
        assert parse_type_from_str("(string)   The name.  ") == ("string", None, "The name.")

    def test_named_return_value(self):
        assert parse_type_from_str("success (Boolean) True if it worked.") == ("boolean", "success", "True if it worked.")

    @pytest.mark.parametrize("text", [
        "true if the resource exists; false if not",
        "True if the resource exists; false if not",
        "False if the photo is missing.",
        "true, if successful.",
        "TRUE. Always.",
    ])
    def test_boolean_inferred_from_leading_true_or_false(self, text):
        assert parse_type_from_str(text) == ("boolean", None, text)

    @pytest.mark.parametrize("text", [
        "trueish values are accepted.",
        "Falsehoods.",
        "Returns true if it worked.",
    ])
    def test_boolean_needs_a_whole_leading_word(self, text):
        assert parse_type_from_str(text) == (None, None, None)

    @known_bug("'$' inside the character class is a literal, so a bare 'true' does not match")
    def test_bare_true(self):
        assert parse_type_from_str("true") == ("boolean", None, "true")

    @pytest.mark.parametrize("text,expected", [
        ("An iterator for all export renditions.", "fun(): number, LrExportRendition | nil"),
        ("an iterator for all LrPhotos", "fun(): number, LrPhoto | nil"),
        ("An iterator for all LrPhoto.", "fun(): number, LrPhoto | nil"),
    ])
    def test_iterators(self, text, expected):
        assert parse_type_from_str(text) == (expected, None, None)

    @pytest.mark.parametrize("text,expected", [
        ("An LrColor object", "LrColor"),
        ("A recursionGuard object.", "LrRecursionGuard"),
        ("An exportSession object.", "LrExportSession"),
        ("An LrProgressScope object. Use this object to make function calls.", "LrProgressScope"),
    ])
    def test_object_prose(self, text, expected):
        assert parse_type_from_str(text) == (expected, None, text)

    @pytest.mark.parametrize("text", [
        "Table containing the search description.",
        "A table with the following information: name: Name of the published collection set.",
        "table with the following information: name: Name of the published collection",
    ])
    def test_table_prose(self, text):
        assert parse_type_from_str(text) == ("table", None, text)

    @pytest.mark.parametrize("text", [
        "",
        "Data to be printed, of any type; tostring() is called on all values.",
        "Tables are not supported.",
        "An objection.",
        "The name of the resource.",
    ])
    def test_unrecognised_text(self, text):
        assert parse_type_from_str(text) == (None, None, None)

    @pytest.mark.parametrize("text", [
        # LrApplication.addActivityObserver's callback.
        "( function( observer, message ) ) The function that will be called.",
        # LrDevelopController.addAdjustmentChangeObserver's callback.
        "( function( observer  ) ) The function that will be called.",
    ])
    def test_function_signature_type(self, text):
        assert parse_type_from_str(text) == ("function", None, "The function that will be called.")

    @pytest.mark.parametrize("text,expected", [
        # xmlDomInstance:childAtIndex.
        ("(xmlDomInstance)The child node.", ("XmlDomInstance", None, "The child node.")),
        # xmlDomInstance:transform's xsltString.
        ("(string): A valid XSLT style sheet.", ("string", None, "A valid XSLT style sheet.")),
        # LrDevelopController.deleteAllColorSwatches.
        ("( boolean ) - Delete all the color swatches", ("boolean", None, "Delete all the color swatches")),
        ("(string)", ("string", None, None)),
    ])
    def test_parenthesised_type_spacing(self, text, expected):
        assert parse_type_from_str(text) == expected

    def test_nested_or_aside(self):
        # LrHttp.post's postBody.
        assert parse_type_from_str("(string (or, as of Lightroom 4.1, a function)) The data to send.") == (
            "(string | function)", None, "The data to send.")

    def test_nested_aside_is_dropped(self):
        assert parse_type_from_str("(number (in seconds)) The delay.") == ("number", None, "The delay.")
