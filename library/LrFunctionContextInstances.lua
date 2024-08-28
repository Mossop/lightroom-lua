--- @meta

--- @class functionContext
local functionContext = {}

--- Registers a cleanup handler in an instance.
--- @param func function The function to call upon completion of the main function. The parameters are the results from pcall(); that is, a success/failure value, followed by other results or the failure message.
function functionContext:addCleanupHandler(func) end

--- Registers a failure handler in an instance.
--- @param func function The function to call if the main function fails. The parameters are the results from pcall(); that is, false (failure) followed by the failure message.
function functionContext:addFailureHandler(func) end

--- Attaches a string to this function context to be shown in any error dialog triggered by LrDialogs.attachErrorDialogToFunctionContext.
--- @param title string The descriptive string to be shown on error.
function functionContext:addOperationTitleForError(title) end

