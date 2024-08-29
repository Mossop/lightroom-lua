---@meta

---@class LrShell
local LrShell = {}

--- Opens one or more files in another application.
---@param files string[][] The paths to the files.
---@param appPath string The path to the external application.
function LrShell.openFilesInApp(files, appPath) end

--- Opens one or more files via a command-line process.
---@param files string[][] The paths to the files.
---@param appPath string The path to the command-line application.
---@param extraArgs string? Extra arguments to be inserted between the process name and first file path.
---@return number # The return code from the process (typically 0 if no error). In Windows, the return code from the final run of the process if it was split.
function LrShell.openPathsViaCommandLine(files, appPath, extraArgs) end

--- Brings the Finder or Explorer to the foreground and highlights a file.
---@param path string The path to the file.
function LrShell.revealInShell(path) end

return LrShell
