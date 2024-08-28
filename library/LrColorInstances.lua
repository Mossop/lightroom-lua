--- @meta

--- @class color
local color = {}

--- Retrieves the alpha (transparency) value of this color.
--- @return number # The alpha value in the range [0.0..1.0]
function color:alpha() end

--- Retrieves the blue value of this color.
--- @return number # The blue value in the range [0.0..1.0]
function color:blue() end

--- Retrieves the green value of this color.
--- @return number # The green value in the range [0.0..1.0]
function color:green() end

--- Retrieves the red value of this color.
--- @return number # The red value in the range [0.0..1.0]
function color:red() end

--- Reports the type of this object.
--- @return string # 'LrColor'.
function color:type() end

