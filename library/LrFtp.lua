---@meta

---@class LrFtp
local LrFtp = {}

--- Appends two paths together for use in FTP.
---@param root string The root path.
---@param child string The subdirectory path.
---@return string # The path that results from combining the root and child.
function LrFtp.appendFtpPaths(root, child) end

--- Creates and return an FTP connection object (ftpConnection).
---@param params table A table with these fields: passive: (string) The type of passive connection to make: "none", "normal" or "enhanced". password: (string) The password to accompany the username in authentication. path: (string) The remote path to use when sending or receiving files from the server. port: (integer) The network port the server is using to host the FTP service. protocol: (string) The type of FTP connection to use, "ftp" or "sftp". server: (string) The server name or IP address for this FTP connection. username: (string) The username to authenticate the connection.
---@param autoNegotiate boolean True to prompt the user for retry if the connection cannot be completed due to an invalid password or an SSH host-key issue.
---@return LrFtpConnection # The new FTP connection object, or nil and an error message if the connection failed.
function LrFtp.create(params, autoNegotiate) end

--- A validator function for use in LrView UI control definitions.
---@param view LrView The view object.
---@param inValue any The proposed new value for the view.
function LrFtp.ftpPathValidator(view, inValue) end

--- Creates and returns a pop-up menu view object for accessing FTP presets.
---@param params table a table with these fields factory: (LrViewFactory) The view factory. properties: (table) The property table. valueBinding: (table) The key in the property table for the preset. itemsBinding: (table) The key in the property table for the preset items list.
---@return LrView # A view object of type popup_menu, created by the provided factory, with bindings set to display and change the FTP preset value.
function LrFtp.makeFtpPresetPopup(params) end

--- Prompts the user for a password, but only if the preset was created with 'store password' unchecked.
---@param ftpSettings any
---@return boolean # True if the password was successfully entered. False if the user cancelled the prompt.
function LrFtp.queryForPasswordIfNeeded(ftpSettings) end

---@class LrFtpConnection
---@field connected boolean True if a connection exists.
---@field passive string When protocol is "ftp", the kind of passive connection to attempt.
---@field password string The password to accompany the username in authentication.
---@field path string The remote path to use when sending or receiving files from the server.
---@field port integer The network port the server is using to host the FTP service.
---@field protocol string The type of FTP connection to use, one of "ftp" or "sftp".
---@field server string The server name or IP address for this FTP connection.
---@field username string The username to authenticate the connection.
local LrFtpConnection = {}

--- Disconnects this connection from the server.
function LrFtpConnection:disconnect() end

--- Tests for the existance of a file or directory on the remote system.
---@param filename string The name of the resource to test.
---@return [boolean, string] # On success: False if the resource does not exist, 'file' if it exists as a file, and 'directory' if it exist as a directory On failure: Nil and an error message.
function LrFtpConnection:exists(filename) end

--- Retrieves the contents of a file or directory on the remote server and returns it as a string.
---@param remoteFileName string The remote file name, or a path separator character ('/'). To specify the containing directory, set the ftpConnection.path property to the name of an existing directory.
---@return string # The contents of the remote file, or the file listing for the FTP connection's path.
function LrFtpConnection:getContents(remoteFileName) end

--- Creates a directory on the remote server.
---@param directoryName string The name of the directory to create.
---@return boolean # True if the operation succeeds and a subsequent check shows the directory to exist. False if the operation succeeds but the check shows it to be missing.
function LrFtpConnection:makeDirectory(directoryName) end

--- Removes a directory on the remote server.
---@param directoryName string The name of the directory to remove.
function LrFtpConnection:pRemoveDirectory(directoryName) end

--- Removes a file on the remote server.
---@param filename string The name of the file to remove.
function LrFtpConnection:pRemoveFile(filename) end

--- Sends a file from the local filesystem to the remote server.
---@param theLocalFilePath string The local file path, using the local system path separator.
---@param destFileName string The destination file name
function LrFtpConnection:putFile(theLocalFilePath, destFileName) end

--- Removes a directory on the remote server.
---@param directoryName string The name of the directory to remove.
---@return boolean # True if a check for the directory after the operation completes shows it to be deleted.
function LrFtpConnection:removeDirectory(directoryName) end

--- Removes a file on the remote server.
---@param filename string The name of the file to remove.
---@return boolean # True if a check for the file after the remove completed shows it to be deleted.
function LrFtpConnection:removeFile(filename) end

--- Converts the properties of this FTP connection back into a Lua table, the same as the one passed to LrFtp.create() to create the object.
---@return table # A table of entries for all the properties on this connection.
function LrFtpConnection:toTable() end

return LrFtp
