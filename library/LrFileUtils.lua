--- @meta LrFileUtils

--- @class LrFileUtils
local LrFileUtils = {}

--- Creates a path string that (if written to) would not overwrite any existing file.
--- @param path string The initial path.
--- @return string # The unique path name derived from the given path.
function LrFileUtils.chooseUniqueFileName(path) end

--- Copies a file from one location to another.
--- @param srcPath string The path to the existing source file.
--- @param destPath string The path to a location for the copy.
--- @return boolean # True on success. On failure, can return a second parameter indicating the reason.
function LrFileUtils.copy(srcPath, destPath) end

--- Creates a directory at a given path, recursively creating any parent directories that do not already exist.
--- @param path string The path of the new directory.
function LrFileUtils.createAllDirectories(path) end

--- Creates a directory at a given path.
--- @param path string The path of the new directory. The parent directory must already exist.
function LrFileUtils.createDirectory(path) end

--- Immediately deletes the file or directory at a given path.
--- @param path string The path.
--- @return boolean # True on success. On failure, can return a second parameter indicating the reason.
function LrFileUtils.delete(path) end

--- Iterates through the files and folder that are immediate children of the folder.
--- @param pathToFolder string The folder to examine
function LrFileUtils.directoryEntries(pathToFolder) end

--- Reports whether a given path indicates an existing file or directory.
--- @param path string The path.
--- @return (string | boolean) # The string 'file' or 'directory' if the path corresponds to an existing entity on disk, false if not.
function LrFileUtils.exists(path) end

--- Retrieves the file attributes for the file or directory at a given path.
--- @param path string The path.
--- @return table # A set of file attributes, or, if the file does not exist, an empty table. The file attributes include:  fileSize: File size in bytes fileCreationDate: The creation date.  fileModificationDate: The modification date.   Dates are expressed as a number of seconds since midnight GMT, January 1, 2001.
function LrFileUtils.fileAttributes(path) end

--- Iterates through the files that are immediate children of the folder.
--- @param pathToFolder string The folder to examine.
function LrFileUtils.files(pathToFolder) end

--- Reports whether a given path refers to a directory that contains no visible files.
--- @param path string The directory path.
--- @return boolean # True if the path is for a directory that contains no visible files; false otherwise.
function LrFileUtils.hasNoVisibleFiles(path) end

--- Reports whether a file or directory can be deleted.
--- @param path string The path.
--- @return boolean # True if there is a file that can be deleted at this path; false if not.
function LrFileUtils.isDeletable(path) end

--- Reports whether a given path refers to a directory that contains no files.
--- @param path string The directory path.
--- @return boolean # True if the path is for a directory that contains no files; false otherwise.
function LrFileUtils.isEmptyDirectory(path) end

--- Reports whether a path indicates a readable disk file.
--- @param path string The path.
--- @return boolean # True if there is a file that can be read at this path; false if not.
function LrFileUtils.isReadable(path) end

--- Reports whether a path indicates a writable disk file.
--- @param path string The path.
--- @return boolean # True if there is a file that can be written to at this path; false if not.
function LrFileUtils.isWritable(path) end

--- Makes a file writeable, if possible.
--- @param path string The path.
--- @return boolean # True if the file is writeable after the call, false if not.
function LrFileUtils.makeFileWritable(path) end

--- Moves a file from one location to another.
--- @param srcPath string The path to the existing source file.
--- @param destPath string The path to a new location for the file.
--- @return boolean # True on success. On failure, can return a second parameter indicating the reason.
function LrFileUtils.move(srcPath, destPath) end

--- Moves a file or directory to the system trash or recycle bin.
--- @param path string The path.
--- @return boolean # True on success. If false, the function returns a second parameter indicating the reason.
function LrFileUtils.moveToTrash(path) end

--- Reports whether two paths are on the same volume (which means you could move from one path to the other without copying).
--- @param path1 string The first path.
--- @param path2 string The second path.
--- @return boolean # True if the two paths are on the same volume, false otherwise.
function LrFileUtils.pathsAreOnSameVolume(path1, path2) end

--- Reads the contents of a file into memory.
--- @param path string The file to read.
--- @return string # The contents of the file.
function LrFileUtils.readFile(path) end

--- Iterates through all files and folders that are anywhere inside the folder.
--- @param pathToFolder string The folder to examine
function LrFileUtils.recursiveDirectoryEntries(pathToFolder) end

--- Iterates through all files that are anywhere inside the folder.
--- @param pathToFolder string The folder to examine
function LrFileUtils.recursiveFiles(pathToFolder) end

--- Resolves an alias (in Mac OS) or shortcut (in Windows).
--- @param path string path to examine
--- @return string # If path points to an alias or shortcut file, returns the path pointed to by that alias or shortcut. If it is not an alias or shortcut, returns the path unchanged.
function LrFileUtils.resolveAlias(path) end

--- Resolves all aliases and shortcuts in this path and returns the resulting path (that is, the actual file location).
--- @param path string The path.
--- @return string # The fully resolved path.
function LrFileUtils.resolveAllAliases(path) end

--- Retrieves information about the disk volume containing a given path.
--- @param path string The path.
--- @return table # A table containing these attributes:  fileSystemSize: The total number of bytes on the disk. fileSystemFreeSize: The number of available bytes on the disk.
function LrFileUtils.volumeAttributes(path) end

return LrFileUtils
