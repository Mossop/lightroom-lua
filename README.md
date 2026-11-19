# Lightroom Classic Lua definitions

Type-annotated definitions of the [Lightroom Classic SDK](https://developer.adobe.com/lightroom-classic/) API for the [Lua Language Server](https://luals.github.io/) (LuaLS). With them, a Lightroom plug-in gets completion, hover documentation and type checking for `LrCatalog`, `LrPhoto`, `LrView` and the rest of the SDK.

The definitions in [`library/`](library) are generated from the HTML API reference that ships with the SDK. The current definitions come from **Lightroom Classic SDK 16.0**.

## Using the definitions

This repository is a LuaLS addon. [`config.json`](config.json) enables it in any workspace that contains an `Info.lua` (every Lightroom plug-in has one). It also tells LuaLS to treat `import` like `require`, because that is how plug-ins load SDK modules.

Clone the repository into a folder that holds your LuaLS addons, such as `~/lua-addons/lightroom-lua`. Then add that parent folder to your LuaLS settings, for example in `.luarc.json`:

```json
{
  "workspace.userThirdParty": ["~/lua-addons"]
}
```

Or point at the library directly:

```json
{
  "workspace.library": ["/path/to/lightroom-lua/library"],
  "runtime.special": { "import": "require" }
}
```

## Regenerating the definitions

The SDK is not included in this repository. Download it from Adobe, extract it into the repository root (`LrC_*` is git-ignored) and run:

```sh
mise run setup        # install Python dependencies into .venv, and luacheck
mise run build        # python build.py LrC_*_SDK, then StyLua and luacheck
```

This deletes and rewrites `library/`, formats it with StyLua and lints it with luacheck (configured in `.luacheckrc`). Review the diff before committing it.

## How it works

[`build.py`](build.py) reads each `Lr*.html` page in `API Reference/modules`. It skips pages with spaces in their names, such as `LrView view properties.html`, and the `SDK - …` pages.

1. **Parsing.** BeautifulSoup collects each page's property names, function names, function summaries, parameter descriptions and "Return value" text.
2. **Grouping into classes.** Each item is grouped by the prefix before its `.` or `:`, such as `LrCatalog` or `catalog`. Each prefix becomes a `Base`, which is written out as a Lua table.
   - A base that has `:` methods is a class.
   - A base that consists only of one call with no prefix, like `LrColor( … )`, is a constructor. It is written as `local function LrColorConstructor`.
   - If a namespace and an instance class would get the same name, the namespace gets a `Namespace` suffix, as in `LrFunctionContextNamespace`.
   - When a page has only one base, that base takes the module's name. That is why `plugin:hasResource` becomes `LrPlugin:hasResource`.
   - A property documented without a prefix, like `kIgnoredView`, is a field of the module's namespace.
   - A function nested in a table, like `LrDigest.HMAC.init`, also declares the table (`LrDigest.HMAC = {}`).
   - The module returns the base named after the module. If there isn't one, it returns the first base that isn't a class.
3. **Inferring types.** The docs are written for people, so types are inferred from prose:
   - **A leading parenthesised type.** `(optional, string) The title.` becomes `string?`. Nested parentheses are balanced, so a callback signature such as `( function( observer ) )` becomes `function`, and other asides inside the type are dropped. `fix_type` then normalises what is inside the parentheses:
     - `optional` anywhere marks the type as optional.
     - `a or b`, `a and b` and `a/b` become `(a | b)`.
     - `array of X` and `table of X` become `X[]`, and a plural `X` is made singular.
     - `one or more Xs` becomes `X`, or `X ...` (any number of values) as a return type.
     - `X + ...` becomes `X, any ...`.
     - Comma lists, such as `string, function, or table`, become unions. In a return value without an "or", such as `(Boolean, string)`, they become multiple return values.
     - `TYPE_MAP` translates informal names: `Boolean` → `boolean`, `_PLUGIN` → `LrPlugin`, `builderInstance` → `XmlBuilderInstance`, `digester` → `LrDigester`, `export rendition` → `LrExportRendition`, and so on.
   - **A named return value**, such as `success (Boolean) …`.
   - **A "Return values" list**, where each entry becomes its own `---@return`.
   - **Text that starts with `true` or `false`**, which becomes `boolean`.
   - **`An iterator for all Xs`**, which becomes `fun(): number, X | nil`.
   - **`An X object`**, which becomes `X`, and **text that starts with `table`**, such as `A table with the following information: …`, which becomes `table`.
   - A return value of `(None)` or `(nil)` means there is no return value, so no `---@return` is written.
   - **Parameter names**: `id` is `string`, and `isSomething` is `boolean`.
   - **Nil in the description.** A parameter or return value becomes optional when the first sentence of its description says "or nil", "nil to/for/if/when", or "can/may be nil", or when any sentence starts with "Nil" or "Returns nil". Later sentences often describe a table's fields or a callback's arguments, so other phrases there are ignored.
   - **Constructors**: a module constructor such as `LrColor( … )` returns the module's instance class when its return value isn't otherwise understood.
   - Anything else becomes `any`. The build logs a "has no known type" warning for it.
4. **Overrides.** `TYPE_OVERRIDES` fixes up cases the heuristics get wrong, or where the docs give no type at all. It is keyed by the documented path (`LrHttp.get`) or the generated path (`LrPublishedCollection:getRemoteId`), with `@arg` for parameters. If an override for a function's return gives the same number of values as its "Return values" list, each value keeps its own comment. `EXTRA_FIELDS` adds fields that are only mentioned in a module's prose, like `LrDigest.SHA256`.
5. **Output.** Each module becomes `library/<Module>.lua`, holding `---@class`, `---@field`, `---@param` and `---@return` annotations and empty function stubs. `Globals.lua` declares `_PLUGIN` and `LOC`.

## Tests

```sh
mise run test         # or: python -m pytest tests
```

- **`tests/test_types.py`** unit-tests type inference (`fix_type`, `parse_type_from_str`), using phrases taken from the real docs.
- **`tests/test_generate.py`** builds small HTML pages shaped like the SDK's and checks the generated Lua.
- **`tests/test_build.py`** tests the `build()` entry point. If an SDK is available, either from `$LR_SDK` or an `LrC_*_SDK` directory in the repository, it also rebuilds the real definitions:
  - It checks them file-by-file against the committed `library/`.
  - It spot-checks tricky cases.

  These real-SDK tests are skipped when there is no SDK, or when StyLua isn't on the `PATH` (`mise run test` provides it).

Known bugs are recorded as strict `xfail` tests whose assertion is the *correct* output. Fixing a bug makes its test fail ("XPASS") until you remove the marker.

## Known issues

These are the cases where the generator currently produces wrong or unhelpful types. Each one has an `xfail` test.

| Doc text | Generated | Should be |
| --- | --- | --- |
| A return value of just `true` | not recognised | `boolean` (the `$` in the regex character class is literal) |
| A function with no `function_summary` | takes the next element's text as its comment | no comment. The current SDK does not hit this |

Many properties are only described in prose, such as "Reports whether the plug-in is enabled.", so they are typed `any` unless they have an override.
