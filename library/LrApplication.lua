---@meta

---@class LrApplication
local LrApplication = {}

--- Retrieves the catalog that is currently open in Lightroom.
---@return LrCatalog # The catalog object. See also LrCatalog
function LrApplication.activeCatalog() end

--- Adds a preset hidden within a plug-in.
---@param plugin LrPlugin Your plug-in object.
---@param presetName string The preset's name.
---@param presetValue table The setting values for the preset. For allowed values, see LrDevelopPreset:getSetting.
---@return LrDevelopPreset # The preset object.
function LrApplication.addDevelopPresetForPlugin(plugin, presetName, presetValue) end

--- Retrieves a unique identifier that is keyed to Mac App Store receipt.
---@return string # The unique ID, or nil if the running version of Lightroom is not from the Mac App Store.
function LrApplication.appStoreReceiptHash() end

--- Requests a catalog backup to be performed next time Lightroom closes.
---@param pluginId string The plugin identifier (_PLUGIN.id)
function LrApplication.backupAtNextShutdown(pluginId) end

--- Retrieves a develop preset from its unique identifier.
---@param uuid string The unique identifier, as returned by LrDevelopPreset:getUuid.
---@return LrDevelopPreset # The preset object.
function LrApplication.developPresetByUuid(uuid) end

--- Retrieves all defined develop preset folders.
---@return LrDevelopPresetFolder[] # The preset folder objects.
function LrApplication.developPresetFolders() end

--- Reports available file-naming presets.
---@return table # A table describing each of the available file-naming presets, or an empty table if no presets exist. key: The preset name. value: The UUID or path to the preset's definition.
function LrApplication.filenamePresets() end

--- Retrieves a specific develop preset, or all develop presets associated with this plug-in.
---@param plugin LrPlugin Your plug-in object.
---@param uuid string Optional, the unique identifier of a preset. See LrDevelopPreset:getUuid.
---@return (LrDevelopPreset | LrDevelopPreset[]) # The specified preset object, or an array of all associated presets if no unique ID is supplied.
function LrApplication.getDevelopPresetsForPlugin(plugin, uuid) end

--- Retrieves a unique identifier that is keyed to the MAC address of the system running Lightroom.
---@return string # The unique ID.
function LrApplication.macAddressHash() end

--- Reports available metadata presets.
---@return table # A table describing each of the available metadata presets, or an empty table if no presets exist. key: The preset name. value: The UUID or path to the preset's definition.
function LrApplication.metadataPresets() end

--- Returns a string identifying the manner in which the Lightroom instance was obtained.
---@return string # 'retail', or 'MAS' if the running version of Lightroom was purchased from the Mac App Store. As of Lightroom 5.6, if the running version of Lightroom was installed from the Adobe Creative Cloud, the string 'CC' will be returned.
function LrApplication.purchaseSource() end

--- Retrieves a unique identifier that is keyed to the Lightroom serial number.
---@return string # The unique ID, or "trial" if no serial number is installed (as in 30-day trial mode). As of Lightroom 4.1, if the running version of Lightroom is from the Mac App Store, an empty string will be returned. As of Lightroom 5.6, if the running version of Lightroom was installed from the Adobe Creative Cloud, an empty string will be returned.
function LrApplication.serialNumberHash() end

--- Retrieves the current version of the application as a user-displayable string (for instance, "2.0").
---@return string # Lightroom version
function LrApplication.versionString() end

--- Retrieves the current version of the application as a table that can be parsed.
---@return table # Lightroom version. Contains the following members: major: (number) Major version number minor: (number) Minor version number revision: (number) Revision number build (deprecated): (number) Build number in the form YYYYMMDDHHmm - the date of the build build_version: (string) Build version as a string publicBeta (deprecated): (number or Boolean) Public beta number, or false for final or near-final release.
function LrApplication.versionTable() end

--- Reports available view-filter presets.
function LrApplication.viewFilterPresets() end

return LrApplication
