--- @meta

--- @class LrWebViewFactory
local LrWebViewFactory = {}

--- Creates a row containing a check box, a label, and a color well, within a section in a Web-module panel.
--- @param args table A table with fields for any:  title (string) The localizable display text. color (LrColor) The color for the well. Use LrView.bind() to tie this to your data model. enabled (Boolean) When true, the checkbox is checked and the color well is enabled. Use LrView.bind() to tie this to your data model.
--- @return LrView # The checkbox-and-color row view.
function LrWebViewFactory:checkbox_and_color_row(args) end

--- Creates a row containing a label and a checkbox, within a column container in a section in a Web-module panel.
--- @param args table A table with fields for any:  title (string) The localizable display text. value (special). Use LrView.bind() to tie the checkbox to a Boolean value in your data model.
--- @return LrView # The checkbox-row view.
function LrWebViewFactory:checkbox_row(args) end

--- Creates a container for color swatches within a section in a Web-module panel.
--- @param args table A table with fields for any:  Child layout properties Node layout properties
--- @return LrView # The color-content column view.
function LrWebViewFactory:color_content_column(args) end

--- Creates a general-purpose container within a section in a Web-module panel.
--- @param args table A table with fields for any: Child layout properties Node layout properties
--- @return LrView # The content column view.
function LrWebViewFactory:content_column(args) end

--- Creates a generic column-layout container within a section in a Web-module panel.
--- @param args table A table with fields for any: Child layout properties Node layout properties
--- @return LrView # The content-section view.
function LrWebViewFactory:content_section(args) end

--- Creates a generic row-layout container within a header section in a Web-module panel.
--- @param args table A table with fields for any: Child layout properties Node layout properties
--- @return LrView # The header-section view.
function LrWebViewFactory:header_section(args) end

--- Creates a label with an appropriate color, font, size and margins to be used as a section header.
--- @param args table A table with fields for any:  title (string) The localizable display text.
--- @return LrView # The header-section-label view.
function LrWebViewFactory:header_section_label(args) end

--- Creates an identity plate control.
--- @param args table A table with fields for any:  title (string) The localizable display text. value (special). Use LrView.bind() to tie the value of the control to a value in your data model.  enabled (Boolean) Use LrView.bind() to tie the enabled state of the control to a Boolean value in your data model.
--- @return LrView # The identity-plate view.
function LrWebViewFactory:identity_plate(args) end

--- Creates a row containing a label and a color well, within a color_content_column in a section in a Web-module panel.
--- @param args table A table with fields for any:  title (string) The localizable display text. color (special) Use LrView.bind() to tie this to a color value your data model.
--- @return LrView # The label-and-color row view.
function LrWebViewFactory:label_and_color_row(args) end

--- Creates a row containing a label and an edit text, with optional most-recently-used (MRU) menu.
--- @param args table A table with fields for any:  title (string) The localizable display text. wraps (Boolean) When true, wrap long text to the next line. value (string) The value of the edit text. Use LrView.bind() to tie this to your data model.  tracking (string) The tracking value of the edit text. Use LrView.bind() to tie this to your data model.  preference_key (string, optional) The name of the preference key in which to store the list of most recently used (MRU) items.  If omitted, a prefence key is generated based on the key used in the value binding. include_mru (Boolean, optional) When true, include the most-recently-used (MRU) menu. Default is true.
--- @return LrView # The labeled text-input view.
function LrWebViewFactory:labeled_text_input(args) end

--- Creates a row containing a pop-up menu with metadata mode choices, within a section in a Web-module panel.
--- @param args table A table with fields for any:  value (mode) The metadata mode. Use LrView.bind() to tie this to your data model. title (string) The localizable label text for the row.
--- @return LrView # The metadata-mode view.
function LrWebViewFactory:metadataModeControl(args) end

--- Creates a top-level Web-module panel.
--- @param args table A table with fields for any: Child layout properties Node layout properties
--- @return LrView # The panel view.
function LrWebViewFactory:panel_content(args) end

--- Creates a row container for popup_menu controls.
--- @param args table A table with fields for any:  Child layout properties Node layout properties
--- @return LrView # The popup row view.
function LrWebViewFactory:popup_row(args) end

--- Creates a generic row-layout container within a section in a Web-module panel, with correct spacing and horizontal fill.
--- @param args table A table with fields for any: Child layout properties Node layout properties
--- @return LrView # The row view.
function LrWebViewFactory:row(args) end

--- Creates a control for selecting the number of rows and columns in a grid.
--- @param args table A table with fields for any:  rows (number) The number of rows that are selected columns (number) The number of columns that are selected max_rows (number)  The maximum number of rows. max_columns (number)  The maximum number of columns. min_rows (number)  The minimum number of rows. min_columns (number)  The minimum number of columns.
--- @return LrView # The row & column control view.
function LrWebViewFactory:row_column_picker(args) end

--- Creates a container for slider_row views within a section in a Web-module panel.
--- @param args table A table with fields for any: Child layout properties Node layout properties
--- @return LrView # The slider-content column view.
function LrWebViewFactory:slider_content_column(args) end

--- Creates a row containing a label, a slider, and an edit text, within a slider_content_column in a section in a Web-module panel.
--- @param args table A table with fields for any:  title (string) The localizable display text. value (number) The current displayed value for the slider. Use LrView.bind() to tie this to your data model. tracking (value) The current value, updated while tracking, or nil if not tracking. Use LrView.bind() to tie this to your data model. tracking_value (value) When the mouse is actively dragging the slider, the value echoed to tracking. unit (string) The label to put after the edit text, as a unit. min (number) The minimum slider value. max (number) The maximum slider value. width_in_digits (number) The amount of room in digits to leave for the edit field. precision (number) The number of decimal places of precision for the slider value.
--- @return LrView # The slider row view.
function LrWebViewFactory:slider_row(args) end

--- Creates a section within a Web-module panel created by panel_content().
--- @param args table A table with fields for any: Child layout properties Node layout properties
--- @return LrView # The sections view.
function LrWebViewFactory:subdivided_sections(args) end

--- Creates a small symbol that appears to warn the user about a specific property value.
--- @param args table A table with fields for any:  visibility (table) A table describing what property controls the visibility of the icon, and also a method for transforming the property.  key (string) The bound property.  whenNotEqual (string, optional) The icon becomes visible when the bound property is not equal to this value. Provide this or whenEqual, not both. whenEqual (string, optional) The icon becomes visible when the bound property is equal to this value. Provide this or whenNotEqual, not both.  tooltip (string) A message displayed when the cursor hovers over the control.
--- @return LrView # The warning-icon view.
function LrWebViewFactory:warning_icon(args) end

