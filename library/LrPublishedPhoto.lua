--- @meta

--- @class LrPublishedPhoto
--- @field catalog LrCatalog The catalog object that contains this publishing-data object and the associated photo.
local LrPublishedPhoto = {}

--- Reports whether the associated photo has been edited since last published.
--- @return boolean # True if edited since last published.
function LrPublishedPhoto:getEditedFlag() end

--- Retrieves the photo associated with this publishing data.
--- @return LrPhoto # The photo object.
function LrPublishedPhoto:getPhoto() end

--- Reports the number of times the associated photo has been published by a publish service.
--- @return number # The publish count.
function LrPublishedPhoto:getPublishCount() end

--- Retrieves the unique identifier for the associated photo, as assigned by the remote service.
--- @return (string | number) # The remote ID.
function LrPublishedPhoto:getRemoteId() end

--- Retrieves the URL for the associated photo, assigned by the remote service.
--- @return string # The URL.
function LrPublishedPhoto:getRemoteUrl() end

--- Marks the associated photo as edited since last published, or unchanged since publishing.
--- @param edited boolean True if the photo has been edited, false to mark as unchanged.
function LrPublishedPhoto:setEditedFlag(edited) end

--- Updates the remote service's unique identifier associated with the published photo.
--- @param remoteID (string | number) The new ID assigned by the remote service.
function LrPublishedPhoto:setRemoteId(remoteID) end

--- Updates the URL for the associated photo.
--- @param url string The new URL assigned by the remote service.
function LrPublishedPhoto:setRemoteUrl(url) end

--- Reports the type of this object.
--- @return string # 'LrPublishedPhoto'.
function LrPublishedPhoto:type() end

