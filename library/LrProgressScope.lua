---@meta

---@class LrProgressScope
local LrProgressScope = {}

--- Attaches this progress scope to a function context so that it can be cleared when the function ends, regardless of how the function is terminated.
---@param context LrFunctionContext The function context.
function LrProgressScope:attachToFunctionContext(context) end

--- Signals that this operation should be canceled.
function LrProgressScope:cancel() end

--- Marks this progress scope as complete.
function LrProgressScope:done() end

--- Returns the parent progress scope, if any.
function LrProgressScope:getParentScope() end

--- Retrieves the portion of this task that has been marked as completed.
---@return number # The proportion of the work that has been done, in the range [0..totalAmount].
function LrProgressScope:getPortionComplete() end

--- Reports whether this progress scope can be canceled.
---@return boolean # True if scope can be canceled.
function LrProgressScope:isCancelable() end

--- Reports whether this operation been canceled by the user.
---@return boolean # True if progressScope:cancel() has been called.
function LrProgressScope:isCanceled() end

--- Reports whether this progress scope has been completed.
---@return boolean # True if done() has been called
function LrProgressScope:isDone() end

--- Reports whether this progress scope is indeterminate.
---@return boolean # True if setIndeterminate() has been called, false otherwise.
function LrProgressScope:isIndeterminate() end

--- Reports whether this progress scope has low ui priority.
---@return boolean # True if scope has low ui priority.
function LrProgressScope:isLowUiPriority() end

--- Reports whether this progress scope can be paused.
---@return boolean # True if scope can be paused.
function LrProgressScope:isPausable() end

--- Reports whether this operation been paused by the user.
---@return boolean # True if progressScope:pause() has been called.
function LrProgressScope:isPaused() end

--- Signals that this operation should be paused.
function LrProgressScope:pause() end

--- Allows or disallows user cancellation of this progress scope.
---@param cancelable boolean True to allow cancellation, false to disallow it.
function LrProgressScope:setCancelable(cancelable) end

--- Changes the caption that identifies this child task.
---@param caption string The new caption.
function LrProgressScope:setCaption(caption) end

--- Makes this progress scope indeterminate.
function LrProgressScope:setIndeterminate() end

--- Allows or disallows capability of user to change ui priority of this progress scope.
---@param inPrior boolean True to set low ui priority, False to set high ui priority.
function LrProgressScope:setLowUiPriority(inPrior) end

--- Allows or disallows capability of user to pause this progress scope.
---@param pausable any
---@param cancelable boolean True to allow, false to disallow it.
function LrProgressScope:setPausable(pausable, cancelable) end

--- Sets the portion of this task that has been completed.
---@param amountDone number The degree of completion; a value between 0 and totalAmount, inclusive.
---@param totalAmount number The end value of the range, or nil to use the default range of [0..1]
function LrProgressScope:setPortionComplete(amountDone, totalAmount) end

--- Reports the type of this object.
---@return string # 'LrProgressScope'.
function LrProgressScope:type() end

--- Creates a progress scope object.
---@param params table Arguments in named-argument syntax: parent: (optional, LrProgressScope) The parent scope, if this is a child scope. parentEndRange: (optional, number) If this is a child scope, the percentage value [0..1] for the degree of completion of the parent scope when this task completed. title: (optional, string) For a parent scope, the display name that identifies this scope for its entire lifetime; for example, "Exporting files as JPEG". caption: (optional, string) For a child scope, the display name of the current task; for example, "IMG0057.JPG". functionContext: (optional, LrFunctionContext) A function context to attach to this progress scope. If provided, the progress scope is terminated when the function scope completes.
---@return LrProgressScope
local function LrProgressScopeConstructor(params) end

return LrProgressScopeConstructor
