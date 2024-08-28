--- @meta LrLocalization

--- @class LrLocalization
local LrLocalization = {}

--- Retrieves the language that is currently in use for translation.
--- @return string # The two-letter ISO code for the language currently in use. (such as 'en' for English, 'fr' for French).
function LrLocalization.currentLanguage() end

--- Converts a Unicode code point value into a UTF-8 string.
--- @param ch number The Unicode code point number.
--- @return string # The UTF-8 string corresponding to that code point.
function LrLocalization.encodeUtf8Character(ch) end

--- Finds a localized string by looking up the key in the plug-in's dictionary for the current locale.
--- @param pluginId string The identifying name for the plug-in. This is the value of the Lightroom-defined property key LR_exportServiceProvider.
--- @param string string The ZString value.
--- @param ... any
--- @return string # The localized display string, if found. If no matching string is found for the current locale, returns the string value from the passed ZString.
function LrLocalization.translateForPlugin(pluginId, string, ...) end

return LrLocalization
