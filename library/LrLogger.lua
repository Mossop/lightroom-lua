---@meta

---@class LrLogger
local LrLogger = {}

--- Feeds log output through the action function defined for 'debug' messages.
---@param ... any
function LrLogger:debug(...) end

--- Feeds log output through the action function defined for 'debug' messages, using string.format to prepare the output.
---@param format string formatting instructions (see Lua's string.format for details)
---@param ... any
function LrLogger:debugf(format, ...) end

--- Disables all log output from this logger.
function LrLogger:disable() end

--- Enables specific log output from this logger.
---@param actions ([string, function,] | table) What action to take for each log action type. For each of the action types, this must be either a function that takes a string (the log message), or one of the following strings: print: print to console log traceback: print to console log with stack traceback logfile: print to a log file named for the logger. This log file is written to your ~/Documents folder in Mac OS, or to your My Documents folder in Windows. As a shortcut, you can pass a single string or function, which is applied to all of the log output from this logger.
function LrLogger:enable(actions) end

--- Feeds log output through the action function defined for 'error' messages.
---@param ... any
function LrLogger:error(...) end

--- Feeds log output through the action function defined for 'error' messages, using string.format to prepare the output.
---@param format string formatting instructions (see Lua's string.format for details)
---@param ... any
function LrLogger:errorf(format, ...) end

--- Feeds log output through the action function defined for 'fatal' messages.
---@param ... any
function LrLogger:fatal(...) end

--- Feeds log output through the action function defined for 'fatal' messages, using string.format to prepare the output.
---@param format string formatting instructions (see Lua's string.format for details)
---@param ... any
function LrLogger:fatalf(format, ...) end

--- Feeds log output through the action function defined for 'info' messages.
---@param ... any
function LrLogger:info(...) end

--- Feeds log output through the action function defined for 'info' messages, using string.format to prepare the output.
---@param format string formatting instructions (see Lua's string.format for details)
---@param ... any
function LrLogger:infof(format, ...) end

--- Creates optimized versions of specified log functions for use in tight loops.
---@param ... (one | more strings) The names of log functions to optimize.
---@return (one | more functions) # The optimized functions.
function LrLogger:quick(...) end

--- Creates optimized versions of specified log functions for use in tight loops.
---@param ... (one | more strings) The names of log functions to optimize.
---@return (one | more functions) # The optimized functions.
function LrLogger:quickf(...) end

--- Feeds log output through the action function defined for 'trace' messages.
---@param ... any
function LrLogger:trace(...) end

--- Feeds log output through the action function defined for 'trace' messages, using string.format to prepare the output.
---@param format string formatting instructions (see Lua's string.format for details)
---@param ... any
function LrLogger:tracef(format, ...) end

--- Reports the type of this object.
---@return string # 'LrLogger'.
function LrLogger:type() end

--- Feeds log output through the action function defined for 'warn' messages.
---@param ... any
function LrLogger:warn(...) end

--- Feeds log output through the action function defined for 'warn' messages, using string.format to prepare the output.
---@param format string formatting instructions (see Lua's string.format for details)
---@param ... any
function LrLogger:warnf(format, ...) end

--- Creates a new logger or finds and returns an existing one.
---@param name string? A name for this logger.
---@return LrLogger # An LrLogger object. If name matches an existing logger, returns that LrLogger object. If name does not match any existing logger, returns a new, named LrLogger object. If name is nil, returns an application-wide "default" LrLogger object.
local function LrLoggerConstructor(name) end

return LrLoggerConstructor
