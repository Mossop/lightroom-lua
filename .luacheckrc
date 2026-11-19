-- library/ is LuaLS definition stubs: empty functions whose doc comments carry the types.
std = "lua51"

-- Globals.lua declares the globals Lightroom gives every plug-in.
globals = { "_PLUGIN", "LOC" }

-- Stub functions never use their arguments, and their tables are only declared to hang functions on.
unused_args = false
ignore = { "241" }

-- Doc comments hold the full SDK descriptions.
max_comment_line_length = false
