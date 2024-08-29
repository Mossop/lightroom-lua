---@meta

---@class LrApplicationView
local LrApplicationView = {}

--- Changes the Loupe View Info style.
function LrApplicationView.cycleLoupeViewInfo() end

--- Changes the screen mode to Full Screen and Hide Panels.
function LrApplicationView.fullscreenHidePanels() end

--- Changes the screen mode to Full Screen Preview.
function LrApplicationView.fullscreenPreview() end

--- Returns the name of the currently active module.
---@return string # The name of the current module, one of: "library", "develop", "map", "book", "slideshow", "print", "web".
function LrApplicationView.getCurrentModuleName() end

--- Returns the name of the view currently showing on the secondary screen, or nil of the secondary display is not on.
---@return string # The name of the secondary view being shown, one of: "loupe", "live_loupe", "locked_loupe", "grid", "compare", "survey", "slideshow", or nil.
function LrApplicationView.getSecondaryViewName() end

--- Opens Grid View.
function LrApplicationView.gridView() end

--- Changes the Grid View Style.
function LrApplicationView.gridViewStyle() end

--- Returns true if the secondary window is currently on.
function LrApplicationView.isSecondaryDisplayOn() end

--- Changes the Screen Mode.
function LrApplicationView.nextScreenMode() end

--- Shows a view on the secondary screen, or hides the secondary screen if the given view was previously being shown.
---@param viewName string The name of the secondary view to show, one of: "loupe", "live_loupe", "locked_loupe", "grid", "compare", "survey", "slideshow".
function LrApplicationView.showSecondaryView(viewName) end

--- Switches the app's view mode.
---@param viewName string The name of the view to show, one of: "loupe", "grid", "compare", "survey", "people", "develop_loupe", "develop_before_after_horiz", "develop_before_after_vert", "develop_before", "develop_reference_horiz", "develop_reference_vert"
function LrApplicationView.showView(viewName) end

--- Switches between modules.
---@param moduleName string The name of the module to activate, one of: "library", "develop", "map", "book", "slideshow", "print", "web".
function LrApplicationView.switchToModule(moduleName) end

--- Toggle Loupe View while in Library.
function LrApplicationView.toggleLoupe() end

--- Toggles the the secondary window on/off.
function LrApplicationView.toggleSecondaryDisplay() end

--- Toggles fullscreen mode for the secondary window.
function LrApplicationView.toggleSecondaryDisplayFullscreen() end

--- Zooms toggles between zoomed in and zoomed out.
function LrApplicationView.toggleZoom() end

--- Zooms in to next level.
function LrApplicationView.zoomIn() end

--- Zooms in one small step.
function LrApplicationView.zoomInSome() end

--- Zooms out to next level.
function LrApplicationView.zoomOut() end

--- Zooms out one small step.
function LrApplicationView.zoomOutSome() end

--- Zooms to 100%.
function LrApplicationView.zoomToOneToOne() end

return LrApplicationView
