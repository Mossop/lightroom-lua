import os
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))


def find_sdk():
    """Locates the Lightroom SDK, either from $LR_SDK or an LrC_* directory in the repository."""
    if "LR_SDK" in os.environ:
        return Path(os.environ["LR_SDK"])

    for child in sorted(ROOT.glob("LrC_*_SDK")):
        if (child / "API Reference" / "modules").is_dir():
            return child

    return None


@pytest.fixture(scope="session")
def sdk():
    path = find_sdk()
    if path is None:
        pytest.skip("Lightroom SDK not available; set LR_SDK or extract it into the repository")
    return path


def function(name, args="", summary=None, params=(), returns=None):
    """Builds the summary and definition HTML for one function, as it appears in the API reference.

    `params` is a list of (name, description HTML) and `returns` is the HTML following the
    "Return value" header.
    """
    summary_html = '<div class="function_name"><a href="#%s">%s</a>(&nbsp;%s&nbsp;)</div>\n' % (name, name, args)
    if summary is not None:
        summary_html += '<div class="function_summary">%s</div>\n' % summary

    definition = '<dt><a name="%s"></a><strong>%s</strong>(&nbsp;%s&nbsp;)</dt>\n<dd>\nLonger description.\n' % (name, name, args)
    if params:
        definition += '<h3>Parameters</h3>\n<dl class="param_list">\n'
        for i, (param_name, description) in enumerate(params):
            definition += '<dt>%d. %s</dt>\n<dd>%s</dd>\n' % (i + 1, param_name, description)
        definition += '</dl>\n'
    if returns is not None:
        definition += '<h3>Return value</h3>\n%s\n' % returns
    definition += '</dd>\n'

    return (summary_html, definition)


def prop(name, summary):
    return '<div class="property_name"><a href="#%s">%s</a></div>\n<div class="property_summary">%s</div>\n' % (name, name, summary)


def module_html(functions=(), properties=()):
    """Builds an API reference page in the same shape as the Lightroom SDK's."""
    return """<html><body>
<h2>Summary</h2>
%s
%s
<h2><a name="functions"></a>Functions</h2>
<dl class="function">
%s
</dl>
</body></html>""" % (
        "".join(f[0] for f in functions),
        "".join(properties),
        "".join(f[1] for f in functions),
    )
