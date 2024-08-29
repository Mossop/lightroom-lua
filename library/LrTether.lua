---@meta

---@class LrTether
local LrTether = {}

--- Returns boolean indicating whether or not each new tethered capture photo is selected.
---@return boolean # The advance selection preference.
function LrTether.getAdvanceSelectionOnTetheredCapture() end

--- Returns boolean indicating if a tethered capture session is running.
---@return boolean # True if tethered capture is active.
function LrTether.isTetherActive() end

--- Returns the number of photos currently being downloaded from the tethered camera.
---@return number # The number of photos currently being downloaded from a tethered capture.
function LrTether.numDownloadsPending() end

--- Sets the preference controlling whether or not each new tethered capture photo is selected.
---@param advance boolean New value for the advance selection preference.
function LrTether.setAdvanceSelectionOnTetheredCapture(advance) end

--- Starts a tethered capture session.
function LrTether.startTether() end

--- Stops a tethered capture session.
function LrTether.stopTether() end

--- Triggers a tethered capture.
function LrTether.triggerCapture() end

--- Triggers a tethered capture, blocking until finished.
---@return boolean # True if capture was successful, false if a problem occurred.
function LrTether.triggerCaptureBlocking() end

return LrTether
