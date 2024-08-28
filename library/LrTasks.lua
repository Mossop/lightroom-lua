--- @meta LrTasks

--- @class LrTasks
local LrTasks = {}

--- Reports whether a cooperative task is currently running; that is, a task that was started with LrTasks.startAsyncTasks() or similar.
--- @return boolean # True if LrTasks.yield() can be called.
function LrTasks.canYield() end

--- Similar to Lua's built-in os.execute() function, but blocks only the task that calls it, instead of blocking the entire application.
--- @param cmd string A command to pass to the command line of the OS shell.
--- @return number # The exit status of the OS shell.
function LrTasks.execute(cmd) end

--- Simulates Lua's standard pcall(), but in a way that allows a call to LrTasks.yield() to occur inside it.
--- @param func function The function to call
--- @param ... any
--- @return Boolean + ... # Success (true) or failure (false) + the return value from the function (same as Lua's pcall()).
function LrTasks.pcall(func, ...) end

--- Temporarily stops this task and allows other tasks on Lightroom's main user interface thread to proceed.
--- @param delay number The number of seconds to delay. Fractional values are allowed.
function LrTasks.sleep(delay) end

--- Start a function that will run as a cooperative task on Lightroom's main thread.
--- @param func function The function to start.
--- @param optName string? A name to assign to the task, for debugging only.
function LrTasks.startAsyncTask(func, optName) end

--- Starts a function that will run as a cooperative task on Lightroom's main thread.
--- @param func function The function to start.
--- @param optName string? A name to assign to the task, for debugging only.
function LrTasks.startAsyncTaskWithoutErrorHandler(func, optName) end

--- Temporarily stops this task and allows other tasks on Lightroom's main user interface thread to proceed.
function LrTasks.yield() end

return LrTasks
