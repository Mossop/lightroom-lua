---@meta

---@class LrDialogs
local LrDialogs = {}

--- Invokes an error dialog if an error results from the execution of a function in a given context.
---@param context LrFunctionContext The function-context object for the function.
function LrDialogs.attachErrorDialogToFunctionContext(context) end

--- Invokes a modal dialog for confirmation.
---@param message string The main alert message string, the title of the dialog.
---@param info string? A secondary message string, shown in a smaller font below the main message. Usually more descriptive. Can be nil.
---@param actionVerb string? The label string for the action button. Default is "OK".
---@param cancelVerb string? The label string for the cancel button. Default is "Cancel".
---@param otherVerb string? A label string for an optional third button. If not supplied, no third button is shown.
---@return string # The button used to dismiss the dialog, one of "ok", "cancel" or "other"
function LrDialogs.confirm(message, info, actionVerb, cancelVerb, otherVerb) end

--- Invokes a modal dialog to display a message, with a single "OK" button that dismisses the dialog.
---@param message string The main message to display.
---@param info string? A secondary message to display, shown in a smaller font below the main message. Can be nil.
---@param style string? The visual style of the dialog, one of: "warning" (the default), "info", or "critical". In Mac OS, this affects the style of the icon.
function LrDialogs.message(message, info, style) end

--- Invokes a message dialog that prompts for an action, and includes a "Do not show" checkbox.
---@param args table A table with these fields: message: (string) The main message. info: (string, optional) A secondary message shown in smaller text. actionPrefKey: (string) A key in which the chosen action is stored if do-not-show is checked. This key is added to your plug-in's list of settings.
function LrDialogs.messageWithDoNotShow(args) end

--- Invokes a custom dialog box as a floating dialog.
---@param plugin LrPlugin Your plug-in object.
---@param args table a table with these fields title: (string) The title of the dialog. contents: (LrView) The topmost container of an LrView hierarchy, to use for the contents of the dialog. blockTask: (Boolean, optional) True to make the call blocking. If true, the call must be enclosed in an asynchronous task. This can be useful when using observers to maintain the state of UI elements in your dialog. If false, the related function context used to create a property table may not be maintained properly and any related observers could be removed while the dialog is still active. Default is false. save_frame: (string, optional) If supplied, a unique key to be used to automatically save the position of the dialog as one of the plug-in settings. This is added to your plug-in's list of settings. onShow: (Function, optional) If supplied, a function which will be called when the dialog first shows up on the screen. It will be passed a single argument; a table containing two entries, which are both functions that can be invoked to manipulate the dialog. The 'toFront' entry is the function to call to ensure that the dialog is the frontmost window immediately after the call. The 'close' entry is the function to call to programmatically close the dialog window. windowWillClose: (Function, optional) If supplied, a function which will be called (with no arguments) when the floating dialog is about to close. selectionChangeObserver: (Function, optional) If supplied, a function which will be called (with no arguments) when the selected photos/videos changed. The plug-in can then use catalog:getTargetPhotos to act according to the new selection. sourceChangeObserver: (Function, optional) If supplied, a function which will be called (with no arguments) when the active source(s) changed. The plug-in can then use catalog:getActiveSources to act according to the new source(s).
function LrDialogs.presentFloatingDialog(plugin, args) end

--- Invokes a custom dialog box as a modal dialog.
---@param args table a table with these fields title: (string) The title of the dialog. resizable: (Boolean or string) The string "vertically" or "horizontally" to make the dialog resizable in one direction, true to make it resizable in both directions, or false to prevent resizing. contents: (LrView) The topmost container of an LrView hierarchy, to use for the contents of the dialog. accessoryView: (LrView, optional) The topmost container of an LrView hierarchy, that defines an alternative selection mechanism in place of the third button. Mutually exclusive with otherVerb. actionVerb: (string, optional) The localizable label of the action button; default "OK". actionBinding: (table, optional) Binding(s) applicable to the action button of the dialog. For example: actionBinding = { enabled = { bind_to_object = props, key = 'actionEnabled' }, } See viewFactory:push_button for further detail on bindable attributes. cancelVerb: (string, optional) The localizable label of the cancel button; default "Cancel". If the string "< exclude >" (spelled exactly like that, including the spaces) is supplied, the cancel button will not appear. The unique return value is "cancel". otherVerb: (string, optional) If supplied,the localizable label of a third button. The unique return value for this button is "other". If not supplied, no third button is shown. Mutually exclusive with accessoryView. save_frame: (string, optional) If supplied, a unique key to be used to automatically save the position of the dialog as one of the plug-in settings. This is added to your plug-in's list of settings.
---@return string # The unique return value of the button used to dismiss the dialog. See also LrView
function LrDialogs.presentModalDialog(args) end

--- Invokes a dialog that prompts for an action, and includes a "Do not show" checkbox.
---@param args table The contents of the dialog, a table with these fields: message: (string) The main message. info: (string, optional) A secondary message shown in smaller text. actionPrefKey: (string) A key in which the chosen action is stored if do-not-show is checked. This key is added to your plug-in's list of settings. verbBtns: (table) An array of action buttons. Each entry is a table with these fields: label: (string) A localizable label for the button. verb:(string) A unique identifier for the action.
---@return string # The selected action identifier, or nil if the user cancels
function LrDialogs.promptForActionWithDoNotShow(args) end

--- Resets one or both "Do not show" flags, as previously set by calls to messageWithDoNotShow() or promptForActionWithDoNotShow().
---@param actionPrefKey string? Name of the key supplied to the do-not-show method call. If supplied, this key is reset so that the specified dialog is shown again. If nil, all keys for this plug-in are reset.
function LrDialogs.resetDoNotShowFlag(actionPrefKey) end

--- Invokes the platform Open File dialog.
---@param args table A table with these fields: title: (string) The title of the dialog. prompt: (string) The label of the default button. Replaces "Open". canChooseFiles: (Boolean) True to allow files to be selected. canChooseDirectories: (Boolean) True to allow directories to be selected. canCreateDirectories: (Boolean) True to include a button to create directories. allowsMultipleSelection: (Boolean) True to allow multiple files to be selected. fileTypes: (string or table) The file types that can be selected. accessoryView: (LrView) A custom view to be included in the dialog. initialDirectory: (string, optional) Path to directory that should be initially opened.
---@return table # An array of path names or nil if the dialog was cancelled. See also LrView
function LrDialogs.runOpenPanel(args) end

--- Invokes the platform Save File dialog.
---@param args table A table with these fields: title: (string) The title of the dialog. prompt: (string) The label of the default button. Replaces "Save". requiredFileType: (string) The file extension of the file to be saved. canCreateDirectories: (Boolean) True to include a button to create directories. accessoryView: (LrView) A custom view to be included in the dialog.
---@return string # The path of the file that was saved or nil if the dialog was cancelled. See also LrView
function LrDialogs.runSavePanel(args) end

--- Shows a message in a window that quickly fades away.
---@param message string The message to display.
---@param fadeDelay number? The number of seconds to show the message. Default is 1.2 seconds.
function LrDialogs.showBezel(message, fadeDelay) end

--- Invokes a modal dialog that displays an error message.
---@param errorString string The error string to display. If this string is a valid error string (i.e. from LrErrors) then that error will be displayed. If the string is not a valid error string then a generic error message will be displayed and the error string will be used as secondary information.
function LrDialogs.showError(errorString) end

--- Shows a modal progress dialog.
---@param params table Arguments in named-argument syntax: title: (string) Title of the dialog, representing the entire task. Cannot be changed once the operation begins. caption: (optional, string) Subtitle, representing a subtask. Can be changed while the operation is in progress. width: (optional, number) Width of the progress bar, in pixels. cannotCancel: (optional, Boolean) If true, the cancel button is dimmed. functionContext: (LrFunctionContext) A function context to attach to this progress dialog. The progress dialog is terminated when the function scope completes.
---@return any
function LrDialogs.showModalProgressDialog(params) end

--- Dismisses a modal dialog that is currently displayed.
---@param dialog LrView The dialog to dismiss, or any element of that dialog.
---@param result string The value to return from the invocation function; typically one of "ok", "cancel", or "other".
function LrDialogs.stopModalWithResult(dialog, result) end

return LrDialogs
