--- @meta

--- @class LrVideoExportPreset
local LrVideoExportPreset = {}

--- This function returns the target extension for the video format associated with this video export preset.
--- @return string # The extension.
function LrVideoExportPreset:extension() end

--- This function returns the identifier of the format corresponding to this video export preset.
--- @return string # The identifier of the video format this video export preset represents.
function LrVideoExportPreset:formatID() end

--- This function returns the name of the video export preset.
--- @return string # The name of the video export preset.
function LrVideoExportPreset:name() end

--- For a preset provided by a plug-in, this function returns the path to the preset file associated with this video export preset.
--- @return string # The preset path.
function LrVideoExportPreset:presetPath() end

--- This function returns the string which appears in the 'Target' information of the Video section in the Export Dialog when this video export preset is selected.
--- @return string # The target information for this preset.
function LrVideoExportPreset:targetInfo() end

--- Reports the type of this object.
--- @return string # 'LrVideoExportPreset'.
function LrVideoExportPreset:type() end

