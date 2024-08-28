--- @meta

--- @class recursionGuard
--- @field active boolean True if this recursion guard is currently active; that is, currently inside a call to recursionGuard:performWithGuard().
local recursionGuard = {}

--- Calls a function, but only if we are not already inside a call that has been guarded by this guard.
--- @param func function The function to call.
--- @param ... any
function recursionGuard:performWithGuard(func, ...) end

