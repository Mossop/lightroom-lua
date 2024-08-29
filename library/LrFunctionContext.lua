---@meta

---@class LrFunctionContext
local LrFunctionContext = {}

--- Registers a cleanup handler in an instance.
---@param func function The function to call upon completion of the main function. The parameters are the results from pcall(); that is, a success/failure value, followed by other results or the failure message.
function LrFunctionContext:addCleanupHandler(func) end

--- Registers a failure handler in an instance.
---@param func function The function to call if the main function fails. The parameters are the results from pcall(); that is, false (failure) followed by the failure message.
function LrFunctionContext:addFailureHandler(func) end

--- Attaches a string to this function context to be shown in any error dialog triggered by LrDialogs.attachErrorDialogToFunctionContext.
---@param title string The descriptive string to be shown on error.
function LrFunctionContext:addOperationTitleForError(title) end

---@class LrFunctionContextNamespace
local LrFunctionContextNamespace = {}

--- Calls the main function, then calls all of the cleanup handlers before returning control.
---@param name string A name for this context (used only for debugging)
---@param func function The main function to call.
---@param ... any
---@return any # The call results; that is, whatever is returned from the main function. See also LrTasks.startAsyncTask
function LrFunctionContextNamespace.callWithContext(name, func, ...) end

--- Same as callWithContext, but calls the function in a fashion that disables LrTasks.yield from working.
---@param name string A name for this context (used only for debugging)
---@param func function The main function to call.
---@param ... any
---@return any # The call results; that is, whatever is returned from the main function. See also LrTasks.startAsyncTask
function LrFunctionContextNamespace.callWithContext_noyield(name, func, ...) end

--- Runs the main function in a known-safe function environment.
---@param func function The main function to call, with an empty environment.
---@param ... any Further arguments are passed through to the function.
---@return any # The call results; that is, whatever is returned from the main function.
function LrFunctionContextNamespace.callWithEmptyEnvironment(func, ...) end

--- Runs the main function in a caller-provided function environment.
---@param func function The main function to call, with an empty environment.
---@param env table The function environment to use.
---@param ... any Further arguments are passed through to the function.
---@return any # The call results; that is, whatever is returned from the main function.
function LrFunctionContextNamespace.callWithEnvironment(func, env, ...) end

--- Makes a protected call, like Lua's standard pcall, but calls all of the cleanup handlers before returning control.
---@param name string A name for this context (used only for debugging)
---@param func function The main function to call.
---@param ... any
---@return any # The pcall results; that is, a success/failure value, followed by any other return values of the called function. See also LrTasks.startAsyncTask
function LrFunctionContextNamespace.pcallWithContext(name, func, ...) end

--- Same as pcallWithContext, but calls the function in a fashion that disables LrTasks.yield from working.
---@param name string A name for this context (used only for debugging)
---@param func function The main function to call.
---@param ... any
---@return any # The pcall results; that is, a success/failure value, followed by any other return values of the called function. See also LrTasks.startAsyncTask, LrTasks.yield
function LrFunctionContextNamespace.pcallWithContext_noyield(name, func, ...) end

--- Runs the main function in a known-safe function environment, catching any exceptions that occur.
---@param func function The main function to call, with an empty environment.
---@param ... any Further arguments are passed through to the function.
function LrFunctionContextNamespace.pcallWithEmptyEnvironment(func, ...) end

--- Runs the main function in a caller-provided function environment, catching any exceptions that occur.
---@param func function The main function to call, with an empty environment.
---@param env table The function environment to use.
---@param ... any Further arguments are passed through to the function.
function LrFunctionContextNamespace.pcallWithEnvironment(func, env, ...) end

--- Runs the main function in an asynchronous/cooperative task, then calls any cleanup handlers.
---@param name string A name for this context (used only for debugging)
---@param func function The main function to run asynchronously, This function receives the LrFunctionContext object as its one and only parameter.
function LrFunctionContextNamespace.postAsyncTaskWithContext(name, func) end

return LrFunctionContextNamespace
