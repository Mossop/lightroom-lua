---@meta

---@class LrDevelopController
local LrDevelopController = {}

--- Registers a callback to be called any time the adjustments in the Develop module change.
---@param functionContext LrFunctionContext The function context that retains the observation.
---@param observer table An object that uniquely identifies the observer. Will be passed into the callback.
---@param callback function Function that will be called.
function LrDevelopController.addAdjustmentChangeObserver(functionContext, observer, callback) end

--- Add new Point Color Swatch.
---@param swatchTable table A table with the following fields :- SrcHue: (number) Source color's hue value. Values from 0 to 6 are allowed. SrcSat: (number) Source color's saturation value. Values from 0 to 1 are allowed. SrcLum: (number) Source color's luminance value. Values from 0 to 1 are allowed. HueShift: (optional,number) Hue shift. Values from -1 to 1 are allowed. Default: 0. SatScale: (optional,number) Saturation shift. Values from -1 to 1 are allowed. Default: 0. LumScale: (optional,number) Luminance shift. Values from -1 to 1 are allowed. Default: 0. Variance: (optional,number) Variance. Values from -1 to 1 are allowed. Default: 0. RangeAmount: (optional,number) Range amount. Values from 0 to 1 are allowed. Default: 0.5 HueRange: (optional,table) Hue range. LowerNone: (number) outer left limit. Values from 0 to 1 are allowed. LowerFull: (number) inner left limit. Values from 0 to 1 are allowed. UpperFull: (number) inner right limit. Values from 0 to 1 are allowed. UpperNone: (number) outer right limit. Values from 0 to 1 are allowed. SatRange: (optional,table) Saturation range. Follows same table format as HueRange above. LumRange: (optional,table) Luminance range. Follows same table format as HueRange above.
---@param isForMasking boolean? Set to true if targeting the point colors in masking.
---@return boolean, string # returns true if new swatch is successfully added. For failures, returns false and an error message. If given color swatch is already present but not selected, then the existing swatch would get selected and no error message is returned.
function LrDevelopController.addPointColorSwatch(swatchTable, isForMasking) end

--- Add to the current mask.
---@param maskType string type of tool to be created, one of: "brush", "gradient", "radialGradient", "rangeMask", "aiSelection".
---@param maskSubtype string subtype of tool to be created, only used when maskType is "rangeMask" or "aiSelection", one of: "color", "luminance", "depth", "subject", "sky", "background", "objects", "people", "landscape".
function LrDevelopController.addToCurrentMask(maskType, maskSubtype) end

--- Apply 'Remove' on the detected distracting people.
---@param callback function? callback function to execute after removal is done.
---@param callbackFuncArgTable table? table of arguments that would be passed to callback function.
function LrDevelopController.applyRemovalOnDetectedDistractingPeople(callback, callbackFuncArgTable) end

--- Change Denoise amount.
---@param amount number New Denoise amount value. Values from 1 to 100 are allowed.
function LrDevelopController.changeDenoiseAmount(amount) end

--- Change Reflection Removal amount.
---@param amount number New amount value of the Reflection removal. Values from -100 to 100 are allowed.
function LrDevelopController.changeReflectionRemovalAmount(amount) end

--- Change quality of Reflection Removal.
---@param quality string New quality of the Reflection removal. Allowed values: "preview", "standard", "best".
---@param callback function? callback function to execute after changing the quality.
---@param callbackFuncArgTable table? table of arguments that would be passed to callback function.
function LrDevelopController.changeReflectionRemovalQuality(quality, callback, callbackFuncArgTable) end

--- Count all spots on an image.
---@param whichFeature string? Feature name. Allowed values: "manualRemove", "distractingPeopleRemoval". Default value: "manualRemove".
---@return number # returns the count of all spots on the selected image.
function LrDevelopController.countAllSpots(whichFeature) end

--- Create a new mask.
---@param maskType string type of tool to be created, one of: "brush", "gradient", "radialGradient", "rangeMask", "aiSelection".
---@param maskSubtype string subtype of tool to be created, only used when maskType is "rangeMask" or "aiSelection", one of: "color", "luminance", "depth", "subject", "sky", "background", "objects", "people", "landscape".
function LrDevelopController.createNewMask(maskType, maskSubtype) end

--- Increments the value of a Develop adjustment.
---@param param string a Develop parameter name (see the beginning of this namespace's documentation for possible values).
---@param withClippingOn boolean? True to turn on Clipping Overlay, for example while changing Exposure
function LrDevelopController.decrement(param, withClippingOn) end

--- Delete a mask.
---@param id string
---@param param string ID of the mask to be deleted.
function LrDevelopController.deleteMask(id, param) end

--- Delete a mask tool from the current mask.
---@param id string
---@param param string ID of the mask tool to be deleted.
function LrDevelopController.deleteMaskTool(id, param) end

--- Delete Point Color Swatch.
---@param deleteAll boolean Delete all the color swatches
---@param deleteAtIndex number Delete the color swatch present at the index provided. "deleteAll" should be false if a single swatch needs to be deleted.
---@param isForMasking boolean Set to true when targeting the point colors in masking.
---@return boolean # true if deletion is successful. Returns false when the param 'deleteAtIndex' is out of bounds. i.e., no point color is present at the index provided.
function LrDevelopController.deletePointColorSwatch(deleteAll, deleteAtIndex, isForMasking) end

--- Delete selected spot.
---@param whichFeature string? Feature name. Allowed values: "manualRemove", "distractingPeopleRemoval". Default value: "manualRemove".
function LrDevelopController.deleteSelectedSpot(whichFeature) end

--- Delete selected variation.
---@param whichFeature string? Feature name. Allowed values: "manualRemove", "distractingPeopleRemoval". Default value: "manualRemove".
function LrDevelopController.deleteSelectedVariation(whichFeature) end

--- Trigger detection of distracting people.
function LrDevelopController.detectDistractingPeople() end

--- Duplicate and invert a mask.
---@param id string
---@param param string ID of the mask to be duplicated and inverted.
---@return boolean # true if the mask was successfully duplicated and inverted.
function LrDevelopController.duplicateAndInvertMask(id, param) end

--- Edit the current photo in Photoshop.
function LrDevelopController.editInPhotoshop() end

--- Get Active Color Grading View.
---@return string
function LrDevelopController.getActiveColorGradingView() end

--- Get all masks.
---@return table # A table of tables, one for each mask. Each mask entry is a table, one for each tool within that mask.
function LrDevelopController.getAllMasks() end

--- Get list of all spots on an image.
---@param whichFeature string? Feature name. Allowed values: "manualRemove", "distractingPeopleRemoval". Default value: "manualRemove".
---@return table # returns list of all the spots on the selected image.
function LrDevelopController.getAllSpots(whichFeature) end

--- Get Enhance panel state.
---@return table # returns a table with following fields - denoiseState: (bool) State of Denoise checkbox. rawDetailsState: (bool) State of Raw Details checkbox. superResState: (bool) State of Super Resolution checkbox. denoiseAmount: (number) Denoise amount. Values from 1 to 100 are possible. denoiseEnabled: (bool) True if the Denoise checkbox is enabled. rawDetailsEnabled: (bool) True if the Raw Details checkbox is enabled. superResEnabled: (bool) True if the Super Resolution checkbox is enabled. denoiseInfoText: (string) Denoise info text. rawDetailsInfoText: (string) Raw Details info text. superResInfoText: (string) Super Resolution info text. enhanceNeedsUpdate: (bool) True if Enhance needs update.
function LrDevelopController.getEnhancePanelState() end

--- Returns the process version of the current photo.
---@return string
function LrDevelopController.getProcessVersion() end

--- Gets the min and max value of a Develop adjustment.
---@param param string a Develop parameter name (see the beginning of this namespace's documentation for possible values).
---@return number, number # the min and max value for the given parameter.
function LrDevelopController.getRange(param) end

--- Get Reflection Removal panel state.
---@return table # returns a table with following fields - checkboxState: (bool) State of 'Apply' checkbox amount: (number) Amount of Reflection removal. Values from -100 to 100 are possible. quality: (string) Quality of reflection removal. Possble values: "preview", "standard", "best". enabled: (bool) True if the panel UI is enabled. isSupported: (bool) True if the current image supports reflection removal.
function LrDevelopController.getReflectionRemovalPanelState() end

--- Get Remove panel UI preferences.
---@return table # returns a table with following fields - newSpotType: (string) Spot type used for creating new spots. Possible values: "heal_patchmatch", "heal", "clone". brushSize: (number) Brush size. Values from 1 to 100 are possible. brushFeather: (number) Brush feather. Values from 0 to 100 are possible. useGenerativeAI: (bool) Value of "use generatve AI" checkbox. detectObjects: (bool) Value of "detect objects" checkbox. toolOverlay: (string) Tool overlay mode. Possble values: "always", "auto", "selected", "never". visualizeSpots: (bool) Value of "visualize Spots" checkbox. visualizationThreshold: (number) Slider value of "visualize spots". Values from 0 to 100 are possible.
function LrDevelopController.getRemovePanelPreferences() end

--- Get the selected Lens Blur Bokeh.
---@return string # Name of the Bokeh, one of: "Circle", "SoapBubble", "Blade", "Ring", or "Anamorphic".
function LrDevelopController.getSelectedLensBlurBokeh() end

--- Get selected mask.
---@return string # ID of the selected mask.
function LrDevelopController.getSelectedMask() end

--- Get selected mask tool.
---@return boolean # ID of the selected mask tool.
function LrDevelopController.getSelectedMaskTool() end

--- Get selected Point Color Swatch Index.
---@param isForMasking boolean For local point colors, set this to true and also make sure to have the masking panel open.
---@return number # returns index of the select swatch/point-color.
function LrDevelopController.getSelectedPointColorSwatchIndex(isForMasking) end

--- Get selected spot index in Remove tool.
---@param whichFeature string? Feature name. Allowed values: "manualRemove", "distractingPeopleRemoval". Default value: "manualRemove".
---@return number? # returns index of selected spot in the list of all spots. Returns nil if no spot is selected.
function LrDevelopController.getSelectedSpotIndex(whichFeature) end

--- Get selected spot params in Remove tool.
---@param whichFeature string? Feature name. Allowed values: "manualRemove", "distractingPeopleRemoval". Default value: "manualRemove".
---@return table # returns spot params table.
function LrDevelopController.getSelectedSpotParams(whichFeature) end

--- Get selected spot type in Remove tool.
---@return string, boolean # returns spotType ( "heal_patchmatch" / "heal" / "clone" ) and boolean value on whether the spot uses generative AI ( valid only for "heal_patchmatch" spot type ).
function LrDevelopController.getSelectedSpotType() end

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

--- Open Eye Correction tool for the current photo.
---@param eyeCorrectionType string? Eye correction type that is to be displayed upon opening the tool. Allowed values: "red_eye", "pet_eye". When no value is passed, last used type is displayed.
function LrDevelopController.goToEyeCorrection(eyeCorrectionType) end

--- Open Healing for the current photo.
function LrDevelopController.goToHealing() end

--- Open Masking for the current photo.
function LrDevelopController.goToMasking() end

--- Open Remove tool for the current photo.
---@param spotType string? Spot type that is to be displayed upon opening the tool. Allowed values: "heal_patchmatch", "heal", "clone". When no value is passed, last used type is displayed. Note: setRemovePanelPreferences API can also be used to change the spot type.
---@param whichFeature string? Feature name. Allowed values: "manualRemove", "reflectionRemoval", "distractingPeopleRemoval". Default value: "manualRemove".
function LrDevelopController.goToRemove(spotType, whichFeature) end

--- Open Spot Removal for the current photo.
function LrDevelopController.goToSpotRemoval() end

--- Go to next variation.
---@param whichFeature string? Feature name. Allowed values: "manualRemove", "distractingPeopleRemoval". Default value: "manualRemove".
function LrDevelopController.gotoNextVariation(whichFeature) end

--- Go to previous variation.
---@param whichFeature string? Feature name. Allowed values: "manualRemove", "distractingPeopleRemoval". Default value: "manualRemove".
function LrDevelopController.gotoPreviousVariation(whichFeature) end

--- Has filter with given name.
---@param name string Filter name. Allowed values: "enhance", "dereflect", "remove_people".
function LrDevelopController.hasFilterWithName(name) end

--- Increments the value of a Develop adjustment.
---@param param string a Develop parameter name (see the beginning of this namespace's documentation for possible values).
---@param withClippingOn boolean? True to turn on Clipping Overlay, for example while changing Exposure
function LrDevelopController.increment(param, withClippingOn) end

--- Intersect with the current mask.
---@param maskType string type of tool to be created, one of: "brush", "gradient", "radialGradient", "rangeMask", "aiSelection".
---@param maskSubtype string subtype of tool to be created, only used when maskType is "rangeMask" or "aiSelection", one of: "color", "luminance", "depth", "subject", "sky", "background", "objects", "people", "landscape".
function LrDevelopController.intersectWithCurrentMask(maskType, maskSubtype) end

--- Invert a mask.
---@param id string
---@param param string ID of the mask to be inverted.
---@return boolean # true if the mask was successfully inverted.
function LrDevelopController.invertMask(id, param) end

--- Move selected spot.
---@param leftOrRight string? pass "left" to move left, "right" to move right. empty/nil value implies no horizontal movement is desired.
---@param upOrDown string? pass "up" to move up, "down" to move down. empty/nil value implies no vertical movement is desired.
---@param horizontalUnits number? no. of units to move horizontally. Valid only when 'leftOrRight' param is set appropriately. Default: 1
---@param verticalUnits number? no. of units to move vertically. Valid only when 'upOrDown' param is set appropriately. Default: 1
---@param shouldMoveSourceArea boolean? if true, move operation would be done on source area. Valid only if selected spot type is "heal" or "clone". Default: false
function LrDevelopController.moveSelectedSpot(leftOrRight, upOrDown, horizontalUnits, verticalUnits, shouldMoveSourceArea) end

--- Refresh selected spot.
---@param whichFeature string? Feature name. Allowed values: "manualRemove", "distractingPeopleRemoval". Default value: "manualRemove".
function LrDevelopController.refreshSelectedSpot(whichFeature) end

--- Resets all Develop adjustments for the current photo.
function LrDevelopController.resetAllDevelopAdjustments() end

--- Clears all localized adjustment brushing from the current photo.
function LrDevelopController.resetBrushing() end

--- Clears all radial filter adjustments from the current photo.
function LrDevelopController.resetCircularGradient() end

--- Resets the crop angle and frame for the current photo.
function LrDevelopController.resetCrop() end

--- Reset filter with given name.
---@param name string Filter name. Allowed values: "enhance", "dereflect", "remove_people".
function LrDevelopController.resetFilterWithName(name) end

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
---@param id string
---@param param string ID of the mask to be selected.
function LrDevelopController.selectMask(id, param) end

--- Select a mask tool in current Mask.
---@param id string
---@param param string ID of the mask tool to be selected.
function LrDevelopController.selectMaskTool(id, param) end

--- Select Point Color Swatch for making HSL shifts.
---@param value number Swatch index to be selected. Integer values from 1 to 8 are allowed.
---@param isForMasking boolean this value should be set to true for local point colors and masking view needs to be active.
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

--- Toggle Enhance checkbox This function must be called from within an asynchronous task started using LrTasks, while the Develop module is active. First supported in version 15.3 of the Lightroom Classic SDK.
---@param paramName string Name of enhance feature. Allowed values: "denoise", "rawDetails", "superRes".
---@param value boolean When true, enhance feature is applied.
---@param denoiseAmount number? Denoise Amount value to use when applying Denoise. Values from 1 to 100 are allowed. Default value = 50.
function LrDevelopController.setEnhance(paramName, value, denoiseAmount) end

--- Set the Lens Blur Bokeh.
---@param bokeh string Name of the Bokeh to be set, one of: "Circle", "SoapBubble", "Blade", "Ring", or "Anamorphic".
function LrDevelopController.setLensBlurBokeh(bokeh) end

--- Sets the time threshold that determines when adjustments to different parameters will be grouped together into a single history state versus recorded separately.
---@param seconds number time threshold under which multiple adjustments will be grouped together
function LrDevelopController.setMultipleAdjustmentThreshold(seconds) end

--- Sets the process version of the current photo.
---@param value string the new process version, one of: "Version 1", "Version 2", "Version 3", "Version 4", "Version 5", or "Version 6".
function LrDevelopController.setProcessVersion(value) end

--- Set UI Preferences in Remove panel.
---@param preferencesTable table A table that includes any of the following fields can be passed :- newSpotType: (optional,string) Spot type used for creating new spots. Allowed values: "heal_patchmatch", "heal", "clone". brushSize: (optional,number) Brush size. Values from 1 to 100 are allowed. brushFeather: (optional,number) Brush feather. Values from 0 to 100 are allowed. useGenerativeAI: (optional,bool) Value of "use generatve AI" checkbox. detectObjects: (optional,bool) Value of "detect objects" checkbox. toolOverlay: (optional,string) Tool overlay mode. Allowed values: "always", "auto", "selected", "never". visualizeSpots: (optional,bool) Value of "visualize Spots" checkbox. visualizationThreshold: (optional,number) Slider value of "visualize spots". Values from 0 to 100 are allowed.
---@return boolean, string # returns true for success. For failures, returns false and an error message.
function LrDevelopController.setRemovePanelPreferences(preferencesTable) end

--- Set selected spot index in Remove tool.
---@param spotIndex number index of spot that should be selected.
---@param whichFeature string? Feature name. Allowed values: "manualRemove", "distractingPeopleRemoval". Default value: "manualRemove".
---@return boolean, string # returns true for success. For failures, returns false and an error message.
function LrDevelopController.setSelectedSpotIndex(spotIndex, whichFeature) end

--- Set selected spot params in Remove tool.
---@param spotParams table
function LrDevelopController.setSelectedSpotParams(spotParams) end

--- Set selected spot type.
---@param spotType string desired spot type. Allowed values: "heal_patchmatch", "heal", "clone".
---@param useGenAI boolean when desired spot type is "heal_patchmatch", generative AI can be enabled using this parameter.
function LrDevelopController.setSelectedSpotType(spotType, useGenAI) end

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
---@param isLocalParam boolean
function LrDevelopController.stopTracking(isLocalParam) end

--- Subtract from the current mask.
---@param maskType string type of tool to be created, one of: "brush", "gradient", "radialGradient", "rangeMask", "aiSelection".
---@param maskSubtype string subtype of tool to be created, only used when maskType is "rangeMask" or "aiSelection", one of: "color", "luminance", "depth", "subject", "sky", "background", "objects", "people", "landscape".
function LrDevelopController.subtractFromCurrentMask(maskType, maskSubtype) end

--- Toggle Enhance checkbox Must be called while the Develop module is active. First supported in version 14.5 of the Lightroom Classic SDK. Deprecated API - included for avoiding breakage of plugins
---@param paramName string Name of enhance feature. Allowed values: "denoise", "rawDetails", "superRes".
---@param denoiseAmount number? Denoise Amount value to use when applying Denoise. Values from 1 to 100 are allowed. Default value = 50.
---@param callback function? callback function to execute after the toggle.
---@param callbackFuncArgTable table? table of arguments that would be passed to callback function.
function LrDevelopController.toggleEnhance(paramName, denoiseAmount, callback, callbackFuncArgTable) end

--- Hide/unhide a mask.
---@param id string
---@param param string ID of the mask which is to be hidden/unhidden.
function LrDevelopController.toggleHideMask(id, param) end

--- Hide/unhide a mask tool in the current mask.
---@param id string
---@param param string ID of the mask tool which is to be hidden/unhidden.
function LrDevelopController.toggleHideMaskTool(id, param) end

--- Toggle the invert state of a mask tool in the current mask.
---@param id string
---@param param string ID of the mask tool whose invert state is to be toggled.
function LrDevelopController.toggleInvertMaskTool(id, param) end

--- Toggles the Visualize Depth checkbox present in the Lens Blur panel.
function LrDevelopController.toggleLensBlurDepthVisualization() end

--- Toggles the mask overlay.
function LrDevelopController.toggleOverlay() end

--- Toggles the visualize range checkbox present in the Point Color panel.
---@param isForMasking boolean? Set to true when targeting the point colors in masking.
function LrDevelopController.togglePointColorRangeVisualization(isForMasking) end

--- Toggle Reflection Removal's 'Apply' checkbox.
---@param amount number? Amount value of the Reflection removal. Values from -100 to 100 are allowed. Default value = 100.
---@param quality string? Quality of the Reflection removal. Allowed values: "preview", "standard", "best". Default value = "preview".
---@param callback function? callback function to execute after the toggle.
---@param callbackFuncArgTable table? table of arguments that would be passed to callback function.
function LrDevelopController.toggleReflectionRemoval(amount, quality, callback, callbackFuncArgTable) end

--- Update selected Point Color Swatch.
---@param colorSwatchTable table a table representing the color swatch. It should have the following fields. SrcHue: (number) Source color's hue value. Values from 0 to 6 are allowed. SrcSat: (number) Source color's saturation value. Values from 0 to 1 are allowed. SrcLum: (number) Source color's luminance value. Values from 0 to 1 are allowed. HueShift: (number) Hue shift. Values from -1 to 1 are allowed. SatScale: (number) Saturation shift. Values from -1 to 1 are allowed. LumScale: (number) Luminance shift. Values from -1 to 1 are allowed. Variance: (number) Variance. Values from -1 to 1 are allowed. RangeAmount: (number) Range amount. Values from 0 to 1 are allowed. HueRange: (table) Hue range. LowerNone: (number) outer left limit. Values from 0 to 1 are allowed. LowerFull: (number) inner left limit. Values from 0 to 1 are allowed. UpperFull: (number) inner right limit. Values from 0 to 1 are allowed. UpperNone: (number) outer right limit. Values from 0 to 1 are allowed. SatRange: (table) Saturation range. Follows same table format as HueRange above. LumRange: (table) Luminance range. Follows same table format as HueRange above.
---@param isForMasking boolean? Set to true when targeting the point colors in masking.
---@return boolean, string # returns true if swatch is updated successfully. For failures, returns false and an error message.
function LrDevelopController.updateSelectedPointColorSwatch(colorSwatchTable, isForMasking) end

return LrDevelopController
