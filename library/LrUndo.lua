--- @meta LrUndo

--- @class LrUndo
local LrUndo = {}

--- Returns true of the redo command is currently enabled.
function LrUndo.canRedo() end

--- Returns true of the undo command is currently enabled.
function LrUndo.canUndo() end

--- Redoes the last undone history state.
function LrUndo.redo() end

--- Undoes the last history state.
function LrUndo.undo() end

return LrUndo
