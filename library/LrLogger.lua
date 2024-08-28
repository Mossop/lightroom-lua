--- @meta LrLogger

--- @class LrLogger
--- Creates a new logger or finds and returns an existing one.
--- @param name string? A name for this logger.
--- @return LrLogger # An LrLogger object.   If name matches an existing logger, returns that LrLogger object.  If name does not match any existing logger, returns a new, named LrLogger object.  If name is nil, returns an application-wide "default" LrLogger object.
function LrLogger(name) end

return LrLogger
