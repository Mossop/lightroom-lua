---@meta

---@class LrPhoto
---@field catalog LrCatalog The catalog object that contains this photo.
---@field localIdentifier number The local identifier of the photo, unique within this catalog.
local LrPhoto = {}

--- Adds a keyword to this photo.
---@param keyword LrKeyword The keyword object.
function LrPhoto:addKeyword(keyword) end

--- Adds or Remove photos from Target Collection.
function LrPhoto:addOrRemoveFromTargetCollection() end

--- Applies a develop preset to this photo.
---@param preset LrDevelopPreset The preset object.
---@param plugin LrPlugin? The plug-in object with which the preset is associated, if the preset was obtained using LrApplication:getDevelopPresetsForPlugin().
---@param presetAmount integer? Preset amount value. The range is 0 to 200.
---@param updateAISettings boolean? Specifies if AI Settings should be auto updated after applying the preset. Default is false
function LrPhoto:applyDevelopPreset(preset, plugin, presetAmount, updateAISettings) end

--- apply develop settings to an image.
---@param settings table table of settings to be applied.
---@param optHistoryName string? name of the history step.
---@param optFlattenAutoNow boolean? True to resolve Auto settings synchronously within the context of this API call.
function LrPhoto:applyDevelopSettings(settings, optHistoryName, optFlattenAutoNow) end

--- Applies a snapshot to the photo.
---@param id string ID of the snapshot to be applied.
function LrPhoto:applyDevelopSnapshot(id) end

--- Applies metadata presets to this photo.
---@param presetId string The unique identifier of the metadata preset. See LrApplication.metadataPresets.
function LrPhoto:applyMetadataPreset(presetId) end

--- Creates a smart preview for the photo.
---@return string # A string indicating the result: 'created' if a smart preview was built, 'existed' if a smart preview already existed, 'failed' if smart preview creation failed, e.g. when invoked on a video object.
function LrPhoto:buildSmartPreview() end

--- Reports whether this photo is believed to be present on disk at this time.
---@return boolean # True if file is thought to exist at this time.
function LrPhoto:checkPhotoAvailability() end

--- Copy settings of an image which are already selected in the UI.
---@return boolean # True if copy settings is successful.
function LrPhoto:copySettings() end

--- Creates a develop snapshot of this photo.
---@param snapshotName string The name of the new snapshot.
---@param updateInPlace boolean True to update the snapshot in place, if one already exists with this name. If false, take no action and return false.
---@return boolean # True on success. False if a snapshot with this name already exists and was not updated.
function LrPhoto:createDevelopSnapshot(snapshotName, updateInPlace) end

--- Deletes a snapshot of the photo.
---@param id string ID of the snapshot to be deleted.
function LrPhoto:deleteDevelopSnapshot(id) end

--- Deletes the photo's smart preview, if one exists.
---@return string # A string indicating the result: 'deleted' if deletion was successful, 'failed' if the deletion failed. In the failure case, a second string may be returned indicating in more detail what the error condition was.
function LrPhoto:deleteSmartPreview() end

--- Retrieves the photo collections that contain this photo.
---@return LrCollection[] # The list of collection objects.
function LrPhoto:getContainedCollections() end

--- Retrieves the published photo collections that contain this photo.
---@return LrPublishedCollection[] # The list of collection objects.
function LrPhoto:getContainedPublishedCollections() end

--- Retrieves the current develop settings for this photo.
---@return table # Develop settings table. Contains the following members. AutoBrightness: (boolean) AutoContrast: (boolean) AutoExposure: (boolean) AutoShadows: (boolean) BlueHue: (number) BlueSaturation: (number) Brightness: (number) CameraProfile: (string) ChromaticAberrationB: (number) ChromaticAberrationR: (number) Clarity: (number) ColorNoiseReduction: (number) ColorNoiseReductionDetail: (number) Contrast: (number) ConvertToGrayscale: (boolean) CropAngle: (number) CropBottom: (number) CropLeft: (number) CropRight: (number) CropTop: (number) Dehaze: (number) Defringe: (number) EnableCalibration: (boolean) EnableColorAdjustments: (boolean) EnableDetail: (boolean) EnableEffects: (boolean) EnableGrayscaleMix: (boolean) EnableLensCorrections: (boolean) EnableTransform: (boolean) EnableRedEye: (boolean) EnableRetouch: (boolean) EnableSplitToning: (boolean) Exposure: (number) FillLight: (number) GrainAmount: (number) GrainFrequency: (number) GrainSize: (number) GreenHue: (number) GreenSaturation: (number) HighlightRecovery: (number) HueAdjustmentAqua: (number) HueAdjustmentBlue: (number) HueAdjustmentGreen: (number) HueAdjustmentMagenha: (number) HueAdjustmentOrange: (number) HueAdjustmentPurple: (number) HueAdjustmentRed: (number) HueAdjustmentYellow: (number) LuminanceAdjustmentAque: (number) LuminanceAdjustmentBlue: (number) LuminanceAdjustmentGreen: (number) LuminanceAdjustmentMagenta: (number) LuminanceAdjustmentOrange: (number) LuminanceAdjustmentPurple: (number) LuminanceAdjustmentRed: (number) LuminanceAdjustmentYellow: (number) LuminanceNoiseReductionContrast: (number) LuminanceNoiseReductionDetail: (number) LuminanceSmoothing: (number) ParametricDarks: (number) ParametricHighlightSplit: (number) ParametricHighlights: (number) Parametriclights: (number) ParametricMidtoneSplit: (number) ParametricShadowSplit: (number) ParametricShadows: (number) PostCropVignetteAmount: (number) PostCropVignetteFeather: (number) PostCropVignetteHighlightContrast: (number) PostCropVignetteMidpoint: (number) PostCropVignetteRoundness: (number) PostCropVignetteStyle: (number) ProcessVersion: (string) RedEyeInfo: (table) RedHue: (number) RedSaturation: (number) RetouchInfo: (table) Saturation: (number) SaturationAdjustmentAqua: (number) SaturationAdjustmentBlue: (number) SaturationAdjustmentGreen: (number) SaturationAdjustmentMagenta: (number) SaturationAdjustmentOrange: (number) SaturationAdjustmentPurple: (number) SaturationAdjustmentRed: (number) SaturationAdjustmentYellow: (number) ShadowTint: (number) Shadows: (number) SharpenDetail: (number) SharpenEdgeMasking: (number) SharpenRadius: (number) Sharpness: (number) SplitToningBalance: (number) SplitToningHighlightHue: (number) SplitToningHighlightSaturation: (number) SplitToningShadowHue: (number) SplitToningShadowSaturation: (number) ToneCurve: (table) ToneCurveName: (string) Vibrance: (number) VignetteAmount: (number) VignetteMidpoint: (number) WhiteBalance: (string) orientation: (string) The following items are first provided in version 4.0 of the Lightroom SDK TrimStart: (table) A table containing 'numerator' and 'denominator' for the fraction representing the trim start point in seconds. Only available for video. TrimEnd: (table) A table containing 'numerator' and 'denominator' for the fraction representing the trim end point in seconds. Only available for video. Blacks2012: (number) Clarity2012: (number) Contrast2012: (boolean) Exposure2012: (number) Highlights2012: (number) Shadows2012: (number) ToneCurvePV2012: (table) ToneCurvePV2012Blue: (table) ToneCurvePV2012Green: (table) ToneCurvePV2012Red: (table) ToneCurveName2012: (string) Whites2012: (number) The following items are first provided in version 11.0 of the Lightroom Classic SDK EnableMaskGroupBasedCorrections: (boolean) MaskGroupBasedCorrections: (table) The following items are first provided in version 13.0 of the Lightroom Classic SDK HDREditMode: (number) HDRMaxValue: (number) SDRBrightness: (number) SDRContrast: (number) SDRClarity: (number) SDRHighlights: (number) SDRShadows: (number) SDRWhites: (number) SDRBlend: (number) LensBlur: (table) DepthMapInfo: (table) PointColors: (table)
function LrPhoto:getDevelopSettings() end

--- Get all the snapshots of the photo.
---@return table # A table of tables, one for each snapshot. Each snapshot entry contains snapshotID, name and id_global.
function LrPhoto:getDevelopSnapshots() end

--- Retrieves display-formatted metadata from this photo.
---@param key string Which metadata item to retrieve, return an array of all available metadata fields as key/value pairs if nil. These valid keys return these values: keywordTags: (string) The list of keywords as shown in the Keyword Tags panel (with Enter Keywords selected). This is the exact set of tags that were directly applied to the photo without any filtering for "Show on Export" flags, etc. keywordTagsForExport: (string) The list of keywords as shown in the Keyword Tags panel (with Will Export selected). First supported as of Lightroom 2.0. This removes tags that were meant to be hidden via "Show on Export" and inserts all of the parents and ancestor tags (except when silenced via "Export Containing Keywords"). fileName: (string) The leaf name of the file (for example, "myFile.jpg") preservedFileName: (string) The preserved file name of the file copyName: (string) The name associated with this copy folderName: (string) The name of the folder the file is in fileSize: (string) The formatted size of the file, or, if the file is offline, but there is a smart preview, the size of the smart preview (for example, "6.01 MB") fileType: (string) The user-visible file type (DNG, RAW, etc.) rating: (number) The user rating of the file (either nil or number of stars) label: (string) The name of assigned color label title: (string) The title of photo caption: (string) The caption for photo dimensions: (string) The original dimensions of file (for example, "3072 x 2304") croppedDimensions: (string) The cropped dimensions of file (for example, "3072 x 2304") exposure: (string) The exposure summary (for example, "1/60 sec at f/2.8") shutterSpeed: (string) The shutter speed (for example, "1/60 sec") aperture: (string) The aperture (for example, "f/2.8") brightnessValue: (string) The brightness value (HELP: need an example) exposureBias: (string) The exposure bias/compensation (for example, "-2/3 EV") flash: (string) Whether the flash fired or not (for example, "Did fire") exposureProgram: (string) The exposure program (for example, "Aperture priority") meteringMode: (string) The metering mode (for example, "Pattern") isoSpeedRating: (string) The ISO speed rating (for example, "ISO 200") focalLength: (string) The focal length of lens as shot (for example, "132 mm") focalLength35mm: (string) The focal length as 35mm equivalent (for example, "211 mm") lens: (string) The lens (for example, "28.0-135.0 mm") subjectDistance: (string) The subject distance (for example, "3.98 m") dateTimeOriginal: (string) The date and time of capture (for example, "09/15/2005 17:32:50") Formatting can vary based on the user's localization settings dateTimeDigitized: (string) The date and time of scanning (for example, "09/15/2005 17:32:50") Formatting can vary based on the user's localization settings dateTime: (string) Adjusted date and time (for example, "09/15/2005 17:32:50") Formatting can vary based on the user's localization settings cameraMake: (string) The camera manufacturer cameraModel: (string) The camera model cameraSerialNumber: (string) The camera serial number artist: (string) The artist's name software: (string) The software used to process/create photo gps: (string) The location of this photo (for example, "37°56'10" N 27°20'42" E") gpsAltitude: (string) The GPS altitude for this photo (for example, "82.3 m") creator: (string) The name of the person that created this image creatorJobTitle: (string) The job title of the person that created this image creatorAddress: (string) The address for the person that created this image creatorCity: (string) The city for the person that created this image creatorStateProvince: (string) The state or province for the person that created this image creatorPostalCode: (string) The postal code for the person that created this image creatorCountry: (string) The country for the person that created this image creatorPhone: (string) The phone number for the person that created this image creatorEmail: (string) The email address for the person that created this image creatorUrl: (string) The web URL for the person that created this image headline: (string) A brief, publishable synopsis or summary of the contents of this image iptcSubjectCode: (string) Values from the IPTC Subject NewsCode Controlled Vocabulary (see: http://www.newscodes.org/) descriptionWriter: (string) The name of the person who wrote, edited or corrected the description of the image iptcCategory: (string) Deprecated field; included for transferring legacy metadata iptcOtherCategories: (string) Deprecated field; included for transferring legacy metadata dateCreated: (string) The IPTC-formatted creation date (for example, "2005-09-20T15:10:55Z") intellectualGenre: (string) A term to describe the nature of the image in terms of its intellectual or journalistic characteristics, such as daybook, or feature (examples at: http://www.newscodes.org/) scene: (string) Values from the IPTC Scene NewsCodes Controlled Vocabulary (see: http://www.newscodes.org/) location: (string) Details about a location shown in this image city: (string) The name of the city shown in this image stateProvince: (string) The name of the state shown in this image country: (string) The name of the country shown in this image isoCountryCode: (string) The 2 or 3 letter ISO 3166 Country Code of the country shown in this image jobIdentifier: (string) A number or identifier needed for workflow control or tracking instructions: (string) Information about embargoes, or other restrictions not covered by the Rights Usage field provider: (string) Name of person who should be credited when this image is published source: (string) The original owner of the copyright of this image copyright: (string) The copyright text for this image copyrightState: (string) The copyright state for this image rightsUsageTerms: (string) Instructions on how this image can legally be used copyrightInfoUrl The following items are first supported in version 3.0 of the Lightroom SDK. For details of IPTC Extension definitions, see http://www.iptc.org/std/photometadata/2008/specification/. For details of PLUS definitions, see http://ns.useplus.org/LDF/ldf-XMPReference personShown: (string) Name of a person shown in this image locationCreated: (table) The location where the photo was taken. Each element in the return table is a table which is a structure named LocationDetails as defined in the IPTC Extension spec. locationShown: (table) The location shown in this image. Each element in the return table is a table which is a structure named LocationDetails as defined in the IPTC Extension spec. nameOfOrgShown: (string) Name of the organization or company featured in this image codeOfOrgShown: (string) Code from a controlled vocabulary for identifying the organization or company featured in this image event: (string) Names or describes the specific event at which the photo was taken artworksShown: (table) A set of metadata about artwork or an object in the image. Each element in the return table is a table which is a structure named ArtworkOrObjectDetails as defined in the IPTC Extension spec. additionalModelInfo: (string) Information about the ethnicity and other facets of model(s) in a model-released image modelAge: (string) Age of human model(s) at the time this image was taken in a model released image minorModelAge: (string) Age of the youngest model pictured in the image, at the time that the image was made modelReleaseStatus: (string) Summarizes the availability and scope of model releases authorizing usage of the likenesses of persons appearing in the photo modelReleaseID: (string) A PLUS-ID identifying each Model Release imageSupplier: (table) Identifies the most recent supplier of this photo, who is not necessarily its owner or creator. Each element in the table is a table that is a structure named ImageSupplierDetail defined in PLUS. imageSupplierImageId: (string) Identifier assigned by the Image Supplier. registryId: (table) Both a Registry Item Id and a Registry Organization Id to record any registration of this photo with a registry. Each element in the return table is a table which is a structure named RegistryEntryDetail as defined in the IPTC Extension spec. maxAvailWidth: (number) The maximum available width in pixels of the original photo from which this photo has been derived by downsizing maxAvailHeight: (number) The maximum available height in pixels of the original photo from which this photo has been derived by downsizing sourceType: (string) The type of the source of this digital image, selected from a controlled vocabulary imageCreator: (table) Creator or creators of the image. Each element in the return table is a table which is a structure named ImageCreatorDetail defined in PLUS. copyrightOwner: (table) Owner or owners of the copyright in the licensed image. Each element in the return table is a table which is a structure named CopyrightOwnerDetail defined in PLUS. licensor: (table) A person or company that should be contacted to obtain a license for using the photo, or who has licensed the photo. Each element in the return table is a table which is a structure named LicensorDetail defined in PLUS. propertyReleaseID: (string) A PLUS-ID identifying each Property Release propertyReleaseStatus: (string) Summarizes the availability and scope of property releases authorizing usage of the likenesses of persons appearing in the image. digImageGUID: (string) Globally unique identifier for the item, created and applied by the creator of the item at the time of its creation plusVersion: (string) The version number of the PLUS standards in place at the time of the transaction The following items are first supported in version 6.0 of the Lightroom SDK. gpsImgDirection: (string) The GPS direction for this photo (for example, "South-East") The following are the video items supported by this API. duration: (string) Duration of the video in format of HH:mm:ss:SSS. trimmedDuration: (string) Trimmed duration of the trimmed video in format of HH:mm:ss:SSS. frameRate: (string) Frame Rate of the video. The following items are first supported in version 13.2 of the Lightroom Classic SDK. altTextAccessibility: (string) Brief textual description of the purpose and meaning of an image extDescrAccessibility: (string) Detailed textual description of the purpose and meaning of an image
---@return (string | table) # The formatted-string value of the specified metadata property, or nil if not applicable. If no key is specified, returns a table of all available metadata fields as key/value pairs.
function LrPhoto:getFormattedMetadata(key) end

--- Creates a new name for the photo in a filename preset.
---@param filenamePresetId string The unique identifier of the filename preset.
---@param customString string The name string.
---@param sequenceNumber number The sequence number to append to the name string.
---@return string # The new name.
function LrPhoto:getNameViaPreset(filenamePresetId, customString, sequenceNumber) end

--- Retrieves plug-in-specific metadata for this photo, as declared in an LrMetadataProvider script.
---@param plugin (string | LrPlugin) The plug-in object or unique identifying string for the plug-in that declares this field.
---@param fieldId string The metadata field's unique identifying key.
---@param optVersion number? The version number for the field (only valid in schema update handlers).
---@param noThrow boolean? True to return an error (nil, error) instead of throwing an exception on error. (First supported in version 3.0 of the Lightroom SDK.)
function LrPhoto:getPropertyForPlugin(plugin, fieldId, optVersion, noThrow) end

--- Retrieves unformatted metadata from this photo.
---@param key string The metadata item to retrieve, of nil to get all available metadata fields. These valid keys return these values: fileSize: (number) The size of the file in bytes, or, if the file is offline, but there is a smart preview, the size of the smart preview in bytes rating: (number) The user rating of the file (either nil or number of stars) dimensions: (table) The original dimensions of file (for example, { width = 2304, height = 3072 } ) croppedDimensions: (table) The cropped dimensions of file (for example, { width = 2304, height = 3072 } ) shutterSpeed: (number) The shutter speed, in seconds (for example, 1/60 sec = 0.016666) aperture: (number) The denominator of the aperture (for example, 2.8) exposureBias: (number) The exposure bias/compensation (for example, -0.666666) flash: (Boolean) Whether flash fired or not (true = flash fired; false = flash did not fire; nil = unknown) isoSpeedRating: (number) The ISO speed rating (for example, 200) focalLength: (number) The focal length of lens as shot, in millimeters (for example, 132) focalLength35mm: (number) The focal length as 35mm equivalent, in millimeters (for example, 211.2) dateTimeOriginal: (number) The date and time of capture (seconds since midnight GMT January 1, 2001) dateTimeDigitized: (number) The date and time of scanning (seconds since midnight GMT January 1, 2001) dateTime: (number) The adjusted date and time (seconds since midnight GMT January 1, 2001) gps: (table) The location of this photo (for example, { latitude = 37.9362, longitude = 27.3451 } ) gpsAltitude: (number) The GPS altitude for this photo, in meters (for example, 82.317) countVirtualCopies: (number) The number of virtual copies of this photo. Zero if this photo is itself a virtual copy. virtualCopies: (array of LrPhoto) All virtual copies of this photo. masterPhoto: (LrPhoto) The master photo from which this virtual copy is derived. isVirtualCopy: (Boolean) True if this photo is a virtual copy of another photo. countStackInFolderMembers: (number) The number of the members of the stack that this photo is in. stackInFolderMembers: (array of LrPhoto) All members of the stack that this photo is in. isInStackInFolder: (Boolean) True if the photo is in a stack. stackInFolderIsCollapsed: (Boolean) True if the stack containing this photo is collapsed. stackPositionInFolder: (number) The position of this photo in the stack. The top of the stack is at position 1; other photos are numbered sequentially starting from 2. topOfStackInFolderContainingPhoto: (LrPhoto) The parent photo of the stack containing this photo. colorNameForLabel: (string) The color name corresponding to the color label associated with this photo. One of 'red', 'yellow', 'green', 'blue', 'purple', 'none'. The following items are first supported in version 2.0 of the Lightroom SDK. fileFormat: (string) The format of the file. One of 'RAW', 'DNG', 'JPG', 'PSD', 'TIFF', or 'VIDEO'. width: (number) The width of the original source photo in pixels. height: (number) The height of the original source photo in pixels. aspectRatio: (number) The aspect ratio of the photo (defined as width / height). (For example, a standard 35mm photo in landscape mode returns 1.5.). isCropped: (Boolean) True if the photo has been cropped in Lightroom from its original dimensions. dateTimeOriginalISO8601: (string) The date and time of capture (ISO 8601 string format). dateTimeDigitizedISO8601: (string) The date and time of scanning (ISO 8601 string format). dateTimeISO8601: (string) The adjusted date and time (ISO 8601 string format). lastEditTime: (number) The date and time of the last edit to this photo (seconds since midnight GMT January 1, 2001). editCount: (number) Counter for edits on this photo. (Warning: This is not an absolute counter. Consecutive changes within a few seconds are counted as a single edit.) copyrightState: (string) The copyright state for this image. One of 'unknown', 'copyrighted', or 'public domain'. The following items are first supported in version 3.0 of the Lightroom SDK. uuid: (string) Persistent ID for this photo path: (string) The current path to the photo file if available; otherwise, the last known path to the file. isVideo: (boolean) True if this file is a video. durationInSeconds: (number) The duration in seconds if the file is a video. keywords: (array of LrKeyword) The list of keyword objects for the photo. customMetadata: (table) Custom metadata for this photo as shown in the Metadata panel. Each element in the return table is a table that describes one metadata field associated with a photo, with these entries: id (string): A unique identifier for this field. value (any): The value for this field, if any. sourcePlugin (string): The unique identifier of the plug-in that defines the custom metadata. The following items are first supported in version 4.0 of the Lightroom SDK. pickStatus: (number) 1 if the photo's flag status is 'picked', 0 if the photo's flag is not set, -1 if the photo's flag status is 'rejected'. The following items are first supported in version 4.1 of the Lightroom SDK. trimmedDurationInSeconds: (number) If the file is a video, the trimmed duration of the video in seconds, otherwise nil. durationRatio: (table) If the file is a video, a table, otherwise nil. The table has keys 'numerator' and 'denominator', which combine to the untrimmed duration of the video in seconds. trimmedDurationRatio: (table) If the file is a video, a table, otherwise nil. The table has keys 'numerator' and 'denominator', which combine to the trimmed duration of the video in seconds. locationIsPrivate: (Boolean) True if the photo's location has been marked as private in Lightroom. The following items are first supported in version 5.0 of the Lightroom SDK. smartPreviewInfo: (table) A table containing information pertaining to the smart preview for the photo. If no smart preview exists, the table is empty. The table has these entries: smartPreviewPath (string): The path to the smart preview. smartPreviewSize (number): The size of the smart preview in bytes. The following items are first supported in version 6.0 of the Lightroom SDK. gpsImgDirection: (number) The GPS direction for this photo, in degrees (for example, 312.23). Note that only up to four digits beyond the decimal point are stored. The following items are first supported in version 12.1 of the Lightroom SDK. bitDepth: (number) Bit depth of the image. The following items are first supported in version 13.2 of the Lightroom Classic SDK. altTextAccessibility: (string) Brief textual description of the purpose and meaning of an image extDescrAccessibility: (string) Detailed textual description of the purpose and meaning of an image The following items are first supported in version 13.3 of the Lightroom SDK. isExported: (Boolean) True if this photo has been exported from the catalog.
---@return any # The value of the specified metadata property as the appropriate data type, or nil if not applicable. If no key is specified, returns a table of all available metadata fields as key/value pairs.
function LrPhoto:getRawMetadata(key) end

--- Opens export dialog for the current photo.
function LrPhoto:openExportDialog() end

--- Opens export with previous settings for the current photo.
function LrPhoto:openExportWithPreviousDialog() end

--- Paste settings to an image.
---@param updateAISettings boolean? Specifies if AI Settings should be auto updated after applying the preset. Default is false
---@return boolean # True if paste settings is successful.
function LrPhoto:pasteSettings(updateAISettings) end

--- Sets the value of a Develop adjustment for the current photo.
---@param settingName string can be "Exposure", "Contrast", "Highlights", "Shadows", "Whites", "Blacks", "Clarity", "Vibrance", "Saturation"
---@param size (string | number) can be "small", "large" or a "number"
function LrPhoto:quickDevelopAdjustImage(settingName, size) end

--- Adjust the White Balance parameters [Temperature (or) Tint] for the current photo.
---@param settingName string White Balance parameter name ("Temperature" or "Tint").
---@param amount number is incremental number.
function LrPhoto:quickDevelopAdjustWhiteBalance(settingName, amount) end

--- Sets the aspect ratio for the current photo.
---@param aspectRatio (string | table) can be "original", "asshot" or a table specifying Crop Ratio with w and h values.
function LrPhoto:quickDevelopCropAspect(aspectRatio) end

--- Sets the Treatment for the current photo.
---@param value string can be "color" or "grayscale"
function LrPhoto:quickDevelopSetTreatment(value) end

--- Sets the White Balance for the current photo.
---@param value string can be "Auto", "Daylight", "Cloudy", "Shade", "Tungsten", "Fluorescent" and "Flash" as applicable to the image type
function LrPhoto:quickDevelopSetWhiteBalacne(value) end

--- Sets the White Balance for the current photo.
---@param value string can be "Auto", "Daylight", "Cloudy", "Shade", "Tungsten", "Fluorescent" and "Flash" as applicable to the image type
function LrPhoto:quickDevelopSetWhiteBalance(value) end

--- Removes a keyword from this photo.
---@param keyword LrKeyword The keyword object.
function LrPhoto:removeKeyword(keyword) end

--- Requests a JPEG thumbnail of this photo.
---@param width number? The width of the thumbnail you're requesting. Leaving this nil will result in the smallest preview size being returned.
---@param height number? If you're specifying width, this controls the height of the pixels returned.
---@param callback function The function that will be called when the thumbnail is available. This function receives either one or two parameters: the JPEG data if it is successful, or nil and an error string if it fails.
---@return table # Request object. Hold a reference to this object until your callback is called, then release it.
function LrPhoto:requestJpegThumbnail(width, height, callback) end

--- Rotates the photo left side.
function LrPhoto:rotateLeft() end

--- Rotates the photo right side..
function LrPhoto:rotateRight() end

--- Sets a plug-in-specific metadata value for this photo.
---@param plugin LrPlugin The plug-in object.
---@param fieldId string The field name, as declared in an LrMetadataProvider script.
---@param value string The new value for this field. This must agree with data type specified for the field, if any.
---@param optVersion number? The version number for the field (only valid in schema update handlers). (First supported as of Lightroom 3.0.)
function LrPhoto:setPropertyForPlugin(plugin, fieldId, value, optVersion) end

--- Sets metadata for this photo.
---@param key string The metadata item to set. The following keys are recognized: rating: (number) The user rating of the file (either nil or number of stars). label: (string) The name of assigned color label. title: (string) The title of this photo. caption: (string) The caption for this photo copyName: (string) The name associated with this copy. creator: (string) The name of the person that created this image. creatorJobTitle: (string) The job title of the person that created this image. creatorAddress: (string) The address for the person that created this image. creatorCity: (string) The city for the person that created this image. creatorStateProvince: (string) The state or province for the person that created this image. creatorPostalCode: (string) The postal code for the person that created this image. creatorCountry: (string) The country for the person that created this image. creatorPhone: (string) The phone number for the person that created this image. creatorEmail: (string) The email address for the person that created this image. creatorUrl: (string) The web URL for the person that created this image. headline: (string) A brief, publishable synopsis or summary of the contents of this image. iptcSubjectCode: (string) Values from the IPTC Subject NewsCode Controlled Vocabulary (see: http://www.newscodes.org/). descriptionWriter: (string) The name of the person who wrote, edited, or corrected the description of the image. iptcCategory: (string) Deprecated field; included for transferring legacy metadata. iptcOtherCategories: (string) Deprecated field; included for transferring legacy metadata dateCreated: (string) The IPTC-formatted creation date (for example, "2005-09-20T15:10:55Z"). intellectualGenre: (string) A term to describe the nature of the image in terms of its intellectual or journalistic characteristics, such as daybook, or feature (examples at: http://www.newscodes.org/). scene: (string) Values from the IPTC Scene NewsCodes Controlled Vocabulary (see: http://www.newscodes.org/). location: (string) Details about a location shown in this image. city: (string) The name of the city shown in this image. stateProvince: (string) The name of the state shown in this image. country: (string) The name of the country shown in this image. isoCountryCode: (string) The 2 or 3 letter ISO 3166 Country Code of the country shown in this image. jobIdentifier: (string) A number or identifier needed for workflow control or tracking. instructions: (string) Information about embargoes, or other restrictions not covered by the Rights Usage field. provider: (string) Name of person who should be credited when this image is published. source: (string) The original owner of the copyright of this image. copyright: (string) The copyright text for this image. copyrightState: (string) The copyright state for this image. One of 'unknown', 'copyrighted', or 'public domain'. rightsUsageTerms: (string) Instructions on how this image can legally be used. copyrightInfoUrl colorNameForLabel: (string) The color name corresponding to the color label associated with this photo. One of 'red', 'yellow', 'green', 'blue', 'purple', 'none', not case sensitive. Supplying any other string will cause the photo to be displayed with a white color label indicator, just like it would if the same value were typed into the 'Label' field in the 'Metadata' panel. The following items are first supported in version 3.0 of the Lightroom SDK. For details of IPTC Extension definitions, see http://www.iptc.org/std/photometadata/2008/specification/. For details of PLUS definitions, see http://ns.useplus.org/LDF/ldf-XMPReference personShown: (string) Name of a person shown in this image. locationCreated: (table) The Locations shown in this image. Each element in the table is a table that is a structure named LocationDetails as defined in the IPTC Extension spec. locationShown: (table) The locations where this photo was taken. Each element in the table is a table that is a structure named LocationDetails as defined in the IPTC Extension spec. nameOfOrgShown: (string) Name of the organization or company featured in this image. codeOfOrgShown: (string) Code from a controlled vocabulary for identifying the organization or company featured in this image. event: (string) Names or describes the specific event at which this photo was taken. artworksShown: (table) A set of metadata about artwork or an object in this image. Each element in the table is a table that is a structure named ArtworkOrObjectDetails, as defined in the IPTC Extension spec. additionalModelInfo: (string) Information about the ethnicity and other facets of models in a model-released image. modelAge: (string) Age of human models at the time this image was taken in a model-released image. minorModelAge: (string) Age of the youngest model pictured in this image, at the time that the image was made. modelReleaseStatus: (string) Summarizes the availability and scope of model releases authorizing usage of the likenesses of persons appearing in this image. modelReleaseID: (string) A PLUS-ID identifying each Model Release. imageSupplier: (table) Identifies the most recent supplier of this photo, who is not necessarily its owner or creator. Each element in the table is a table that is a structure named ImageSupplierDetail defined in PLUS. imageSupplierImageId: (string) Identifier assigned by the Image Supplier. registryId: (table) Both a Registry Item ID and a Registry Organization ID to record any registration of this item with a registry. Each element in the table is a table that is a structure named RegistryEntryDetail, as defined in the IPTC Extension spec. maxAvailWidth: (number) The maximum available width in pixels of the original photo from which this photo has been derived by downsizing. maxAvailHeight: (number) The maximum available height in pixels of the original photo from which this photo has been derived by downsizing. sourceType: (string) The type of the source of this digital image, selected from a controlled vocabulary. imageCreator: (table) Creator or creators of this image. Each element in the table is a table that is a structure named ImageCreatorDetail defined in PLUS. copyrightOwner: (table) Owner or owners of the copyright in this licensed image. Each element in the table is a table that is a structure named CopyrightOwnerDetail defined in PLUS. licensor: (table) A person or company that should be contacted to obtain a license for using this photo or who has licensed the photo. Each element in the table is a table that is a structure named LicensorDetail defined in PLUS. propertyReleaseID: (string) A PLUS-ID identifying each property release. propertyReleaseStatus: (string) Summarizes the availability and scope of property releases authorizing usage of the likenesses of persons appearing in this image. The following items are first supported in version 4.0 of the Lightroom SDK. gps: (table) The location of this photo, for example, { latitude = 35.1, longitude = 86.7 }. Pass nil to 'unset'. gpsAltitude: (number) The GPS altitude for this photo, in meters, for example, 82.3 pickStatus: (number) 1 for flag status 'picked', 0 for 'not set', -1 for 'rejected'. The following items are first supported in version 6.0 of the Lightroom SDK. gpsImgDirection: (number) The GPS direction for this photo, in degrees (for example, 312.23). Note that only up to four digits beyond the decimal point are stored. The following items are first supported in version 13.2 of the Lightroom Classic SDK. altTextAccessibility: (string) Brief textual description of the purpose and meaning of an image extDescrAccessibility: (string) Detailed textual description of the purpose and meaning of an image
---@param value any The value to set for this metadata item. See above list for acceptable value types. (String if not otherwise specified.)
function LrPhoto:setRawMetadata(key, value) end

--- Reports the type of this object.
---@return string # 'LrPhoto'.
function LrPhoto:type() end

--- Updates AI Settings for this photo.
function LrPhoto:updateAISettings() end
