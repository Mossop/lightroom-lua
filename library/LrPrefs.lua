--- @meta LrPrefs

--- @class LrPrefs
local LrPrefs = {}

--- Retrieves the preferences table for a plug-in.
--- @param pluginId string The toolkit ID of the plug-in, or nil for the currently running plug-in. This is the value of the Lightroom-defined property key LrToolkitIdentifier. Optional as of Lightroom 3.0; it is recommended that you allow it to default.
--- @return LrObservableTable # The preferences table for the plug-in.
function LrPrefs.prefsForPlugin(pluginId) end

return LrPrefs
