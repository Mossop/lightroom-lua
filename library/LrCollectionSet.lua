--- @meta

--- @class LrCollectionSet
--- @field catalog LrCatalog The catalog object that contains this collection set.
--- @field localIdentifier number The local identifier of this collection set.
local LrCollectionSet = {}

--- Removes this collection set from the catalog.
function LrCollectionSet:delete() end

--- Retrieves the collection sets that are immediate children of this set, if any.
--- @return LrCollectionSet[] # The collection set objects, or an empty array.
function LrCollectionSet:getChildCollectionSets() end

--- Retrieves the collections that are immediate children of this set.
--- @return LrCollection[] # The collection objects.
function LrCollectionSet:getChildCollections() end

--- Retrieves all immediate members of this set, both collections and collection sets.
--- @return LrCollection and LrCollectionSet[] # The collection and set objects.
function LrCollectionSet:getChildren() end

--- Retrieves the current name of this set.
--- @return string # The name.
function LrCollectionSet:getName() end

--- Retrieves the parent set, if any of this collection set.
--- @return LrCollectionSet # The parent set, or nil.
function LrCollectionSet:getParent() end

--- Sets a new name for this collection set.
--- @param name string The new name.
function LrCollectionSet:setName(name) end

--- Sets a new parent for the collection set.
--- @param parent LrCollectionSet The new parent set, or nil to make this a top-level collection set.
function LrCollectionSet:setParent(parent) end

--- Reports the type of this object.
--- @return string # 'LrCollectionSet'.
function LrCollectionSet:type() end

