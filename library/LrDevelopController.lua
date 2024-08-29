---@meta

---@class LrDevelopController
local LrDevelopController = {}

--- Registers a callback to be called any time the adjustments in the Develop module change.
---@param functionContext LrFunctionContext The function context that retains the observation.
---@param observer table An object that uniquely identifies the observer. Will be passed into the callback.
---@param callback  function( observer  ) Function that will be called.
function LrDevelopController.addAdjustmentChangeObserver(functionContext, observer, callback) end

--- Add new Point Color Swatch.
---@param swatchTable any
---@param isForMasking any
---@return [ boolean, string ] # - returns true if new swatch is successfully added. For failures, returns false and an error message. If given color swatch is already present but not selected, then the existing swatch would get selected and no error message is returned.
function LrDevelopController.addPointColorSwatch(swatchTable, isForMasking) end

--- Add to the current mask.
---@param maskType string type of tool to be created, one of: "brush", "gradient", "radialGradient", "rangeMask", "aiSelection".
---@param maskSubtype string subtype of tool to be created, only used when maskType is "rangeMask" or "aiSelection", one of: "color", "luminance", "depth", "subject", "sky", "background", "objects", "people".
function LrDevelopController.addToCurrentMask(maskType, maskSubtype) end

--- Create a new mask.
---@param maskType string type of tool to be created, one of: "brush", "gradient", "radialGradient", "rangeMask", "aiSelection".
---@param maskSubtype string subtype of tool to be created, only used when maskType is "rangeMask" or "aiSelection", one of: "color", "luminance", "depth", "subject", "sky", "background", "objects", "people".
function LrDevelopController.createNewMask(maskType, maskSubtype) end

--- Increments the value of a Develop adjustment.
---@param param string a Develop parameter name (see the beginning of this namespace's documentation for possible values).
---@param withClippingOn boolean? True to turn on Clipping Overlay, for example while changing Exposure
function LrDevelopController.decrement(param, withClippingOn) end

--- Delete a mask.
---@param id any
---@param param string ID of the mask to be deleted.
function LrDevelopController.deleteMask(id, param) end

--- Delete a mask tool from the current mask.
---@param id any
---@param param string ID of the mask tool to be deleted.
function LrDevelopController.deleteMaskTool(id, param) end

--- Delete Point Color Swatch.
---@param deleteAll  boolean  - Delete all the color swatches
---@param deleteAtIndex  number  - Delete the color swatch present at the index provided. "deleteAll" should be false if a single swatch needs to be deleted.
---@param isForMasking  boolean  - Set to true when targeting the point colors in masking.
---@return  boolean  # - true if deletion is successful. Returns false when the param 'deleteAtIndex' is out of bounds. i.e., no point color is present at the index provided.
function LrDevelopController.deletePointColorSwatch(deleteAll, deleteAtIndex, isForMasking) end

--- Duplicate and invert a mask.
---@param id any
---@param param string ID of the mask to be duplicated and inverted.
---@return boolean # true if the mask was successfully duplicated and inverted.
function LrDevelopController.duplicateAndInvertMask(id, param) end

--- Edit the current photo in Photoshop.
function LrDevelopController.editInPhotoshop() end

--- Get Active Color Grading View.
function LrDevelopController.getActiveColorGradingView() end

--- Get all masks.
---@return table # A table of tables, one for each mask. Each mask entry is a table, one for each tool within that mask.
function LrDevelopController.getAllMasks() end

--- Returns the process version of the current photo.
function LrDevelopController.getProcessVersion() end

--- Gets the min and max value of a Develop adjustment.
---@param param string a Develop parameter name (see the beginning of this namespace's documentation for possible values).
---@return [number, number] # the min and max value for the given parameter.
function LrDevelopController.getRange(param) end

--- Get the selected Lens Blur Bokeh.
---@return string # Name of the Bokeh, one of: "Circle", "SoapBubble", "Blade", "Ring", or "CatEye".
function LrDevelopController.getSelectedLensBlurBokeh() end

--- Get selected mask.
---@return string # ID of the selected mask.
function LrDevelopController.getSelectedMask() end

--- Get selected mask tool.
---@return boolean # ID of the selected mask tool.
function LrDevelopController.getSelectedMaskTool() end

--- Get selected Point Color Swatch Index.
---@param isForMasking  boolean  - For local point colors, set this to true and also make sure to have the masking panel open.
---@return number # - returns index of the select swatch/point-color.
function LrDevelopController.getSelectedPointColorSwatchIndex(isForMasking) end

--- Reports which tool mode is active in Develop.
---@return string # current tool mode, one of: "loupe", "crop", "dust", "redeye", "masking", "point_color", "local_point_color", "depth_refinement".
function LrDevelopController.getSelectedTool() end

--- Gets the value of a Develop adjustment for the current photo.
---@param param string a Develop parameter name (see the beginning of this namespace's documentation for possible values).
function LrDevelopController.getValue(param) end

--- Opens Graduated Filter for the current photo.
function LrDevelopController.goToDevelopGraduatedFilter() end

--- Open Radial Filter for the current photo.
function LrDevelopController.goToDevelopRadialFilter() end

--- Open Healing for the current photo.
function LrDevelopController.goToHealing() end

--- Open Masking for the current photo.
function LrDevelopController.goToMasking() end

--- Open Spot Removal for the current photo.
function LrDevelopController.goToSpotRemoval() end

--- Increments the value of a Develop adjustment.
---@param param string a Develop parameter name (see the beginning of this namespace's documentation for possible values).
---@param withClippingOn boolean? True to turn on Clipping Overlay, for example while changing Exposure
function LrDevelopController.increment(param, withClippingOn) end

--- Intersect with the current mask.
---@param maskType string type of tool to be created, one of: "brush", "gradient", "radialGradient", "rangeMask", "aiSelection".
---@param maskSubtype string subtype of tool to be created, only used when maskType is "rangeMask" or "aiSelection", one of: "color", "luminance", "depth", "subject", "sky", "background", "objects", "people".
function LrDevelopController.intersectWithCurrentMask(maskType, maskSubtype) end

--- Invert a mask.
---@param id any
---@param param string ID of the mask to be inverted.
---@return boolean # true if the mask was successfully inverted.
function LrDevelopController.invertMask(id, param) end

--- Resets all Develop adjustments for the current photo.
function LrDevelopController.resetAllDevelopAdjustments() end

--- Clears all localized adjustment brushing from the current photo.
function LrDevelopController.resetBrushing() end

--- Clears all radial filter adjustments from the current photo.
function LrDevelopController.resetCircularGradient() end

--- Resets the crop angle and frame for the current photo.
function LrDevelopController.resetCrop() end

--- Clears all graduated filter adjustments from the current photo.
function LrDevelopController.resetGradient() end

--- Clears all healing adjustments from the current photo.
function LrDevelopController.resetHealing() end

--- Clears all masks from the current photo.
function LrDevelopController.resetMasking() end

--- Clears all redeye removal adjustments from the current photo.
function LrDevelopController.resetRedeye() end

--- Clears all spot removal adjustments from the current photo.
function LrDevelopController.resetSpotRemoval() end

--- Resets a single Develop adjustment for the current photo.
---@param param string a Develop parameter name (see the beginning of this namespace's documentation for possible values).
function LrDevelopController.resetToDefault(param) end

--- Clears all transforms from the current photo.
function LrDevelopController.resetTransforms() end

--- Enables a mode where adjusting a parameter causes that panel to be automatically revealed in the panel track.
---@param reveal boolean true to enable reveal behavior, false to disable it (the default mode)
function LrDevelopController.revealAdjustedControls(reveal) end

--- Expands and scrolls into view the panel with the given ID.
---@param paramOrPanelID string either a Develop parameter or a panel ID (adjustPanel, tonePanel, mixerPanel, colorGradingPanel, detailPanel, lensCorrectionsPanel, effectsPanel, calibratePanel, or lensBlurPanel)
---@param subPanelID string? sub-panel id. For mixer panel, subPanelIDs allowed are (hslColorPanel, pointColorPanel). Introduced in version 13.2 of the Lightroom Classic SDK.
function LrDevelopController.revealPanel(paramOrPanelID, subPanelID) end

--- Expands and scrolls into view the panel with the given ID only if the right panel is visible.
---@param paramOrPanelID string either a Develop parameter or a panel ID (adjustPanel, tonePanel, mixerPanel, colorGradingPanel, detailPanel, lensCorrectionsPanel, effectsPanel, calibratePanel, or lensBlurPanel)
---@param subPanelID string? sub-panel id. For mixer panel, subPanelIDs allowed are (hslColorPanel, pointColorPanel). Introduced in version 13.2 of the Lightroom Classic SDK.
function LrDevelopController.revealPanelIfVisible(paramOrPanelID, subPanelID) end

--- Select a mask.
---@param id any
---@param param string ID of the mask to be selected.
function LrDevelopController.selectMask(id, param) end

--- Select a mask tool in current Mask.
---@param id any
---@param param string ID of the mask tool to be selected.
function LrDevelopController.selectMaskTool(id, param) end

--- Select Point Color Swatch for making HSL shifts.
---@param value number - Swatch index to be selected. Integer values from 1 to 8 are allowed.
---@param isForMasking  boolean  - this value should be set to true for local point colors and masking view needs to be active.
function LrDevelopController.selectPointColorSwatch(value, isForMasking) end

--- Select a tool mode in Develop.
---@param tool string new tool mode, one of: "loupe", "crop", "dust", "redeye", "masking", "upright", "point_color", "local_point_color", "depth_refinement".
function LrDevelopController.selectTool(tool) end

--- Set Active Color Grading View.
---@param value string the view to activate, one of: "3-way", "shadow", "midtone", "highlight", or "global".
function LrDevelopController.setActiveColorGradingView(value) end

--- Sets Auto Tone for the current photo.
function LrDevelopController.setAutoTone() end

--- Sets Auto White Balance for the current photo.
function LrDevelopController.setAutoWhiteBalance() end

--- Set the Lens Blur Bokeh.
---@param bokeh string Name of the Bokeh to be set, one of: "Circle", "SoapBubble", "Blade", "Ring", or "CatEye".
function LrDevelopController.setLensBlurBokeh(bokeh) end

--- Sets the time threshold that determines when adjustments to different parameters will be grouped together into a single history state versus recorded separately.
---@param seconds number time threshold under which multiple adjustments will be grouped together
function LrDevelopController.setMultipleAdjustmentThreshold(seconds) end

--- Sets the process version of the current photo.
---@param value string the new process version, one of: "Version 1", "Version 2", "Version 3", "Version 4", "Version 5", or "Version 6".
function LrDevelopController.setProcessVersion(value) end

--- Sets the number of seconds that tracking remains enabled after each adjustment is made.
---@param seconds number number of seconds to wait before turning off tracking.
function LrDevelopController.setTrackingDelay(seconds) end

--- Sets the value of a Develop adjustment for the current photo.
---@param param string a Develop parameter name (see the beginning of this namespace's documentation for possible values).
---@param value number the new value for the parameter
---@param withClippingOn boolean? True to turn on Clipping Overlay, for example while changing Exposure
function LrDevelopController.setValue(param, value, withClippingOn) end

--- Shows the clipping.
function LrDevelopController.showClipping() end

--- Temporarily puts the Develop module into its tracking state, causing faster, lower-quailty redraw and preventing history states from being generated.
---@param param string a Develop parameter name (see the beginning of this namespace's documentation for possible values).
function LrDevelopController.startTracking(param) end

--- Causes Develop module to exit its tracking state immediately, creating a single history state for all changes that were made to the parameter that was being tracked.
---@param isLocalParam any
function LrDevelopController.stopTracking(isLocalParam) end

--- Subtract from the current mask.
---@param maskType string type of tool to be created, one of: "brush", "gradient", "radialGradient", "rangeMask", "aiSelection".
---@param maskSubtype string subtype of tool to be created, only used when maskType is "rangeMask" or "aiSelection", one of: "color", "luminance", "depth", "subject", "sky", "background", "objects", "people".
function LrDevelopController.subtractFromCurrentMask(maskType, maskSubtype) end

--- Hide/unhide a mask.
---@param id any
---@param param string ID of the mask which is to be hidden/unhidden.
function LrDevelopController.toggleHideMask(id, param) end

--- Hide/unhide a mask tool in the current mask.
---@param id any
---@param param string ID of the mask tool which is to be hidden/unhidden.
function LrDevelopController.toggleHideMaskTool(id, param) end

--- Toggle the invert state of a mask tool in the current mask.
---@param id any
---@param param string ID of the mask tool whose invert state is to be toggled.
function LrDevelopController.toggleInvertMaskTool(id, param) end

--- Toggles the Visualize Depth checkbox present in the Lens Blur panel.
function LrDevelopController.toggleLensBlurDepthVisualization() end

--- Toggles the mask overlay.
function LrDevelopController.toggleOverlay() end

--- Toggles the visualize range checkbox present in the Point Color panel.
---@param isForMasking any
function LrDevelopController.togglePointColorRangeVisualization(isForMasking) end

--- Update selected Point Color Swatch.
---@param colorSwatchTable any
---@param isForMasking any
---@return [ boolean, string ] # - returns true if swatch is updated successfully. For failures, returns false and an error message.
function LrDevelopController.updateSelectedPointColorSwatch(colorSwatchTable, isForMasking) end

return LrDevelopController
