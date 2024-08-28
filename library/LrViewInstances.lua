--- @meta

--- @class viewFactory
local viewFactory = {}

--- Creates a view containing a photo from the catalog.
--- @param args table A table with fields for any:  View properties  in addition to:  photo: (LrPhoto) The photo. width: (number, default: height, if specified) The width of the box (in pixels) in which the photo will be drawn.  height: (number, default: width, if specified) The height of the box (in pixels) in which the photo will be drawn.  If neither width nor height are specified, they both default to 200 pixels. frame_width: (number, default: 0) The thickness of the frame around the photo box, which is drawn with inner dimensions equal to the width and height specified for the photo box.  frame_color: (LrColor, default: LrColor( 0, 0, 0 )) The color of the frame around the photo box.  background_color: (LrColor, default: LrColor( 0, 0, 0 )) The color to use for filling any areas of the photo box that aren't occupied by the photo.  mouse_down: (function, optional) Callback for this event, takes one argument, the view object that was clicked.
function viewFactory:catalog_photo(args) end

--- Creates a checkbox control, which displays the title text with a platform-style checkbox button.
--- @param args table A table with fields for any:  View properties Control properties Text properties  in addition to:  title: (string, default: nil) The display text.  value: (any, default: nil) The current value of the checkbox. checked_value: (any, default: true) A value that indicates the checked state. unchecked_value: (any, default: false) A value that indicates the unchecked state.
function viewFactory:checkbox(args) end

--- Creates a color well control, which displays the current color, and when clicked shows a UI that lets the user choose a different color.
--- @param args table A table with fields for any:  View properties Control properties  in addition to:  value: (LrColor, default: nil) The current color to display.
function viewFactory:color_well(args) end

--- Creates a column container, which lays out its children vertically.
--- @param args table A table with fields for any: Child layout properties Node layout properties
function viewFactory:column(args) end

--- Creates a combo box control, with an editable text field and a pop-up menu of predefined text values.
--- @param args table A table with fields for any:  View properties Control properties Text properties Editable text properties (Auto completion is not supported on Windows.)  in addition to:  items: (table, default: nil) An array of simple values to appear in the menu.These values cannot be localized in place; you must build the array with localized values.
function viewFactory:combo_box(args) end

--- Retrieves a spacing value suitable for assignment to the spacing property of a group of controls.
--- @return number # The spacing value in pixels.
function viewFactory:control_spacing() end

--- Retrieves a spacing value suitable for assignment to the spacing property of a group of items at the top level of a dialog.
--- @return number # The spacing value in pixels.
function viewFactory:dialog_spacing() end

--- Creates an edit-field control, which accepts keyboard input when it has the input focus.
--- @param args table A table with fields for any:  View properties Control properties Text properties Editable text properties
function viewFactory:edit_field(args) end

--- Creates a group box container, a visible containment frame for a set of controls.
--- @param args table A table with fields for any:  View properties Child layout properties Node layout properties  in addition to:  font: (any, default: nil, inherited) See Control properties. title: (string, default: nil) The display text.  show_title: (Boolean, default: true) True to show the title.
function viewFactory:group_box(args) end

--- Retrieves a spacing value suitable for assignment to the spacing property of a group of items where the items are closely related and one of the items serves as a label for the other items.
--- @return number # The spacing value in pixels.
function viewFactory:label_spacing() end

--- Creates a password field control, an editable text field that obscures the entered text, displaying only bullet characters.
--- @param args table A table with fields for any:  View properties Control properties Text properties Editable text properties
function viewFactory:password_field(args) end

--- Creates a picture control, which displays a static image or icon.
--- @param args table A table with fields for any:  View properties Control properties  in addition to:  value: (string, default: nil) Name of the file or resource in the plug-in. Obtain the resource with code like this: _PLUGIN:resourceId( "myLogo.png" ) frame_width: (number, default: nil) The width of the frame to draw around the image. frame_color: (LrColor, default: black) The color of the frame.
function viewFactory:picture(args) end

--- Creates a pop-up menu control, which offers a pop-up menu of choices, each with a title and value.
--- @param args table A table with fields for any:  View properties Control properties Text properties  in addition to:  value: (any, default: nil) The current control value. items: (table, default: nil) Table of items to be displayed. Each entry has a localizeable title and a value. value_equal: (function, default: nil) A function called to compare the control value to the value of each item in turn, to determine if one is selected. The function is in the form: myValueEqual( value1, value2 ). It should return true if a condition is met, false if it is not. If it returns true for any item, that becomes the selected item, and its title is displayed in the control. If no item returns true, no item is selected, and the control is blank. The control value remains unchanged.
function viewFactory:popup_menu(args) end

--- Creates a push button control, which responds to a click with an action.
--- @param args table A table with fields for any:  View properties Control properties Text properties  in addition to:  title: (string, default: nil) The display text.  action: (function, default: nil) A function defining the action to be taken when the button is clicked, in the form: myAction( button )
function viewFactory:push_button(args) end

--- Creates a radio button control.
--- @param args table A table with fields for any:  View properties Control properties Text properties  in addition to:  title: (string, default: nil) The display text.  value: (any, default: nil) Current value of the radio button. checked_value: (any) A value that indicates the checked state.
function viewFactory:radio_button(args) end

--- Creates a row container, which lays out its	children horizontally.
--- @param args table A table with fields for any: Child layout properties Node layout properties
function viewFactory:row(args) end

--- Creates a container view with horizontal and vertical scroll bars.
--- @param args table A table with fields for any:  View properties Child layout properties  in addition to:  width: (number, default: 450) The width of the view, in pixels.  background_color: (LrColor, default: LrColor(1, 1, 1)) The background color of the view. Note that dynamic updates via binding only works on the Mac platform for this property. height: (number, default: 150) The height of the view, in pixels. (Will not be allowed to be smaller than 80.)  horizontal_scroller: (Boolean, optional) True if a horizontal scroll bar is to be present, false if not. Defaults to true. vertical_scroller: (Boolean, optional) True if a vertical scroll bar is to be present, false if not. Defaults to true.
function viewFactory:scrolled_view(args) end

--- Creates a separator, which draws a line 2 pixels in width in its container, but has no other behavior.
--- @param args table A table with these fields:  fill_horizontal: (number, default: nil) The width of the horizontal line, a percentage of the parent's width in the range [0..1]. fill_vertical: (number, default: nil) The height of the vertical line, a percentage of the parent's height in the range [0..1].  If both values are specified, the larger value determines the direction of the line.
function viewFactory:separator(args) end

--- Creates a simple scrolling list control, which is similar to popup_menu in that it offers a simple non-hierarchical list of choices, each with a title and value.
--- @param args table A table with fields for any:  View properties Control properties (except the font property)  in addition to:  width: (number, default: 450) The width of the view, in pixels.  height: (number, default: 150) The height of the view, in pixels. (Will not be allowed to be smaller than 80.)  value: (table, default: nil) The current control value; an array of the values corresponding to each selected list item, if any. items: (table, default: nil) Table of items to be displayed. Each entry has a localizeable title and a value. allows_multiple_selection: (Boolean) True if the list supports selection of multiple items at one time. value_equal: (function, default: nil) A function called to compare the control value to the value of each item in turn, to determine selection. The function is in the form: myValueEqual( value1, value2 ). It should return true if a condition is met, false if it is not. If it returns true for any item that item's title becomes selected in the list. If no item returns true, no item is selected in the list.
function viewFactory:simple_list(args) end

--- Creates a slider control, which has a draggable indicator that changes an associated numeric value.
--- @param args table A table with fields for any:  View properties Control properties  in addition to:  value: (number, default: nil) Value to be displayed. min: (number, default: nil) The low end of the range. max: (number, default: nil) The high end of the range. integral: (Boolean, default: false) True to change the value by integer increments.
function viewFactory:slider(args) end

--- Creates a view to consume space for the purposes of layout.This is an empty row, which affects the layout of other children of its parent.
--- @param args table A table with fields for any: of:  width: (number, default: nil) The horizontal size in pixels.  height: (number, default: nil) The vertical size in pixels.
function viewFactory:spacer(args) end

--- Creates a static text control that does not respond to user input, typically a label or instructions.
--- @param args table A table with fields for any:  View properties Control properties Text properties  in addition to:  title: (string, default: nil) The display text.  truncation: (string, default: nil) Where to truncate the text if it is too long to be displayed. Values are: 'head', 'middle', 'tail'. selectable: (Boolean, default: false) True to make text selectable. This feature is only available in Mac OS. alignment: (string, default: 'left') Text alignment within the control. Values are: 'left'. 'center', right'. text_color: (LrColor, default: black) Color of the text. mouse_down: (function) Optional. Callback for this event, takes one argument, the view object that was clicked.
function viewFactory:static_text(args) end

--- Creates a container of tabbed pages.
--- @param args table A table with fields for any:  View properties Child layout properties Node layout properties  in addition to:  font: (any, default: nil) The font used in the tab titles. See Control properties. size: (string, default: 'regular', inherited) The font size of text in the tab titles, and a default font size for child nodes. See Control properties. value: (any, default: nil) The identifier of the currently selected tab.
function viewFactory:tab_view(args) end

--- Creates a tabbed page container in a tab view container.
--- @param args table A table with fields for any:  View properties Child layout properties Node layout properties  in addition to:  title: (string, default: nil) The display text.  identifier: (string, required) A unique identifier for this page, used to select the current tab in the parent tab view container. Important: Previous versions of the documentation stated that this parameter could be of any type. That was incorrect; it must be present and it must be a string value.
function viewFactory:tab_view_item(args) end

--- Creates a basic containment frame for a set of controls, with no visual representation.
--- @param args table A table with fields for any:  View properties Child layout properties Node layout properties
function viewFactory:view(args) end

