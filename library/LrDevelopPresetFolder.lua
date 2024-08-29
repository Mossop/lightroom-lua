---@meta

---@class LrDevelopPresetFolder
local LrDevelopPresetFolder = {}

--- Retrieves the develop-preset children of this folder.
---@return LrDevelopPreset[] # The develop-preset objects.
function LrDevelopPresetFolder:getDevelopPresets() end

--- Retrieves the name of this folder.
---@return string # The name.
function LrDevelopPresetFolder:getName() end

--- Retrieves the path of this folder.
---@return string # The path.
function LrDevelopPresetFolder:getPath() end

--- Reports the type of this object.
---@return string # 'LrDevelopPresetFolder'.
function LrDevelopPresetFolder:type() end
