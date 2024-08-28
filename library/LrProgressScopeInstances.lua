--- @meta

--- @class progressScope
local progressScope = {}

--- Attaches this progress scope to a function context so that it can be cleared when the function ends, regardless of how the function is terminated.
--- @param context LrFunctionContext The function context.
function progressScope:attachToFunctionContext(context) end

--- Signals that this operation should be canceled.
function progressScope:cancel() end

--- Marks this progress scope as complete.
function progressScope:done() end

--- Returns the parent progress scope, if any.
function progressScope:getParentScope() end

--- Retrieves the portion of this task that has been marked as completed.
--- @return number # The proportion of the work that has been done, in the range [0..totalAmount].
function progressScope:getPortionComplete() end

--- Reports whether this progress scope can be canceled.
--- @return boolean # True if scope can be canceled.
function progressScope:isCancelable() end

--- Reports whether this operation been canceled by the user.
--- @return boolean # True if progressScope:cancel() has been called.
function progressScope:isCanceled() end

--- Reports whether this progress scope has been completed.
--- @return boolean # True if done() has been called
function progressScope:isDone() end

--- Reports whether this progress scope is indeterminate.
--- @return boolean # True if setIndeterminate() has been called, false otherwise.
function progressScope:isIndeterminate() end

--- Reports whether this progress scope has low ui priority.
--- @return boolean # True if scope has low ui priority.
function progressScope:isLowUiPriority() end

--- Reports whether this progress scope can be paused.
--- @return boolean # True if scope can be paused.
function progressScope:isPausable() end

--- Reports whether this operation been paused by the user.
--- @return boolean # True if progressScope:pause() has been called.
function progressScope:isPaused() end

--- Signals that this operation should be paused.
function progressScope:pause() end

--- Allows or disallows user cancellation of this progress scope.
--- @param cancelable boolean True to allow cancellation, false to disallow it.
function progressScope:setCancelable(cancelable) end

--- Changes the caption that identifies this child task.
--- @param caption string The new caption.
function progressScope:setCaption(caption) end

--- Makes this progress scope indeterminate.
function progressScope:setIndeterminate() end

--- Allows or disallows capability of user to change ui priority of this progress scope.
--- @param inPrior boolean True to set low ui priority, False to set high ui priority.
function progressScope:setLowUiPriority(inPrior) end

--- Allows or disallows capability of user to pause this progress scope.
--- @param pausable any
--- @param cancelable boolean True to allow, false to disallow it.
function progressScope:setPausable(pausable, cancelable) end

--- Sets the portion of this task that has been completed.
--- @param amountDone number The degree of completion; a value between 0 and totalAmount, inclusive.
--- @param totalAmount number The end value of the range, or nil to use the default range of [0..1]
function progressScope:setPortionComplete(amountDone, totalAmount) end

--- Reports the type of this object.
--- @return string # 'LrProgressScope'.
function progressScope:type() end

