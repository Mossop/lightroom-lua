--- @meta

--- @class logger
local logger = {}

--- Feeds log output through the action function defined for 'debug' messages.
--- @param ... any
function logger:debug(...) end

--- Feeds log output through the action function defined for 'debug' messages, using string.format to prepare the output.
--- @param format string formatting instructions (see Lua's string.format for details)
--- @param ... any
function logger:debugf(format, ...) end

--- Disables all log output from this logger.
function logger:disable() end

--- Enables specific log output from this logger.
--- @param actions ([string, function,] | table) What action to take for each log action type. For each of the action types, this must be either a function that takes a string (the log message), or one of the following strings:  print: print to console log traceback: print to console log with stack traceback logfile: print to a log file named for the logger. This log file is written to your ~/Documents folder in Mac OS, or to your My Documents folder in Windows.   As a shortcut, you can pass a single string or function, which is applied to all of the log output from this logger.
function logger:enable(actions) end

--- Feeds log output through the action function defined for 'error' messages.
--- @param ... any
function logger:error(...) end

--- Feeds log output through the action function defined for 'error' messages, using string.format to prepare the output.
--- @param format string formatting instructions (see Lua's string.format for details)
--- @param ... any
function logger:errorf(format, ...) end

--- Feeds log output through the action function defined for 'fatal' messages.
--- @param ... any
function logger:fatal(...) end

--- Feeds log output through the action function defined for 'fatal' messages, using string.format to prepare the output.
--- @param format string formatting instructions (see Lua's string.format for details)
--- @param ... any
function logger:fatalf(format, ...) end

--- Feeds log output through the action function defined for 'info' messages.
--- @param ... any
function logger:info(...) end

--- Feeds log output through the action function defined for 'info' messages, using string.format to prepare the output.
--- @param format string formatting instructions (see Lua's string.format for details)
--- @param ... any
function logger:infof(format, ...) end

--- Creates optimized versions of specified log functions for use in tight loops.
--- @param ... (one | more strings) The names of log functions to optimize.
--- @return (one | more functions) # The optimized functions.
function logger:quick(...) end

--- Creates optimized versions of specified log functions for use in tight loops.
--- @param ... (one | more strings) The names of log functions to optimize.
--- @return (one | more functions) # The optimized functions.
function logger:quickf(...) end

--- Feeds log output through the action function defined for 'trace' messages.
--- @param ... any
function logger:trace(...) end

--- Feeds log output through the action function defined for 'trace' messages, using string.format to prepare the output.
--- @param format string formatting instructions (see Lua's string.format for details)
--- @param ... any
function logger:tracef(format, ...) end

--- Reports the type of this object.
--- @return string # 'LrLogger'.
function logger:type() end

--- Feeds log output through the action function defined for 'warn' messages.
--- @param ... any
function logger:warn(...) end

--- Feeds log output through the action function defined for 'warn' messages, using string.format to prepare the output.
--- @param format string formatting instructions (see Lua's string.format for details)
--- @param ... any
function logger:warnf(format, ...) end

