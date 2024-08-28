--- @meta

--- @class LrFolder
--- @field catalog LrFolder The catalog object that contains this folder.
local LrFolder = {}

--- Retrieves immediate subfolders of this folder.
--- @return LrFolder[] # The folder objects.
function LrFolder:getChildren() end

--- Retrieves the name of this folder.
--- @return string # The name.
function LrFolder:getName() end

--- Retrieves the parent of this folder.
--- @return LrFolder # The folder object.
function LrFolder:getParent() end

--- Retrieves the path of this folder.
--- @return string # The path.
function LrFolder:getPath() end

--- Retrieves the photos contained in this folder.
--- @param includeChildren boolean True to include photos in subfolders in the returned set.
--- @return LrPhoto[] # The photo objects.
function LrFolder:getPhotos(includeChildren) end

--- Reports the type of this object.
--- @return string # 'LrFolder'.
function LrFolder:type() end

