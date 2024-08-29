---@meta

---@class LrExportContext
---@field exportSession LrExportSession The list of photos and renditions to be exported in this session.
---@field propertyTable table The property table containing the Export settings defined for your plug-in, along with any built-in Lightroom Export settings that you have not excluded.
---@field publishService LrPublishService (only when published) First supported in version 3.0 of the Lightroom SDK.
---@field publishedCollection LrPublishedCollection (only when published) First supported in version 3.0 of the Lightroom SDK.
---@field publishedCollectionInfo table Information about published collection (only when published).
local LrExportContext = {}

--- Configures a progress scope for the export rendering sequence.
---@param args table Arguments in named-argument syntax: title: (string) The display name that identifies the main task; for example, "Exporting files as JPEG". (Note that in the case of publishing, this has no direct effect on the caption displayed.) renderPortion: (optional, number) When all renditions have been processed, the progress scope will be at this percent complete. A percentage value [0..1].
---@return LrProgressScope # A progress scope tied specifically to the export rendering pipeline.
function LrExportContext:configureProgress(args) end

--- Creates an iterator for all renditions in this export.
---@param args table Arguments in named-argument syntax: exportContext (LrExportContext): This value is provided. progessScope (LrProgressScope): The progress scope. renderProgressPortion (number): This value is provided. stopIfCanceled (Boolean): True to stop the iterator prematurely if progress scope is canceled.
---@return any
function LrExportContext:renditions(args) end

--- Starts the rendering process in a separate task.
function LrExportContext:startRendering() end
