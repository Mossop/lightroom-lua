--- @meta LrView

--- @class LrView
local LrView = {}

--- This namespace function declares a binding to a data value in a property table.
--- @param binding (string | table) The data property. The name of a key in the default bound table, or, to specify a single property, a table with these entries: key (string) A key name for the observed property.  bind_to_object (string) Optional. The name of an observable table containing this key, which overrides the current bound table. transform (function) Optional. A function that changes the value whose modification triggered the notification. Function looks like: myTransform( value, fromModel ) returns result. The value parameter is the value about to be set into the view if fromModel is true. The value parameter is the value coming from the view if fromModel is false.  To specify multiple properties, a table with these entries:  keys (table) Multiple observed properties.  Entries can be simple key names from the bound table, or you can specify a key in another table, using a key-value pair, in which the value part can be a table with these items:  key (string) A  property name  bind_to_object (string) Optional. The name of an observable table containing this key, which overrides the current bound table. unique_key (string) Optional. A unique name with which to identify this key, if the actual name is also used in another table.  bind_to_object (string) Optional. The name of an observable table containing these keys, which overrides the current bound table, but is overridden by specific key specifications. operation (function) Required. A function defining an operation to perform on the key values; the result of this operation is passed to the transform function. Function looks like: myOperation( binder, value, fromModel ).  transform (function) Optional. A function that changes the value whose modification triggered the notification. Function looks like: myTransform( value, fromModel ) returns result. The value parameter is the value about to be set into the view if fromModel is true. The value parameter is the value coming from the view if fromModel is false.
--- @return table # An internal table that defines the binding. Do not modify.
function LrView.bind(binding) end

--- This namespace function allows you to define a view that is added to the layout only if a specific condition is true.
--- @param condition any type If not nil or false, the view is included in the layout.
--- @param view view description The view to include if condition is true.
function LrView.conditionalItem(condition, view) end

--- This namespace function produces a factory object that can be used to create views and controls.
--- @return table # The factory object.
function LrView.osFactory() end

--- This namespace function declares the sharing of an attribute value with other views.
--- @param name string The name to be used to share this attribute with other views.
--- @return table # An internal table that defines the sharing. Do not modify.
function LrView.share(name) end

return LrView
