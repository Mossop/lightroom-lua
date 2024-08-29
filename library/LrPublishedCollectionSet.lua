---@meta

---@class LrPublishedCollectionSet
---@field catalog LrCatalog The catalog object that contains this published-collection set.
---@field localIdentifier number The local identifier of the published collection, unique within the catalog.
local LrPublishedCollectionSet = {}

--- Removes this published-collection set from the catalog.
function LrPublishedCollectionSet:delete() end

--- Retrieves the published collection sets that are immediate children of this set, if any.
---@return LrPublishedCollectionSet[] # The published-collection set objects, or an empty array.
function LrPublishedCollectionSet:getChildCollectionSets() end

--- Retrieves the published collections that are immediate children of this set.
---@return LrPublishedCollection[] # The published-collection objects.
function LrPublishedCollectionSet:getChildCollections() end

--- Retrieves all immediate members of this set, both published collections and collection sets.
---@return LrPublishedCollection and LrPublishedCollectionSet[] # The collection and set objects.
function LrPublishedCollectionSet:getChildren() end

--- Retrieves an information summary about this published collection set.
---@return any
function LrPublishedCollectionSet:getCollectionSetInfoSummary() end

--- Retrieves the current name of this set.
---@return string # The name.
function LrPublishedCollectionSet:getName() end

--- Retrieves the parent set, if any of this published-collection set.
---@return LrPublishedCollectionSet # The parent set, or nil.
function LrPublishedCollectionSet:getParent() end

--- Retrieves the remote service's unique identifier for this published collection set, as previously recorded by the plug-in.
---@return (string | number) # The remote ID.
function LrPublishedCollectionSet:getRemoteId() end

--- Retrieves the URL for this published collection set, as assigned by the remote service and previously recorded by the plug-in.
---@return (string | number) # The remote URL.
function LrPublishedCollectionSet:getRemoteUrl() end

--- Retrieves the publish service that this set belongs to.
---@return LrPublishService # The publish-service object.
function LrPublishedCollectionSet:getService() end

--- Sets the plug-in-specific settings for this published collection set.
---@param settings table The table of settings; contents are defined by the plug-in.
function LrPublishedCollectionSet:setCollectionSetSettings(settings) end

--- Sets a new name for this published collection set.
---@param name string The new name.
---@return any
function LrPublishedCollectionSet:setName(name) end

--- Sets a new parent for this published collection set.
---@param parent LrPublishedCollectionSet The new parent set in the same LrPublishService, or nil to make this an immediate child of the service that contains it.
function LrPublishedCollectionSet:setParent(parent) end

--- Sets the unique identifier for this published collection set as understood by the remote service.
---@param remoteId (string | number) The new remote ID.
function LrPublishedCollectionSet:setRemoteId(remoteId) end

--- Sets the URL for this published collection set, as provided by the remote service.
---@param url string The URL.
function LrPublishedCollectionSet:setRemoteUrl(url) end

--- Reports the type of this object.
---@return string # 'LrPublishedCollectionSet'.
function LrPublishedCollectionSet:type() end
