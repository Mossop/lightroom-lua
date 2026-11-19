"""Tests running the whole build, against a fake SDK and against the real one when it's available."""

import filecmp
import os
import shutil
import subprocess

import pytest

import build
from conftest import ROOT, function, module_html


def make_sdk(path, pages):
    modules = path / "API Reference" / "modules"
    modules.mkdir(parents=True)
    for name, html in pages.items():
        (modules / name).write_text(html)
    return path


def test_main_requires_sdk_path(capsys):
    assert build.main(["build.py"]) == 1
    assert "Must provide the path" in capsys.readouterr().out


def test_build_writes_only_lr_modules(tmp_path):
    page = module_html(functions=[function("LrFoo.bar")])
    sdk = make_sdk(tmp_path / "sdk", {
        "LrFoo.html": page,
        "LrEmpty.html": module_html(),
        "LrView view properties.html": page,
        "SDK - Export service provider.html": page,
        "index.html": page,
        "LrFoo.css": "",
    })
    target = tmp_path / "library"
    target.mkdir()
    (target / "Stale.lua").write_text("")

    build.build(sdk, str(target))

    assert sorted(os.listdir(target)) == ["Globals.lua", "LrFoo.lua"]
    assert (target / "Globals.lua").read_text() == build.GLOBALS
    assert (target / "LrFoo.lua").read_text() == build.generate_module("LrFoo", page)


def test_build_creates_missing_target(tmp_path):
    sdk = make_sdk(tmp_path / "sdk", {"LrFoo.html": module_html(functions=[function("LrFoo.bar")])})

    build.build(sdk, str(tmp_path / "library"))

    assert (tmp_path / "library" / "LrFoo.lua").exists()


@pytest.fixture(scope="module")
def library(sdk, tmp_path_factory):
    # `mise run build` formats the library with StyLua, so do the same here.
    stylua = shutil.which("stylua")
    if stylua is None:
        pytest.skip("StyLua not available; run the tests with `mise run test`")

    target = tmp_path_factory.mktemp("build") / "library"
    build.build(sdk, str(target))
    subprocess.run([stylua, str(target)], check=True)
    return target


class TestRealSdk:
    """Checks the generated output for the SDK in the repository."""

    def module(self, library, name):
        return (library / ("%s.lua" % name)).read_text().splitlines()

    def test_matches_committed_library(self, library):
        # The committed library is generated from the committed SDK version, so any difference
        # is an (intentional or not) change in the generator's output.
        committed = ROOT / "library"
        expected = sorted(os.listdir(committed))
        assert sorted(os.listdir(library)) == expected

        _, mismatch, errors = filecmp.cmpfiles(committed, library, expected, shallow=False)
        assert mismatch == [] and errors == []

    @pytest.mark.parametrize("module,line", [
        # "(<code>LrPhoto</code>) The corresponding photo object, or nil ..."
        ("LrCatalog", "---@return LrPhoto? # The corresponding photo object, or nil if no such photo is in the catalog."),
        # "(array of LrPhoto) ..."
        ("LrCatalog", "---@return LrPhoto[] # The new virtual copies."),
        # Return value text that only starts with "True".
        ("LrPlugin", "---@return boolean # True if the resource exists; false if not"),
        # Instance class named after the module.
        ("LrPlugin", "function LrPlugin:hasResource(name) end"),
        # "An iterator for all export renditions."
        ("LrExportContext", "---@return fun(): number, LrExportRendition | nil"),
        # "(LrDevelopPreset or array of LrDevelopPreset)"
        ("LrApplication", "---@return (LrDevelopPreset | LrDevelopPreset[]) # The specified preset object, or an array of all associated presets if no unique ID is supplied."),
        # Module that is a callable constructor.
        ("LrColor", "return LrColorConstructor"),
        # Namespace sharing a name with its instance class.
        ("LrFunctionContext", "---@class LrFunctionContextNamespace"),
        # Informal instance names in the docs.
        ("LrXml", "---@class XmlBuilderInstance"),
        ("LrXml", "---@class XmlDomInstance"),
        # The module returns its namespace even when another table sorts first.
        ("LrDigest", "return LrDigest"),
        ("LrDigest", "LrDigest.HMAC = {}"),
        # A "Return values" list.
        ("LrHttp", "---@return string # The body of the HTTP response."),
        ("LrExportRendition", "---@return boolean # True if rendering was successful."),
        ("LrDate", "---@return boolean # True if daylight savings time is in effect."),
    ])
    def test_inferred_types(self, library, module, line):
        assert line in self.module(library, module)

    @pytest.mark.parametrize("module,line", [
        ("LrHttp", "---@param timeout number?"),
        ("LrPlugin", "---@field id string"),
        ("LrDevelopController", "---@param spotParams table"),
        # A namespace constant documented without its namespace.
        ("LrView", "---@field kIgnoredView table"),
        ("LrView", "---@return LrViewFactory # The factory object."),
        ("LrDigest", "---@field SHA256 LrDigestFactory"),
        ("LrFunctionContext", "---@return any ... # The call results"),
    ])
    def test_overrides_are_applied(self, library, module, line):
        assert any(l.startswith(line) for l in self.module(library, module))

    def test_every_module_is_valid_meta_file(self, library):
        for path in library.iterdir():
            text = path.read_text()
            assert text.startswith("---@meta\n"), path.name

