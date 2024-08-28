--- @meta LrProgressScope

--- @class LrProgressScope
--- Creates a progress scope object.
--- @param params table Arguments in named-argument syntax:  parent: (optional, LrProgressScope) The parent scope, if this is a child scope. parentEndRange: (optional, number) If this is a child scope, the percentage value [0..1] for the degree of completion of the parent scope when this task completed.  title: (optional, string) For a parent scope, the display name that identifies this scope for its entire lifetime; for example, "Exporting files as JPEG".  caption: (optional, string) For a child scope, the display name of the current task; for example, "IMG0057.JPG". functionContext: (optional, LrFunctionContext) A function context to attach to this progress scope. If provided, the progress scope is terminated when the function scope completes.
function LrProgressScope(params) end

return LrProgressScope
