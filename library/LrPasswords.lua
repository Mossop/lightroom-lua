--- @meta LrPasswords

--- @class LrPasswords
local LrPasswords = {}

--- Retrieves a plain-text password from the encrypted password storage.
--- @param keystring string A key string associated with an encrypted string.
--- @param salt string A salt used as one of the inputs to an encrypted password derivation, or nil. If nil, the default salt is the value of the plug-in ID.
--- @param pluginId string The toolkit ID of the plug-in, or nil for the currently running plug-in.
--- @return string # The plain-text password corresponding to the key.
function LrPasswords.retrieve(keystring, salt, pluginId) end

--- Stores an encrypted password.
--- @param keystring string A key string associated with an encrypted password.
--- @param myPassword string The plain-text password to be encrypted.
--- @param salt string A salt used as one of the inputs to an encrypted password derivation, or nil. If nil, the default salt is the value of the plug-in ID.
--- @param pluginId string The toolkit ID of the plug-in, or nil for the currently running plug-in.
function LrPasswords.store(keystring, myPassword, salt, pluginId) end

return LrPasswords
