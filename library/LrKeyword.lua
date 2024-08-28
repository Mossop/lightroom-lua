--- @meta

--- @class LrKeyword
--- @field catalog LrCatalog The catalog object that contains this keyword.
--- @field localIdentifier number The local identifier of the keyword, unique within this catalog.
local LrKeyword = {}

--- Reports the type of this object.
--- @param _ any
--- @return string # 'LrKeyword'
function LrKeyword.type(_) end

--- Retrieves the attributes of this keyword.
--- @return table # A table of attributes; see setAttributes(). As of Lightroom 6.0, a keywordType attribute may also be present. If the keyord is a face tag, this attribute will be present with the value "person".
function LrKeyword:getAttributes() end

--- Retrieves the children of this keyword, if any.
--- @return LrKeyword[] # The child keyword objects, or an empty array if there are no children.
function LrKeyword:getChildren() end

--- Retrieves the name of this keyword.
--- @return string # The name.
function LrKeyword:getName() end

--- Retrieves the parent of this keyword, if any.
--- @return LrKeyword # The parent keyword object, or nil if this is a top-level keyword.
function LrKeyword:getParent() end

--- Retrieves the photos that have this keyword.
function LrKeyword:getPhotos() end

--- Retrieves the synonyms for this keyword.
--- @return string[] # The synonyms.
function LrKeyword:getSynonyms() end

--- Sets attributes for this keyword.
--- @param keywordInfo table A table that contains these fields:  keywordName: (string) The name of the keyword. synonyms: (table) The names of synonyms. includeOnExport: (Boolean) True to include the keyword when the photo is exported. ignoreCase: (Boolean) True to ignore the case of the keywords when updating.  If any field is nil, does not change the value of that field.
function LrKeyword:setAttributes(keywordInfo) end

--- Sets the parent of this keyword.
--- @param parent LrKeyword The new parent of the keyword, or nil to move the keyword to the top level.
function LrKeyword:setParent(parent) end

