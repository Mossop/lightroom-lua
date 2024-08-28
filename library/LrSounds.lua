--- @meta LrSounds

--- @class LrSounds
local LrSounds = {}

--- Returns an array of system sounds that can be played via playSystemSound.
--- @return table # Array of sounds.
function LrSounds.getSystemSounds() end

--- Plays a system sound.
--- @param systemSound table One of the values returned by getSystemSounds.
function LrSounds.playSystemSound(systemSound) end

return LrSounds
