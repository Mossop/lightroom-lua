---@meta

---@class LrObservableTable
local LrObservableTable = {}

--- Registers an observer for a property table.
---@param condition string The key name of the property to observe.
---@param table table? The table to associate with this observation. This same table can be used in a subsequent call to removeObserver to discontinue listening for observations. This parameter may also be omitted, in which case the func parameter should move up to the first position.
---@param func function The handler function to call when the observed property changes. The handler takes these arguments: propertyTable: This property table. key: The key whose change triggered the notification. newValue: The new value of the key. You can define a function to handle more than one key notification, using the key argument to distinguish which key changed. If you do, you must pass the function to a separate registration call for each key.
function LrObservableTable:addObserver(condition, table, func) end

--- Iterate the contents of this table.
---@return function # an iterator that can be used in a for loop
function LrObservableTable:pairs() end

--- Unregisters an existing observer on a property table.
---@param condition string The key name of the property to stop observing.
---@param table table The table that was associated with this observation when addObserver was called.
function LrObservableTable:removeObserver(condition, table) end
