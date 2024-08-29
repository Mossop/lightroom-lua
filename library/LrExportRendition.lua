---@meta

---@class LrExportRendition
---@field destinationPath string The absolute path to the rendered photo.
---@field photo LrPhoto The photo to be rendered in this operation.
---@field publishedPhotoId (string | number) If this export session is for publishing and this photo has been previously published, returns the unique identifier that was provided by the published service.
---@field wasSkipped boolean True if this rendition was skipped.
local LrExportRendition = {}

--- Records the unique identifier assigned to a photo published via this service.
---@param publishedId (string | number) The unique ID for the photo. assigned by the service.
function LrExportRendition:recordPublishedPhotoId(publishedId) end

--- Records the URL assigned to photo published via this service.
---@param publishedUrl string The URL for the photo, assigned by the service
function LrExportRendition:recordPublishedPhotoUrl(publishedUrl) end

--- Notifies Lightroom that an export filter provider has completed the filtered rendering.
---@param success boolean True if rendering was successful.
---@param message string An informative message suitable for display if the operation was not successful.
function LrExportRendition:renditionIsDone(success, message) end

--- Causes the export task to skip this rendition.
function LrExportRendition:skipRender() end

--- Reports the type of this object.
---@return string # 'LrExportRendition'.
function LrExportRendition:type() end

--- Signals an upload failure for this rendition.
---@param message string The failure message.
function LrExportRendition:uploadFailed(message) end

--- Causes the export task to yield time to other tasks until this rendition has been fully generated.
function LrExportRendition:waitForRender() end
