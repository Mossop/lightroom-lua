---@meta

---@class LrPublishService
---@field catalog LrCatalog The catalog object that contains this publish service.
---@field localIdentifier number The local identifier of the publish service, unique within the catalog.
local LrPublishService = {}

--- Creates a new published collection in this publish service.
---@param name string The name of the new published collection.
---@param parent LrPublishedCollectionSet? The parent of the new collection, or nil to create at the top level of this publish service.
---@param canReturnExisting boolean? True to return an existing published collection with this name, otherwise return nil if such a collection exists.
---@return LrPublishedCollection # On success, the new pulished collection object. If a collection with this name (case insensitive) already exists, nil (if optCanReturnExisting is false) or that collection object. If a collection set with this name (case insensitive) already exists, nil.
function LrPublishService:createPublishedCollection(name, parent, canReturnExisting) end

--- Creates a new collection set in this publish service.
---@param name string The name of the new collection set.
---@param parent LrPublishedCollectionSet? The parent of the new collection set, or nil to create at the top level of this publish service.
---@param canReturnExisting boolean? True to return an existing published collection set with this name, otherwise return nil if such a collection set exists.
---@return LrPublishedCollectionSet # On success, the new published collection set object. If a collection set with this name (case insensitive) already exists, nil (if optCanReturnExisting is false) or that collection set object. If a collection with this name (case insensitive) already exists, nil.
function LrPublishService:createPublishedCollectionSet(name, parent, canReturnExisting) end

--- Creates a new published smart collection in this publish service.
---@param name string The name of the new published smart collection.
---@param searchDesc table A search descriptor that defines what metadata fields to search, and how to match against a given value. See LrCatalog:findPhotos() for details. The default value for the "combine" field is "intersect".
---@param parent LrPublishedCollectionSet? The parent of the new collection, or nil to create at the top level of this publish service.
---@param canReturnExisting boolean? True to return an existing published collection with this name, otherwise return nil if such a collection exists.
---@return LrPublishedCollection # On success, the new pulished collection object. If a collection with this name (case insensitive) already exists, nil (if optCanReturnExisting is false) or that collection object. If a collection set with this name (case insensitive) already exists, nil.
function LrPublishService:createPublishedSmartCollection(name, searchDesc, parent, canReturnExisting) end

--- Retrieves the photo collection sets that are immediate children of this service.
---@return any
function LrPublishService:getChildCollectionSets() end

--- Retrieves the photo collections that are immediate children of this service.
---@return LrPublishedCollection[] # The contained collection objects.
function LrPublishService:getChildCollections() end

--- Retrieves the current name of the publish service.
---@return string # The name.
function LrPublishService:getName() end

--- Retrieves the unique identifier for the plug-in to which this service belongs.
---@return string # The plug-in ID.
function LrPublishService:getPluginId() end

--- Retrieves the current plug-in defined settings for the publish service.
---@return table # The settings.
function LrPublishService:getPublishSettings() end

--- Reports the type of this object.
---@return string # 'LrPublishService'.
function LrPublishService:type() end
