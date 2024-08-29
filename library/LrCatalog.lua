---@meta

---@class LrCatalog
---@field hasPrivateWriteAccess any
---@field hasWriteAccess any
---@field kAllPhotos string The "All Photographs" collection in the "Catalog" section of the library left-side panel, see LrCatalog:setActiveSources().
---@field kLastCatalogExport string The "Last catalog export" collection in the "Catalog" section of the library left-side panel.
---@field kPreviousImport string The "Previous import" collection in the "Catalog" section of the library left-side panel, see LrCatalog:setActiveSources().
---@field kQuickCollectionIdentifier string The "Quick collection" collection in the "Catalog" section of the library left-side panel, see LrCatalog:setActiveSources().
---@field kTargetCollection string The collection currently set as the target for adding operations; See LrCatalog:setActiveSources().
---@field kTemporaryImages string The "Temporary Images" collection, which might be named, for example, "Photos That Failed to Export", or "Missing Photographs"; see LrCatalog:setActiveSources().
local LrCatalog = {}

--- Adds one photo to the catalog.
---@param path string The path to the photo on disk.
---@param stackWithPhoto LrPhoto? If present, stack the new photo with this existing photo.
---@param position string? If stacking, the stacking order for the new photo with respect to the existing photos, 'above' or 'below'. Default is 'below'. This argument first supported in version 3.0 of the Lightroom SDK. In version 2.x of Lightroom, this parameter is ignored; the new photo is always placed below the existing photo.
---@param metadataPresetUUID string? UUID of the metadata preset to be applied to the imported photo. First support added in version 12.5 of Lightroom Classic SDK.
---@param developPresetUUID string? UUID of the Develop preset to be applied to the imported photo. First support added in version 12.5 of Lightroom Classic SDK.
---@return LrPhoto # The photo that was added. If the photo cannot be added because the path does not exist or the file's format is not supported, the function throws an error.
function LrCatalog:addPhoto(path, stackWithPhoto, position, metadataPresetUUID, developPresetUUID) end

--- If this catalog has at least private write access, the function returns.
---@param funcName string Name of a function whose value appears in the error message, if any.
function LrCatalog:assertHasPrivateWriteAccess(funcName) end

--- If this catalog has write access, the function returns.
---@param funcName string Name of a function whose value appears in the error message, if any.
function LrCatalog:assertHasWriteAccess(funcName) end

--- Retrieves display-formatted metadata for multiple photos.
---@param photos LrPhoto[] The photo objects to inspect.
---@param keys string[] The metadata items to retrieve, or nil to get all avaliable metadata fields. See LrPhoto:getFormattedMetadata for list of valid keys.
---@return table # The result, a table with this structure: result = { [ LrPhoto #1 ] = { fileName = "filename_1.jpg", rating = 3, }, [ LrPhoto #2 ] = { fileName = "filename_2.jpg", rating = 5, }, }
function LrCatalog:batchGetFormattedMetadata(photos, keys) end

--- Retrieves plug-in metadata for multiple photos.
---@param photos any
---@param plugin (string | LrPlugin) Your plug-in object or the unique identifying string for the plug-in that declares this field.
---@param fieldIds string[] The metadata items to retrieve.
---@return table # The result, a table with this structure: result = { [ LrPhoto #1 ] = { field1 = (value1), field2 = (value2), }, [ LrPhoto #2 ] = { field1 = (value1), field2 = (value2), }, }
function LrCatalog:batchGetPropertyForPlugin(photos, plugin, fieldIds) end

--- Retrieves unformatted metadata for multiple photos.
---@param photos LrPhoto[] The photo objects to inspect.
---@param keys string[][] The metadata items to retrieve, or nil to get all avaliable metadata fields. See LrPhoto:getRawMetadata for list of valid keys.
---@return table # The result, a table with this structure: result = { [ LrPhoto #1 ] = { fileName = "filename_1.jpg", rating = 3, }, [ LrPhoto #2 ] = { fileName = "filename_2.jpg", rating = 5, }, }
function LrCatalog:batchGetRawMetadata(photos, keys) end

--- Builds a smart preview for a set of photos.
---@param photos LrPhoto[] The photos for which to build smart previews.
---@return arrays[] # A table with sub-arrays indicating the result of the smart preview build attempt. The sub-arrays are 'created', 'existed', and 'failed', and they contain LrPhoto objects corresponding to the photos for which the indicated status is appropriate.
function LrCatalog:buildSmartPreviews(photos) end

--- Creates a new collection in this catalog.
---@param name string The name of the new collection.
---@param parent LrCollectionSet? The parent of the new collection, or nil to create at the top level.
---@param canReturnPrior boolean? True to return an existing collection with this name, otherwise return nil if such a collection exists.
---@return LrCollection # On success, the new collection object. If a collection with this name already exists, nil or that collection object.
function LrCatalog:createCollection(name, parent, canReturnPrior) end

--- Creates a new collection set in this catalog.
---@param name string The name of the new collection set.
---@param parent LrCollectionSet? The parent of the new collection set, or nil to create at the top level.
---@param canReturnPrior boolean? True to return an existing collection set with this name, otherwise return nil if such a collection set exists.
---@return LrCollectionSet # On success, the new collection set object. If a collection set with this name already exists, nil or that collection set object.
function LrCatalog:createCollectionSet(name, parent, canReturnPrior) end

--- Creates a keyword in this catalog.
---@param keywordName string The name of the keyword.
---@param synonyms table The names of synonyms.
---@param includeOnExport boolean True to include the keyword when the photo is exported.
---@param parent LrKeyword The parent of the keyword, or nil to create at the top level.
---@param returnExisting boolean True if an LrKeyword instance is to be returned when a keyword with the specified name and parent already exists. This parameter is first supported in Lightroom 4.0.
---@return LrKeyword # The new keyword object, or false if a keyword already exists with the same name and parent, assuming that 'returnExisting' is not specified or false. If 'returnExisting' is true and the keyword with the same name and parent already exists, that keyword object will be returned.
function LrCatalog:createKeyword(keywordName, synonyms, includeOnExport, parent, returnExisting) end

--- Creates a new smart collection in this catalog.
---@param name string The name of the new smart collection.
---@param searchDesc table A search descriptor that defines what metadata fields to search, and how to match against a given value. See LrCatalog:findPhotos() for details. The default value for the "combine" field is "intersect".
---@param parent LrCollectionSet? The parent of the new collection, or nil to create at the top level.
---@param canReturnPrior boolean? True to return an existing collection with this name, otherwise return nil if such a collection exists.
---@return LrCollection # On success, the new collection object. If a collection with this name already exists, nil or that collection object.
function LrCatalog:createSmartCollection(name, searchDesc, parent, canReturnPrior) end

--- Creates a virtual copy for each of the currently selected photos and videos.
---@param copyName string? The name to apply to each of the virtual copies.
---@return LrPhoto[] # The new virtual copies.
function LrCatalog:createVirtualCopies(copyName) end

--- Searches for a photo in this catalog by its absolute path in the file system.
---@param path string The absolute path to the photo file on disk.
---@param caseSensitivity any
---@return LrPhoto # The corresponding photo object, or nil if no such photo is in the catalog.
function LrCatalog:findPhotoByPath(path, caseSensitivity) end

--- Searches for a photo in this catalog by its unique identifier.
---@param path string The UUID for the photo.
---@return LrPhoto # The corresponding photo object, or nil if no such photo is in the catalog.
function LrCatalog:findPhotoByUuid(path) end

--- Searches for photos by arbitrary criteria.
---@param args table Arguments in named-argument syntax: sort: (optional, string) How matching photos are sorted. One of "captureTime" (the default), "fileName", "extension". ascending: (optional, Boolean) True to display photos in ascending order. Default is false. searchDesc: (table) A search descriptor that defines what metadata fields to search, and how to match against a given value. This table can have one entry, a criterion table, or it can combine several criterion tables in a way specified by a combine entry. combine (optional, string) One of: union Any of the criteria match. intersect All of the criteria match. exclude None of the critera match. This followed by the array of entries to be combined, which can contain nested combine entries. Each criterion table must have three entries, criteria, operation, and value. It can have additional value modifiers, depending on the matching operation. criteria: (string) The metadata field or fields to search for values that match the given value in a way specified by the operation. Valid values are: "rating" (number) "pick" (number) One of 1 (flagged), 0 (unflagged), -1 (rejected) "labelColor" (number) One of: 1 (red), 2 (yellow), 3 (green), 4 (blue), 5 (purple), "custom" (any label not currently assigned to a color), "none" "labelText" (string, can be empty) User-assigned name of color label "folder" (string) Name of folder -- including all parent folders shown in the Folders panel "collection" (string) Name of any collection containing this photo "all" (string): Any searchable text. "filename" (string) "copyname" (string, can be empty): Copy Name assigned in Metadata panel "fileFormat" (enum) One of: "DNG", "RAW", "JPG", "TIFF", "PNG", "PSD", "VIDEO", "PSB", "AVIF", "JXL" "metadata" (string) Any searchable metadata "title" (string, can be empty) "caption" (string, can be empty) "keywords" (string, plural, can be empty) "iptc" (string) Any IPTC metadata; that is, any text in a field that is indexed by Lightroom. "exif" (string) Any EXIF metadata; that is, any text in a field that is indexed by Lightroom. "captureTime" (date) "touchTime" (date) Edit Date "camera" (string, with exact match) "cameraSN" (string, with exact match): Camera Serial Number "lens" (string, with exact match) "isoSpeedRating" (number) "hasGPSData" (Boolean) "country" (string, with exact match) "state" (string, with exact match) "city" (string, with exact match) "location" (string,with exact match) "city" (string, with exact match) "location" (string, with exact match) "creator" (string, with exact match) "jobIdentifier" (string, with exact match) "copyrightState" (enum) One of: true (Boolean, copyrighted), false (Boolean, public domain), "unknown" "hasAdjustments" (Boolean) "developPreset" (enum) One of: "default", "specified", "custom" "treatment" (enum) One of:"grayscale", "color" "cropped" (Boolean) "aspectRatio" (enum) One of: "portrait", "landscape", "square" "allPluginMetadata" (string) Any searchable plug-in metadata sdktext:(plug-in ID).(field name) Data type is text or enum, the field must be declared as searchable. sdktext:(plugin id).* Data type is text or enum, specifies all searchable fields from the plug-in. operation: (string) How to match the value of the given criteria field against the given value. Valid operations depend on the datatype of the field. For string values, one of: "any" (contains, as in the Smart Collections UI), "all" (contains all, as in the Smart Collections UI), "words" (contains words, as in the Smart Collections UI), "noneOf" (does not contain, as in the Smart Collections UI), "beginsWith" (starts with, as in the Smart Collections UI), "endsWith" (ends with, as in the Smart Collections UI), "empty" (are empty, as in the Smart Collections UI: only valid for items that can be empty), "notEmpty" (are not empty, as in the Smart Collections UI: only valid for items that can be empty), "==" (is, only valid for items that can have an exact match), "!=" (is not, only valid for items that can have an exact match) For Boolean values, one of "isTrue", "isFalse" For enumerated values, one of: "==" (is), "!=" (is not) For number and rating values, one of: "==" (is), "!=" (is not), ">" (is greater than), "<" (is less than), ">=" (is greater than or equal to), "<=" (is less than or equal to), "in" (is in range) For date values, one of: "==" (is), "!=" (is not), ">" (is after), "<" (is before), "inLast" (is in the last), "notInLast" (is not in the last), "in" (is in the range), "today" (is today), "yesterday" (is yesterday), "thisWeek" (is in this week), "thisMonth" (is in this month), "thisYear" (is in this year) value: (type must match field type) The value against which to match. For date values, use the string format "YYYY-MM-DD". value2: (optional, number) For operation = "in", the end value of the range. value_units: (optional, string) For date fields with operation = "inLast", or notInLast, the date unit. One of: "hours", "days", "weeks", "months", "years".
---@return LrPhoto[] # The photos that match the criteria.
function LrCatalog:findPhotos(args) end

--- Searches for photos with a specific plug-in property.
---@param pluginId string The plug-in identifier.
---@param fieldName string The field identifier.
---@param optFieldVersion number? The version for the field. Note: If you are trying to reference an old version of a field that was not assigned a version number, you can use the number 0.
---@return LrPhoto[] # The photos that match the criteria.
function LrCatalog:findPhotosWithProperty(pluginId, fieldName, optFieldVersion) end

--- Retrieves currently viewed collections, collection sets, or folders.
---@return table # Array of the currently viewed objects as LrCollection, LrCollectionSet, LrPublishedCollection, LrPublishedCollectionSet, LrFolder or one of the string constants defined in these LrCatalog properties: kAllPhotos kQuickCollectionIdentifier kPreviousImport kTemporaryImages kLastCatalogExport
function LrCatalog:getActiveSources() end

--- Retrieves the photo objects for all photos in the catalog.
---@return table # An array of LrPhoto objects.
function LrCatalog:getAllPhotos() end

--- Retrieves the top-level collection sets in this catalog.
---@return LrCollectionSet[] # The collection set objects.
function LrCatalog:getChildCollectionSets() end

--- Retrieves all top-level collections in this catalog.
---@return LrCollection[] # The collection objects.
function LrCatalog:getChildCollections() end

--- Retrieves a photo collection or collection set from this catalog.
---@param id number The unique, local identifier of the collection or collection set. See LrCollection.localIdentifier.
---@return (LrCollection | LrCollectionSet) # The collection or collection set object.
function LrCatalog:getCollectionByLocalIdentifier(id) end

--- Retrieves the value of the current library view filter.
function LrCatalog:getCurrentViewFilter() end

--- Retrievs the folder object for a given path.
---@param path string The path. You cannot use the short filename in Windows.
---@return LrFolder # The folder object.
function LrCatalog:getFolderByPath(path) end

--- Retrieves the folders defined at the root of the hierarchy.
---@return LrFolder[] # A table containing the folder objects.
function LrCatalog:getFolders() end

--- Retrieves the keywords defined at the root of the hierarchy.
---@return LrKeyword[] # A table containing the keyword objects.
function LrCatalog:getKeywords() end

--- Retrieves the keywords corresponding to the supplied local identifiers.
---@param ids table An array of local identifiers for the keywords to retrieve, as obtained via the 'localIdentifier' property of an LrKeyword instance.
---@return LrKeyword[] # A table containing the keyword objects. An empty table if no keywords matching the supplied identifers are found.
function LrCatalog:getKeywordsByLocalId(ids) end

--- Reports the labels that have been assigned to colors.
---@return table # A table in which each entry maps a color name to a label. For example, { red = "Do Not Show",...
function LrCatalog:getLabelMapToColorName() end

--- Retrieves the photo objects for all selected photos if more than one is selected, or for all visible photos if only one or none is selected.
---@return LrPhoto[] # The photos.
function LrCatalog:getMultipleSelectedOrAllPhotos() end

--- Retrieves the file-system location of this catalog, the absolute path of the .lrcat file.
---@return string # The path.
function LrCatalog:getPath() end

--- Retrieves plug-in-specific data for this catalog, as previously set by catalog:setPropertyForPlugin().
---@param plugin (string | LrPlugin) Your plug-in object or the unique identifying string for the plug-in that declares this field.
---@param fieldId string The unique identifier of the metadata field.
---@return string # The value for the field, or nil if no value had been stored by the plug-in.
function LrCatalog:getPropertyForPlugin(plugin, fieldId) end

--- Retrieves the publish services defined by a particular plug-in, or all publish services in this catalog.
---@param pluginId string Unique identifier of a plug-in, or nil to get all services.
---@return LrPublishService[] # The publish service objects.
function LrCatalog:getPublishServices(pluginId) end

--- Retrieves a publish collection or collection set from this catalog.
---@param id number The unique, local identifier of the publish collection or collection set. See LrPublishedCollection.localIdentifier
---@return (LrPublishedCollection | LrPublishedCollectionSet) # The publish collection or collection set object.
function LrCatalog:getPublishedCollectionByLocalIdentifier(id) end

--- Retrieves the active photo, if any.
---@return LrPhoto # The photo object, or nil if none is selected.
function LrCatalog:getTargetPhoto() end

--- Retrieves the photo objects for the photos that would be affected by any photo-processing command.
---@return LrPhoto[] # The photos.
function LrCatalog:getTargetPhotos() end

--- Sets the sources from which the grid photos are currently drawn.
---@param sources (string | array) Can be an array of objects, or a string that identifies a predefined set of photos. If an array, it can contain any mix of LrCollection, LrCollectionSet, LrPublishedCollection and LrPublishedCollectionSet, or it can contain one or more LrFolder objects. Do not mix collections with folders. If a string, it must be one of the string constants defined in these LrCatalog properties: kAllPhotos kQuickCollectionIdentifier kPreviousImport kTemporaryImages kLastCatalogExport kTargetCollection
---@return any
function LrCatalog:setActiveSources(sources) end

--- Sets a plug-in-specific metadata value for this catalog.
---@param plugin LrPlugin Your plug-in object.
---@param fieldId string The unique identifier of the metadata field.
---@param value ([nil, number, string,] | boolean) The new value for this field. Cannot be a table or function value.
function LrCatalog:setPropertyForPlugin(plugin, fieldId, value) end

--- Sets the photo selection programmatically.
---@param activePhoto LrPhoto The active photo; if multiple photos are selected, this is the brightest, "most selected" one.
---@param otherSelectedPhotos LrPhoto[] Additional photos to select.
function LrCatalog:setSelectedPhotos(activePhoto, otherSelectedPhotos) end

--- Sets the library view filter programmatically.
---@param filter (string | table) A view filter preset, or a set of filter values: (string) The unique identifying string of a view filter preset. See LrApplication:viewFilterPresets. (table) The view filter values in a table, as returned by LrCatalog:getCurrentViewFilter.
---@return boolean # True if the filter was changed, false if it was already set as specified, or nil if the given filter preset could not be found.
function LrCatalog:setViewFilter(filter) end

--- Triggers an import, bypassing the import dialog, using the settings from the most recent import.
---@param path string The path to a directory from which to import images.
function LrCatalog:triggerImportFromPathWithPreviousSettings(path) end

--- Triggers an import via the import dialog.
---@param path string? The path to a directory which will be selected as the initial source in the import dialog.
function LrCatalog:triggerImportUI(path) end

--- Reports the type of this object.
---@return string # 'LrCatalog'.
function LrCatalog:type() end

--- Updates AI Settings for a set of photos.
---@param photos LrPhoto[] The photos for which AI Settings should be updated. If no photos are passed, it will update for all target photos.
function LrCatalog:updateAISettings(photos) end

--- Provides write access to custom fields defined by your plug-in.
---@param func function The function to call with catalog access.
---@param timeoutParams table? This argument is first supported in version 4.0 of the Lightroom SDK. A table which, if present, must contain a 'timeout' key which must be a number stating the number of seconds to wait for write access before giving up. An optional second key, 'callback', which must be a function, can be provided. This function will be called if the timeout expires and the write access task is abandoned. An optional third key, 'asynchronous', specifies whether this function should return immediately upon queueing the write access task, or return on completion of the write access task. The default behavior is to return on completion of the write access task, which corresponds to 'asynchronous' not specified (nil) or false. If 'timeoutParams' is not provided, the behavior will be similar to that in versions prior to Lightroom 4.0: If write access cannot be immediately obtained, an error will be thrown.
---@return string # If 'func' does not throw an error, the returned string will be either "executed", "queued", or "aborted". If the 'asynchronous' parameter is true, withPrivateWriteAccessDo returns immediately with either "executed" or "queued", otherwise it returns within 'timeout' seconds with either "executed" or "aborted". When "executed" is returned, 'func' will have been executed and 'callback' will have been ignored. When "queued" is returned, 'func' will execute within 'timeout' seconds or the 'callback' function will execute. When "aborted" is returned, 'func' will have been ignored and 'callback' will have executed. This return value is only present in version 4.0 and later of the Lightroom SDK.
function LrCatalog:withPrivateWriteAccessDo(func, timeoutParams) end

--- Provides read/write access to the catalog for an extended period of time.
---@param params table Arguments in named-argument syntax: title: (string) Title of the modal progress dialog, the overall task. Cannot be changed once the operation begins. caption: (optional, string) Subtitle for the current task. Can be changed while the operation is in progress. pluginName: (string) The name of your plug-in to be used in the warning message optionalMessage: (optional, string) An extra message to accompany Lightroom's warning about clearing the undo stack func: (function) The function that will perform the changes to the database. This function receives two parameters, a function context and a progress scope.
---@param timeoutParams table? This argument is first supported in version 4.0 of the Lightroom SDK. A table which, if present, must contain a 'timeout' key which must be a number stating the number of seconds to wait for write access before giving up. An optional second key, 'callback', which must be a function, can be provided. This function will be called if the timeout expires and the write access task is abandoned. An optional third key, 'asynchronous', specifies whether this function should return immediately upon queueing the write access task, or return on completion of the write access task. The default behavior is to return on completion of the write access task, which corresponds to 'asynchronous' not specified (nil) or false. If 'timeoutParams' is not provided, the behavior will be similar to that in versions prior to Lightroom 4.0: If write access cannot be immediately obtained, an error will be thrown. Note: The warning dialog will appear as soon as the 'catalog:withProlongedWriteAccessDo' is queued and not when the call is about to start execution. This could result in a delay between when the user accepts the warning dialog and when the modal progress dialog appears.
---@return [boolean, string] # The returned Boolean will be true if user clicked "Proceed"; false if user clicked "Cancel". If 'timeoutParams' was not specified, this will be the only return value. The second return value, a string, if present, will be either "executed", "queued", or "aborted". There will only be a second return value if 'timeoutParams' was specified. If the 'asynchronous' parameter is true, withProlongedWriteAccessDo returns immediately with either "executed" or "queued" for the second return value, otherwise it returns within 'timeout' seconds with either "executed" or "aborted" for the second return value. When "executed" is returned for the second return value, 'func' will have been executed and 'callback' will have been ignored. When "queued" is returned for the second return value, 'func' will execute within 'timeout' seconds or the 'callback' function will execute. When "aborted" is returnedfor the second return value, 'func' will have been ignored and 'callback' will have executed. This second return value is only present in version 4.0 and later of the Lightroom SDK.
function LrCatalog:withProlongedWriteAccessDo(params, timeoutParams) end

--- Provides read/write access to the catalog database.
---@param actionName string The display name for this operation, used in Lightroom's Undo/Redo menu.
---@param func function The function to call with catalog access.
---@param timeoutParams table? This argument is first supported in version 4.0 of the Lightroom SDK. A table which, if present, must contain a 'timeout' key which must be a number stating the number of seconds to wait for write access before giving up. An optional second key, 'callback', which must be a function, can be provided. This function will be called if the timeout expires and the write access task is abandoned. An optional third key, 'asynchronous', specifies whether this function should return immediately upon queueing the write access task, or return on completion of the write access task. The default behavior is to return on completion of the write access task, which corresponds to 'asynchronous' not specified (nil) or false. If 'timeoutParams' is not provided, the behavior will be similar to that in versions prior to Lightroom 4.0: If write access cannot be immediately obtained, an error will be thrown.
---@return string # If 'func' does not throw an error, the returned string will be either "executed", "queued", or "aborted". If the 'asynchronous' parameter is true, withWriteAccessDo returns immediately with either "executed" or "queued", otherwise it returns within 'timeout' seconds with either "executed" or "aborted". When "executed" is returned, 'func' will have been executed and 'callback' will have been ignored. When "queued" is returned, 'func' will execute within 'timeout' seconds or the 'callback' function will execute. When "aborted" is returned, 'func' will have been ignored and 'callback' will have executed. This return value is only present in version 4.0 and later of the Lightroom SDK.
function LrCatalog:withWriteAccessDo(actionName, func, timeoutParams) end
