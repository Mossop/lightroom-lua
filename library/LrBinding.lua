---@meta

---@class LrBinding
---@field kUnsupportedDirection any
local LrBinding = {}

--- Creates a binding that determines if the values of all the source keys evaluate to true.
---@param optObject table? If specified, overrides the default bound table.
---@param keys (string[] | table[]) Additional arguments for the keys whose values are observed. An argument can be a simple string (a key name from the bound table), or a table that specifies a key from a different table, as a key-value pair: key A key name. bind_to_object or object The name of an observable table which overrides the current bound table.
---@return boolean # True if all of the source values evaluate to true, false otherwise.
function LrBinding.andAllKeys(optObject, keys) end

--- Creates a binding that determines if the source value is equal to a comparison value.
---@param key string The key to bind to.
---@param compareValue any The key in the bound table whose value is observed.
---@param optObject table? If specified, overrides the default bound table.
---@return boolean # True if the source value is equal to the comparison value, false otherwise.
function LrBinding.keyEquals(key, compareValue, optObject) end

--- Creates a binding that determines if the source value is not present.
---@param key string The key in the bound table whose value is observed.
---@param optObject table? If specified, overrides the default bound table.
---@return boolean # True if the source value is nil, false otherwise.
function LrBinding.keyIsNil(key, optObject) end

--- Creates a binding that determines if the source value is not equal to a comparison value.
---@param key string The key in the bound table whose value is observed.
---@param compareValue any The value to compare against.
---@param optObject table? If specified, overrides the default bound table.
---@return boolean # True if the source value is not equal to the comparison value, false otherwise.
function LrBinding.keyIsNot(key, compareValue, optObject) end

--- Creates a binding that determines if the source value is present.
---@param key string The key in the bound table whose value is observed.
---@param optObject table? If specified, overrides the default bound table.
---@return boolean # True if the source value is not nil, false otherwise.
function LrBinding.keyIsNotNil(key, optObject) end

--- Creates a table that automatically sends notifications whenever values in the table are changed.
---@param functionContext LrFunctionContext The function-context object that manages the lifetime of this property table. All notifications are canceled automatically when the context exits
---@return LrObservableTable # The observable table. See also LrView, LrFunctionContext
function LrBinding.makePropertyTable(functionContext) end

--- Creates a binding that negates the source value, if it is Boolean or numeric.
---@param key string The key in the bound table whose value is observed.
---@param optObject table? If specified, overrides the default bound table.
---@return (boolean | number) # True if the source value is false, false if it is true. The negation of a numeric value. Nil for a source value of any other type.
function LrBinding.negativeOfKey(key, optObject) end

--- Creates a binding that determines if the values of any of the source keys evaluate to true.
---@param optObject table? If specified, overrides the default bound table.
---@param keys table The keys whose values are observed. Entries can be simple key names from the bound table, or you can specify a key in another table, using a key-value pair, in which the value part can be a table with these items: key A key name bind_to_object or object Optional. The name of an observable table which overrides the current bound table.
---@return boolean # True if any of the source values evaluate to true, false otherwise.
function LrBinding.orAllKeys(optObject, keys) end

return LrBinding
