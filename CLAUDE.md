# CLAUDE.md

Generates LuaLS type definitions (`library/*.lua`) from the Lightroom Classic SDK's HTML API reference. See README.md for how the generator works and for the known issues.

## Layout

- `build.py`: the whole generator. It is importable. `generate_module(namespace, html)` returns the Lua text for one page, and `build(sdk, target)` writes a whole library. Running it as a script calls `main()`.
- `library/`: **generated output, committed.** Never hand-edit it. Change `build.py` and regenerate.
- `config.json`: LuaLS addon manifest. Do not change it unless asked.
- `tests/`: pytest suite. `conftest.py` has `function()`, `prop()` and `module_html()` helpers that build fake SDK pages.
- `LrC_*_SDK/`: the Adobe SDK, extracted locally and git-ignored. Read `API Reference/modules/*.html` to see the source text behind any generated line.

## Commands

The Python environment is managed by mise (`mise.toml`) in `.venv`, using Python 3.11. Use `.venv/bin/python` if mise isn't active.

```sh
mise run setup                           # install requirements.txt and luacheck
mise run test                            # python -m pytest tests
mise run build                           # regenerate library/ (deletes it first), then run stylua and luacheck
mise run stylua                          # format library/
mise run luacheck                        # lint library/ (config in .luacheckrc)
```

`python build.py LrC_<version>_SDK` alone produces unformatted output that won't match the committed library, so regenerate with `mise run build`.

## Working rules

- **Regenerate and diff after any change to `build.py`.** `test_matches_committed_library` compares a fresh build with the committed `library/`, so any intended output change needs `library/` regenerated in the same change. Look at the `git diff library/` and make sure every changed line is an improvement.
- **Known bugs are strict `xfail` tests** in `tests/test_types.py` and `tests/test_generate.py`. Their assertions state the *correct* output. When you fix one, remove its `known_bug(...)` marker. Also update the "Known issues" table in README.md.
- **Adding inference for a new phrase:** add a parametrised case to `tests/test_types.py` using the exact wording from the SDK docs. Then change `fix_type` / `parse_type_from_str` / `TYPE_MAP`.
- **Prefer general heuristics to per-item fixes.** Use `TYPE_OVERRIDES` only for one-off cases the prose can't express. Overrides are keyed by the documented path (`LrHttp.get`) or the generated path (`LrPublishedCollection:getRemoteId`), with `@param` for arguments.
- `build.py` prints a lot of debug output (`parse:`, `fix:`, "has no known type"). Grep the "has no known type" lines from a build to find types that are still missing.
- Output must stay valid LuaLS annotation syntax. Multiple return values are written `a, b`. `[a, b]` is a tuple, meaning one table.
- When updating to a new SDK version, extract it, regenerate, and review the diff. Commit messages follow the pattern "Update to vX.Y API".
