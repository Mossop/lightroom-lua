---@meta

---@class LrErrors
local LrErrors = {}

--- Reports whether an error string returned from a protected call (pcall) represents a user cancellation.
---@param errorString string The error message returned from pcall.
---@return boolean # True if the message represents a user cancellation. See also functionContext:addCleanupHandler
function LrErrors.isCanceledError(errorString) end

--- Throws an error indicating that a task was canceled by the user.
function LrErrors.throwCanceled() end

--- Throws an error with a given message.
---@param text string The user-visible error message.
function LrErrors.throwUserError(text) end

return LrErrors
