--- @meta

--- @class ftpConnection
--- @field connected boolean True if a connection exists.
--- @field passive string When protocol is "ftp", the kind of passive connection to attempt.
--- @field password string The password to accompany the username in authentication.
--- @field path string The remote path to use when sending or receiving files from the server.
--- @field port integer The network port the server is using to host the FTP service.
--- @field protocol string The type of FTP connection to use, one of "ftp" or "sftp".
--- @field server string The server name or IP address for this FTP connection.
--- @field username string The username to authenticate the connection.
local ftpConnection = {}

--- Disconnects this connection from the server.
function ftpConnection:disconnect() end

--- Tests for the existance of a file or directory on the remote system.
--- @param filename string The name of the resource to test.
--- @return [boolean, string] # On success: False if the resource does not exist, 'file' if it exists as a file, and 'directory' if it exist as a directory On failure: Nil and an error message.
function ftpConnection:exists(filename) end

--- Retrieves the contents of a file or directory on the remote server and returns it as a string.
--- @param remoteFileName string The remote file name, or a path separator character ('/'). To specify the containing directory, set the ftpConnection.path property to the name of an existing directory.
--- @return string # The contents of the remote file, or the file listing for the FTP connection's path.
function ftpConnection:getContents(remoteFileName) end

--- Creates a directory on the remote server.
--- @param directoryName string The name of the directory to create.
--- @return boolean # True if the operation succeeds and a subsequent check shows the directory to exist. False if the operation succeeds but the check shows it to be missing.
function ftpConnection:makeDirectory(directoryName) end

--- Removes a directory on the remote server.
--- @param directoryName string The name of the directory to remove.
function ftpConnection:pRemoveDirectory(directoryName) end

--- Removes a file on the remote server.
--- @param filename string The name of the file to remove.
function ftpConnection:pRemoveFile(filename) end

--- Sends a file from the local filesystem to the remote server.
--- @param theLocalFilePath string The local file path, using the local system path separator.
--- @param destFileName string The destination file name
function ftpConnection:putFile(theLocalFilePath, destFileName) end

--- Removes a directory on the remote server.
--- @param directoryName string The name of the directory to remove.
--- @return boolean # True if a check for the directory after the operation completes shows it to be deleted.
function ftpConnection:removeDirectory(directoryName) end

--- Removes a file on the remote server.
--- @param filename string The name of the file to remove.
--- @return boolean # True if a check for the file after the remove completed shows it to be deleted.
function ftpConnection:removeFile(filename) end

--- Converts the properties of this FTP connection back into a Lua table, the same as the one passed to LrFtp.create() to create the object.
--- @return table # A table of entries for all the properties on this connection.
function ftpConnection:toTable() end

