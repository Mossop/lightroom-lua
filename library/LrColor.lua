---@meta

---@class LrColor
local LrColor = {}

--- Retrieves the alpha (transparency) value of this color.
---@return number # The alpha value in the range [0.0..1.0]
function LrColor:alpha() end

--- Retrieves the blue value of this color.
---@return number # The blue value in the range [0.0..1.0]
function LrColor:blue() end

--- Retrieves the green value of this color.
---@return number # The green value in the range [0.0..1.0]
function LrColor:green() end

--- Retrieves the red value of this color.
---@return number # The red value in the range [0.0..1.0]
function LrColor:red() end

--- Reports the type of this object.
---@return string # 'LrColor'.
function LrColor:type() end

--- Creates an LrColor object.
---@param ... any
---@return any
local function LrColorConstructor(...) end

return LrColorConstructor
