---@meta

---@class LrDevelopPreset
local LrDevelopPreset = {}

--- Retrieves the file path of this preset.
---@return string # The path.
function LrDevelopPreset:getFile() end

--- Retrieves the name of this preset.
---@return string # The name.
function LrDevelopPreset:getName() end

--- Retrieves the parent folder of this preset.
---@return LrDevelopPresetFolder # The parent preset folder object.
function LrDevelopPreset:getParent() end

--- Retrieves the settings for this preset.
---@return table # The develop settings table. Contains these members: AutoBrightness: (Boolean) AutoContrast: (Boolean) AutoExposure: (Boolean) AutoGrayscaleWeights: (Boolean) AutoShadows: (Boolean) AutoTonality: (Boolean) BlueHue: (number) BlueSaturation: (number) Brightness: (number) ChromaticAberrationB: (number) ChromaticAberrationR: (number) ColorNoiseReduction: (number) Contrast: (number) ConvertToGrayscale: (Boolean) Dehaze: (number) Exposure: (number) FillLight: (number) GrainAmount: (number) GrainFrequency: (number) GrainSize: (number) GrayMixerBlues: (number) GrayMixerCyans: (number) GrayMixerGreens: (number) GrayMixerMagentas: (number) GrayMixerReds: (number) GrayMixerYellows: (number) GreenHue: (number) GreenSaturation: (number) HighlightRecovery: (number) HueAdjustmentBlues: (number) HueAdjustmentCyans: (number) HueAdjustmentGreens: (number) HueAdjustmentMagenhas: (number) HueAdjustmentReds: (number) HueAdjustmentYellows: (number) LuminanceAdjustmentBlues: (number) LuminanceAdjustmentCyans: (number) LuminanceAdjustmentGreens: (number) LuminanceAdjustmentMagentas: (number) LuminanceAdjustmentReds: (number) LuminanceAdjustmentYellows: (number) LuminanceSmoothing: (number) RedHue: (number) RedSaturation: (number) Saturation: (number) SaturationAdjustmentBlues: (number) SaturationAdjustmentCyans: (number) SaturationAdjustmentGreens: (number) SaturationAdjustmentMagentas: (number) SaturationAdjustmentReds: (number) SaturationAdjustmentYellows: (number) ShadowTint: (number) Shadows: (number) Sharpness: (number) SplitToningHighlightHue: (number) SplitToningHighlightSaturation: (number) SplitToningShadowHue: (number) SplitToningShadowSaturation: (number) Temperature: (number) Tint: (number) ToneCurve: (table) ToneDarks: (number) ToneHighlightSplit: (number) ToneHighlights: (number) ToneLights: (number) ToneMidtoneSplit: (number) ToneShadowSplit: (number) ToneShadows: (number) Vibrance: (number) VignetteAmount: (number) VignetteMidpoint: (number) WhiteBalance: (string)
function LrDevelopPreset:getSetting() end

--- Retrieves the unique identifier of this preset.
---@return string # The unique ID.
function LrDevelopPreset:getUuid() end

--- Reports the type of this object.
---@return string # 'LrDevelopPreset'.
function LrDevelopPreset:type() end
