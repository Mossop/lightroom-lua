--- @meta LrPathUtils

--- @class LrPathUtils
local LrPathUtils = {}

--- Adds a new filename extension to a path.
--- @param path string The path.
--- @param extension string The new extension to append.
--- @return string # The path with the new extension appended.
function LrPathUtils.addExtension(path, extension) end

--- Combines path elements into a single path.
--- @param path string The base path; for example, 'C:\MyDir\'
--- @param child string A child directory or filename to append; for example, 'MyFile'.
--- @return string # The combined path; for example, 'C:\MyDir\MyFile'
function LrPathUtils.child(path, child) end

--- Retrieves the filename extension (if any) from the path.
--- @param path string The path.
--- @return string # The extension, or an empty string if there is no extension.
function LrPathUtils.extension(path) end

--- Retrieves the path to a standard directory, as defined for the platform.
--- @param which string The desired path. One of: 'home', 'temp', 'desktop', 'appPrefs', 'pictures', 'documents', 'appData'
--- @return string # The full path to the specified standard directory.
function LrPathUtils.getStandardFilePath(which) end

--- Reports whether a path is absolute or relative.
--- @param path string The path.
--- @return boolean # True if it is an absolute path, false if it is a relative path.
function LrPathUtils.isAbsolute(path) end

--- Reports whether a path is absolute or relative.
--- @param path string The path.
--- @return boolean # True if it is a relative path, false if it is an absolute path.
function LrPathUtils.isRelative(path) end

--- Retrieves the leaf name from a path.
--- @param path string The path.
--- @return string # The final path component.
function LrPathUtils.leafName(path) end

--- Converts a relative path to an absolute path if possible.
--- @param path string The relative path.
--- @param base string The base path. Must be supplied and an absolute path.
--- @return string # The absolute path, or a path relative to the new base location.
function LrPathUtils.makeAbsolute(path, base) end

--- Converts an absolute path to a relative path if possible.
--- @param path string The path.
--- @param base string The base location, from which to make path relative.
--- @return string # The path, modified to be relative to the new base location.
function LrPathUtils.makeRelative(path, base) end

--- Reports the maximum permissible path length for the current platform.
--- @return number # The maximum path length in characters.
function LrPathUtils.maxPathLength() end

--- Retrieves the parent directory of a path.
--- @param path string The file path.
--- @return string # The path to the parent directory.
function LrPathUtils.parent(path) end

--- Removes the filename extension from a path, if it has one.
--- @param path string The path.
--- @return string # The path without any extension.
function LrPathUtils.removeExtension(path) end

--- Changes the filename extension of a path, replacing any existing extension.
--- @param path string The path.
--- @param extension string The new extension.
--- @return string # The path with the new extension.
function LrPathUtils.replaceExtension(path, extension) end

--- Standarizes a path, resolving links and shortcuts such as .. (dot dot) and ~ (home).
--- @param path string The path.
--- @return string # The path in canonical form.
function LrPathUtils.standardizePath(path) end

return LrPathUtils
