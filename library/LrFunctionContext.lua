--- @meta LrFunctionContext

--- @class LrFunctionContext
local LrFunctionContext = {}

--- Calls the main function, then calls all of the cleanup handlers before returning control.
--- @param name string A name for this context (used only for debugging)
--- @param func function The main function to call.
--- @param ... any
--- @return any # The call results; that is, whatever is returned from the main function.
function LrFunctionContext.callWithContext(name, func, ...) end

--- Same as callWithContext, but calls the function in a fashion that disables LrTasks.yield from working.
--- @param name string A name for this context (used only for debugging)
--- @param func function The main function to call.
--- @param ... any
--- @return any # The call results; that is, whatever is returned from the main function.
function LrFunctionContext.callWithContext_noyield(name, func, ...) end

--- Runs the main function in a known-safe function environment.
--- @param func function The main function to call, with an empty environment.
--- @param ... any Further arguments are passed through to the function.
--- @return any # The call results; that is, whatever is returned from the main function.
function LrFunctionContext.callWithEmptyEnvironment(func, ...) end

--- Runs the main function in a caller-provided function environment.
--- @param func function The main function to call, with an empty environment.
--- @param env table The function environment to use.
--- @param ... any Further arguments are passed through to the function.
--- @return any # The call results; that is, whatever is returned from the main function.
function LrFunctionContext.callWithEnvironment(func, env, ...) end

--- Makes a protected call, like Lua's standard pcall, but calls all of the cleanup handlers before returning control.
--- @param name string A name for this context (used only for debugging)
--- @param func function The main function to call.
--- @param ... any
--- @return any # The pcall results; that is, a success/failure value, followed by any other return values of the called function.
function LrFunctionContext.pcallWithContext(name, func, ...) end

--- Same as pcallWithContext, but calls the function in a fashion that disables LrTasks.yield from working.
--- @param name string A name for this context (used only for debugging)
--- @param func function The main function to call.
--- @param ... any
--- @return any # The pcall results; that is, a success/failure value, followed by any other return values of the called function.
function LrFunctionContext.pcallWithContext_noyield(name, func, ...) end

--- Runs the main function in a known-safe function environment, catching any exceptions that occur.
--- @param func function The main function to call, with an empty environment.
--- @param ... any Further arguments are passed through to the function.
function LrFunctionContext.pcallWithEmptyEnvironment(func, ...) end

--- Runs the main function in a caller-provided function environment, catching any exceptions that occur.
--- @param func function The main function to call, with an empty environment.
--- @param env table The function environment to use.
--- @param ... any Further arguments are passed through to the function.
function LrFunctionContext.pcallWithEnvironment(func, env, ...) end

--- Runs the main function in an asynchronous/cooperative task, then calls any cleanup handlers.
--- @param name string A name for this context (used only for debugging)
--- @param func function The main function to run asynchronously, This function receives the LrFunctionContext object as its one and only parameter.
function LrFunctionContext.postAsyncTaskWithContext(name, func) end

return LrFunctionContext
