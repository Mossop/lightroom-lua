--- @meta LrSelection

--- @class LrSelection
local LrSelection = {}

--- Clears all color labels from the selection.
function LrSelection.clearLabels() end

--- Decreases the rating of the selection.
function LrSelection.decreaseRating() end

--- Removes the active photo from the selection.
function LrSelection.deselectActive() end

--- Deselects all photos except for the active photo.
function LrSelection.deselectOthers() end

--- Extends the existing selection, selecting more photos to its beginning or end.
--- @param direction string either "left" or "right"
--- @param amount number number of photos to add to the selection in that direction
function LrSelection.extendSelection(direction, amount) end

--- Sets the flag state of the selction to pick.
function LrSelection.flagAsPick() end

--- Sets the flag state of the selection to reject.
function LrSelection.flagAsReject() end

--- Returns the color label assigned to the active photo, one of: "red", "yellow", "green", "blue", "purple", "other", or "none".
--- @return string # The current color label, one of: "red", "yellow", "green", "blue", "purple", "other", or "none".
function LrSelection.getColorLabel() end

--- Returns the pick flag state of the active photo as a number (-1 = reject, 0 = none, 1 = pick).
function LrSelection.getFlag() end

--- Returns the rating of the selection as a number (0-5).
function LrSelection.getRating() end

--- Increases the rating of the selection.
function LrSelection.increaseRating() end

--- Advances the selection to the next photo in the filmstrip.
function LrSelection.nextPhoto() end

--- Advances the selection to the previous photo in the filmstrip.
function LrSelection.previousPhoto() end

--- Clears the flag state of the selection.
function LrSelection.removeFlag() end

--- Selects all photos in the filmstrip.
function LrSelection.selectAll() end

--- Selects the first photo in the selection, or in the entire filmstrip if there is no selection.
function LrSelection.selectFirstPhoto() end

--- Inverts the selection in the filmstrip.
function LrSelection.selectInverse() end

--- Selects the last photo in the selection, or in the entire filmstrip if there is no selection.
function LrSelection.selectLastPhoto() end

--- Deselects all photos in the filmstrip.
function LrSelection.selectNone() end

--- Sets the color label of the selection, one of: "red", "yellow", "green", "blue", "purple", or "none".
--- @param label string A color label name, one of: "red", "yellow", "green", "blue", "purple", or "none".
function LrSelection.setColorLabel(label) end

--- Sets the rating of the selection.
--- @param rating number A number between 0 and 5.
function LrSelection.setRating(rating) end

--- Toggles the state of the Blue color label of the selection.
function LrSelection.toggleBlueLabel() end

--- Toggles the state of the Green color label of the selection.
function LrSelection.toggleGreenLabel() end

--- Toggles the state of the Purple color label of the selection.
function LrSelection.togglePurpleLabel() end

--- Toggles the state of the Red color label of the selection.
function LrSelection.toggleRedLabel() end

--- Toggles the state of the Yellow color label of the selection.
function LrSelection.toggleYellowLabel() end

return LrSelection
