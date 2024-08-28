--- @meta LrFtp

--- @class LrFtp
local LrFtp = {}

--- Appends two paths together for use in FTP.
--- @param root string The root path.
--- @param child string The subdirectory path.
--- @return string # The path that results from combining the root and child.
function LrFtp.appendFtpPaths(root, child) end

--- Creates and return an FTP connection object (ftpConnection).
--- @param params table A table with these fields:  passive: (string) The type of passive connection to make: "none", "normal" or "enhanced". password: (string) The password to accompany the username in authentication. path: (string) The remote path to use when sending or receiving files from the server. port: (integer) The network port the server is using to host the FTP service. protocol: (string) The type of FTP connection to use, "ftp" or "sftp". server: (string) The server name or IP address for this FTP connection. username: (string) The username to authenticate the connection.
--- @param autoNegotiate boolean True to prompt the user for retry if the connection cannot be completed due to an invalid password or an SSH host-key issue.
--- @return ftpConnection # The new FTP connection object, or nil and an error message if the connection failed.
function LrFtp.create(params, autoNegotiate) end

--- A validator function for use in LrView UI control definitions.
--- @param view LrView The view object.
--- @param inValue any The proposed new value for the view.
function LrFtp.ftpPathValidator(view, inValue) end

--- Creates and returns a pop-up menu view object for accessing FTP presets.
--- @param params table a table with these fields  factory: (LrViewFactory) The view factory. properties: (table) The property table. valueBinding: (table) The key in the property table for the preset. itemsBinding: (table) The key in the property table for the preset items list.
--- @return LrView # A view object of type popup_menu, created by the provided factory, with bindings set to display and change the FTP preset value.
function LrFtp.makeFtpPresetPopup(params) end

--- Prompts the user for a password, but only if the preset was created with 'store password' unchecked.
--- @param ftpSettings any
--- @return boolean # True if the password was successfully entered. False if the user cancelled the prompt.
function LrFtp.queryForPasswordIfNeeded(ftpSettings) end

return LrFtp
