---@meta

---@class LrRecursionGuard
---@field active boolean True if this recursion guard is currently active; that is, currently inside a call to recursionGuard:performWithGuard().
local LrRecursionGuard = {}

--- Calls a function, but only if we are not already inside a call that has been guarded by this guard.
---@param func function The function to call.
---@param ... any
function LrRecursionGuard:performWithGuard(func, ...) end

--- Creates a new recursion guard.
---@param name string? A name for this recursion guard, used only for debugging.
---@return any
local function LrRecursionGuardConstructor(name) end

return LrRecursionGuardConstructor
