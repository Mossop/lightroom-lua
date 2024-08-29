---@meta

---@class LrPhotoInfo
local LrPhotoInfo = {}

--- Retrieves the file attributes that describe a photo file at a given path.
---@param path string The path of a photo file in a format understood by Lightroom (RAW, DNG, TIFF, PSD, or JPEG). If it does not identify such a file, an error occurs.
---@return table # A set of file attributes. The file attributes include: width: Width of the photo in pixels height: Height of the photo in pixels
function LrPhotoInfo.fileAttributes(path) end

return LrPhotoInfo
