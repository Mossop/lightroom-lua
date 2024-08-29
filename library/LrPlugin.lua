---@meta

---@class LrPlugin
---@field enabled boolean
---@field id string
---@field path string
local LrPlugin = {}

--- Reports whether a resource exists in this plug-in.
---@param name string The name of the resource, with no path information included..
---@return boolean # True if the resource exists; false if not
function LrPlugin:hasResource(name) end

--- Retrieves a reference to a resource in this plug-in.
---@param name string The name of the resource, with no path information included.
---@return string # A reference to the resource, which can be passed to an LrView picture control, for example. (If the type changes in future, it will still be usable in this way.)
function LrPlugin:resourceId(name) end

--- Reports the type of this object.
---@return string # 'LrPlugin'.
function LrPlugin:type() end
