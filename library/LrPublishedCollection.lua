---@meta

---@class LrPublishedCollection
---@field catalog LrCatalog The catalog object that contains this collection.
---@field localIdentifier number The local identifier of the published collection, unique withing the catalog.
local LrPublishedCollection = {}

--- Adds a photo with a remote ID and URL to this collection, if it is not a smart collection.
---@param photo LrPhoto The photo object.
---@param remoteID (string | number) The new remote unique identifier.
---@param remoteUrl string The new URL, or nil.
---@param published boolean True to mark the photo as "already published", false to mark as "need to publish".
function LrPublishedCollection:addPhotoByRemoteId(photo, remoteID, remoteUrl, published) end

--- Adds photos to this collection, if it is not a smart collection.
---@param photos LrPhoto[] The photo objects.
function LrPublishedCollection:addPhotos(photos) end

--- Adds a set of published photos, along with their publication data, to this collection, if it is not a smart collection.
---@param publishedPhotos LrPublishedPhoto[] The publication-data objects. These point to the photo objects to be added.
function LrPublishedCollection:addPublishedPhotos(publishedPhotos) end

--- Removes this collection from the containing catalog.
function LrPublishedCollection:delete() end

--- Retrieves an information summary about this published collection.
---@return any
function LrPublishedCollection:getCollectionInfoSummary() end

--- Retrieves the current name of this collection.
---@return string # The name.
function LrPublishedCollection:getName() end

--- Retrieves the parent collection set, if any, that contains this collection.
---@return LrPublishedCollectionSet # The parent set object or nil.
function LrPublishedCollection:getParent() end

--- Retrieves all of the photos in this collection.
---@return LrPhoto[] # An array of photo objects.
function LrPublishedCollection:getPhotos() end

--- Retrieves the publication data for photos in this collection.
---@return LrPublishedPhoto[] # An array of publication-data objects..
function LrPublishedCollection:getPublishedPhotos() end

--- Retrieves the remote service's unique identifier for this published collection, as previously recorded by the plug-in.
---@return string | number | nil # The remote ID.
function LrPublishedCollection:getRemoteId() end

--- Retrieves the URL for this published collection, as assigned by the remote service and previously recorded by the plug-in.
---@return string | nil # The remote URL.
function LrPublishedCollection:getRemoteUrl() end

--- Retrieves the search description for a smart collection.
---@return any
function LrPublishedCollection:getSearchDescription() end

--- Retrieves the service that this collection belongs to.
---@return LrPublishService # The parent publish service object.
function LrPublishedCollection:getService() end

--- Reports whether this collection is a smart collection.
---@return boolean # True if this is a smart collection.
function LrPublishedCollection:isSmartCollection() end

--- Initiates a publish operation for this collection.
---@param doneCallback function? A function which will be called when the publish operation has been completed.
function LrPublishedCollection:publishNow(doneCallback) end

--- Removes all photos from this collection if it is not a smart collection.
function LrPublishedCollection:removeAllPhotos() end

--- Removes photos from this collection if it is not a smart collection.
---@param photos LrPhoto[] The photo objects.
function LrPublishedCollection:removePhotos(photos) end

--- Sets the plug-in-specific settings for this published collection.
---@param settings table The table of settings; contents are defined by the plug-in.
function LrPublishedCollection:setCollectionSettings(settings) end

--- Sets a new name for this published collection.
---@param name string The new name.
---@return any
function LrPublishedCollection:setName(name) end

--- Sets a new parent for this published collection.
---@param parent LrPublishedCollectionSet The new parent set in the same LrPublishService, or nil to make this an immediate child of the service that contains it.
function LrPublishedCollection:setParent(parent) end

--- Sets the unique identifier for this published collection as understood by the remote service.
---@param remoteId (string | number) The new remote ID.
function LrPublishedCollection:setRemoteId(remoteId) end

--- Sets the URL for this published collection, as provided by the remote service.
---@param url string The URL.
function LrPublishedCollection:setRemoteUrl(url) end

--- Sets the search description for this smart collection.
---@param searchDesc table A search descriptor that defines what metadata fields to search, and how to match against a given value. See LrCatalog:findPhotos for details.
function LrPublishedCollection:setSearchDescription(searchDesc) end

--- Reports the type of this object.
---@return string # 'LrPublishedCollection'.
function LrPublishedCollection:type() end
