---@meta

---@class LrCollection
---@field catalog LrCatalog The catalog object that contains this collection.
---@field localIdentifier number The local identifier of the published collection, unique within this catalog.
local LrCollection = {}

--- Adds photos to this collection, if it is not a smart collection.
---@param photos LrPhoto[] The photo objects.
function LrCollection:addPhotos(photos) end

--- Removes this collection from the containing catalog.
function LrCollection:delete() end

--- Retrieves the current name of this collection.
---@return string # The name.
function LrCollection:getName() end

--- Retrieves the parent collection set, if any, that contains this collection.
---@return LrCollectionSet # The parent set object or nil.
function LrCollection:getParent() end

--- Retrieves all of the photos in this collection.
---@return LrPhoto[] # An array of photo objects.
function LrCollection:getPhotos() end

--- Retrieves the search description for a smart collection.
---@return any
function LrCollection:getSearchDescription() end

--- Reports whether this collection is a smart collection.
---@return boolean # True if this is a smart collection.
function LrCollection:isSmartCollection() end

--- Removes all photos from this collection if it is not a smart collection.
function LrCollection:removeAllPhotos() end

--- Removes photos from this collection if it is not a smart collection.
---@param photos LrPhoto[] The photo objects.
function LrCollection:removePhotos(photos) end

--- Sets a new name for this collection.
---@param name string The new name.
---@return any
function LrCollection:setName(name) end

--- Sets a new parent for this collection.
---@param parent LrCollectionSet The new parent collection set, or nil to make this a top-level collection.
function LrCollection:setParent(parent) end

--- Sets the search description for a smart collection.
---@param searchDesc table A search descriptor that defines what metadata fields to search, and how to match against a given value. See LrCatalog:findPhotos for details.
function LrCollection:setSearchDescription(searchDesc) end

--- Reports the type of this object.
---@return string # 'LrCollection'.
function LrCollection:type() end
