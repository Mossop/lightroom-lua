--- @meta LrExportSettings

--- @class LrExportSettings
local LrExportSettings = {}

--- Adds to the available presets for video export in the export/publish dialog in the form of additional entries in the 'Format' and 'Quality' popup menus in the Video section.
--- @param definition table A table specifying information about video export presets to be added the Video section of the export/publish dialog.
--- @param pluginObject LrPlugin The LrPlugin instance representing the plug-in, typically accessed through _PLUGIN.
--- @return table # Array containing LrVideoExportPreset objects for the presets just added.   local pluginDir = _PLUGIN.path local presetFile = 'aiff.epr' LrExportSettings.addVideoExportPresets( { &nbsp;&nbsp;&nbsp;&nbsp;[ 'My h.264' ] = { &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- The format identifier for the video export format that this preset &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- corresponds to. This identifier must be equal to the 'formatName' &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- entry in one of the entries in the table returned by &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- LrExportSettings.supportableVideoExportFormats, i.e. 'h.264'. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;format = 'h.264', &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- Must be an absolute path &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;presetPath = LrPathUtils.child( _PLUGIN.path, 'mypreset.epr' ), &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- To be displayed as target info in export dialog. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;targetInfo = 'my preset target info', &nbsp;&nbsp;&nbsp;&nbsp;}, _PLUGIN } )
function LrExportSettings.addVideoExportPresets(definition, pluginObject) end

--- Applies the specified video export preset to the 'exportSettings' property table.
--- @param exportSettings table The property table containing export settings.
--- @param preset LrVideoExportPreset The video export preset to apply to the propertyTable.
function LrExportSettings.applyVideoExportPreset(exportSettings, preset) end

--- Retrieves the proper file extension to use for a file format.
--- @param format (string | LrVideoExportPreset) A file format string as used by export settings (One of: 'ORIGINAL', 'JPEG', 'JXL', 'AVIF', 'PNG', 'TIFF', 'PSD', or 'DNG'), or, as of Lightroom 4.0, an LrVideoExportPreset object can also be passed in.
--- @return string # The file extension to be used (such as 'jpg', 'png', 'mp4')
function LrExportSettings.extensionForFormat(format) end

--- Removes a custom video export preset previously added by this plug-in via addVideoEXportPresets.
--- @param presetObject (LrVideoExportPreset | string) The preset object corresponding to the preset to remove, or the string 'ALL' to remove all custom video export presets provided by this plug-in.
--- @param pluginObject LrPlugin The LrPlugin instance representing the plug-in, typically accessed through _PLUGIN.
--- @return boolean # True if successful, false otherwise.
function LrExportSettings.removeVideoExportPreset(presetObject, pluginObject) end

--- Retrieves an array of tables, each of which describes a format supportable for video export.
--- @return table # Array of tables. Each table contains  extension: (string) The file extension any video exported using this format will receive. formatName: (string) The name of this format. Use this when adding video export presets in your plug-in.
function LrExportSettings.supportableVideoExportFormats() end

--- Retrieves the LrVideoExportPreset objects associated with the available presets for video export.
--- @return table # Array of LrVideoExportPreset
function LrExportSettings.videoExportPresets() end

--- Returns a list of custom video export presets previously added by this plug-in via addVideoEXportPresets.
--- @param pluginObject LrPlugin The LrPlugin instance representing the plug-in, typically accessed through _PLUGIN.
--- @return table # Array of LrVideoExportPreset
function LrExportSettings.videoExportPresetsForPlugin(pluginObject) end

return LrExportSettings
