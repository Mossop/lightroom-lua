---@meta

---@class LrFilterContext
---@field propertyTable table The property table containing the Export settings defined for your plug-in, along with any built-in Lightroom Export settings that you have not excluded.
---@field renditionsToSatisfy table The list of renditions that have been requested by the next filter in the stack (or the final destination plug-in).
---@field sourceExportSession table The export session which should be used to as the source of photo renditions for this filter (i.e.
local LrFilterContext = {}

--- Alias for filterContext.sourceExportSession:renditionsForFilter.
---@param params table? Arguments in named argument syntax. plugin (optional, _PLUGIN object) renditionsToSatisfy (optional, array of LrExportRendition): The list of renditions that this filter must satisfy. filterSettings (optional, function): If present, this function can alter the export settings of the rendition. It is called with two arguments: the individual rendition to be satisfied, and a copy of its export settings that can be modified in place. It can optionally return a string, which will be used as the new path to the file.
function LrFilterContext:renditions(params) end
