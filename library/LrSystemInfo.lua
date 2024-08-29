---@meta

---@class LrSystemInfo
local LrSystemInfo = {}

--- Reports the size of the main Lightroom application window.
function LrSystemInfo.appWindowSize() end

--- Reports the CPU architecture of the host computer.
---@return string # System architecture, one of 'x86', 'x64', 'ppc', or 'ppc64'.
function LrSystemInfo.architecture() end

--- Reports information about the displays available to the system.
---@return table # An array of tables, one per display, each with these entries: width (number) Width of the display in pixels. height (number) Height of the display in pixels. isMain (Boolean) True if the display is the main system display. hasAppMain (Boolean) True if the main Lightroom window is currently hosted on the display.
function LrSystemInfo.displayInfo() end

--- Retrieves the IP address of the system running Lightroom.
---@return string # The IP address.
function LrSystemInfo.ipAddress() end

--- Reports whether the host is running a 64-bit operating system.
---@return boolean # True if on 64-bit OS; false otherwise
function LrSystemInfo.is64Bit() end

--- Reports whether GC Optimization is enabled or not.
---@return boolean # True if GC Optimization is enabled; false if GC Optimization is disabled.
function LrSystemInfo.isGCOptimizationEnabled() end

--- Reports whether Sync is enabeld or not.
---@return boolean # True if sync is enabled; false if sync is disabled or paused.
function LrSystemInfo.isSyncEnabled() end

--- Reports the amount of physical RAM installed on the host computer.
---@return number # Size of physical memory in bytes.
function LrSystemInfo.memSize() end

--- Reports the number of CPUs on the host computer system.
---@return number # Number of CPUs or CPU cores.
function LrSystemInfo.numCPUs() end

--- Reports the version of the current operating system.
---@return string # A string description of the OS version, such as "Microsoft Windows XP Professional Service Pack 3 (Build 2600)".
function LrSystemInfo.osVersion() end

--- Returns a summary of system information.
---@return string # A string description of the system information, such as "Microsoft Windows XP Professional Service Pack 3 (Build 2600) (x86)".
function LrSystemInfo.summaryString() end

return LrSystemInfo
