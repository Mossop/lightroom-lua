--- @meta LrDate

--- @class LrDate
local LrDate = {}

--- Retrieves the current date and time as a Cocoa date stamp; that is, a number of seconds since midnight UTC on January 1, 2001.
--- @return number # The current date and time as a Cocoa date stamp value.
function LrDate.currentTime() end

--- Converts a timestamp to the user's preferred long date format.
--- @param time number The Cocoa date stamp; that is, a number of seconds since midnight UTC on January 1, 2001.
--- @return string # Date in long-date format.
function LrDate.formatLongDate(time) end

--- Converts a timestamp to the user's preferred medium date format.
--- @param time number The Cocoa date stamp; that is, a number of seconds since midnight UTC on January 1, 2001.
--- @return string # Date in medium-date format.
function LrDate.formatMediumDate(time) end

--- Converts a timestamp to the user's preferred medium time format.
--- @param time number The Cocoa date stamp; that is, a number of seconds since midnight UTC on January 1, 2001.
--- @return string # Time in medium-time format.
function LrDate.formatMediumTime(time) end

--- Converts a timestamp to the user's preferred short date format.
--- @param time number The Cocoa date stamp; that is, a number of seconds since midnight UTC on January 1, 2001.
--- @return string # Date in short-date format.
function LrDate.formatShortDate(time) end

--- Converts a timestamp to the user's preferred short time format.
--- @param time number The Cocoa date stamp; that is, a number of seconds since midnight UTC on January 1, 2001.
--- @return string # Time in short-time format.
function LrDate.formatShortTime(time) end

--- Composes a time stamp from the component values.
--- @param year number The 4-digit year.
--- @param month number The month, in the range [1..12]
--- @param day number The day, in the range [1..31]
--- @param hour number The hour, in the range [0..23]
--- @param minute number The minute, in the range [0..59]
--- @param second number The second, in the range [0..59]
--- @param timeZone [number, string, boolean] The string "local" or true to use the local time zone, or an explicit time zone, expressed as the difference in seconds from UTC. For example, U.S. Pacific Standard Time is -28800. Warning: The 1.3 SDK documentation incorrectly stated that the timeZone parameter was expressed in hours relative to UTC.
--- @return number # The time as a Cocoa date stamp; that is, a number of seconds since midnight UTC on January 1, 2001.
function LrDate.timeFromComponents(year, month, day, hour, minute, second, timeZone) end

--- Converts a Unix/Posix-style date timestamp to a Mac-style timestamp.
--- @param time number The Unix/Posix date stamp; that is, a number of seconds since midnight UTC on January 1, 1970
--- @return number # The Cocoa date stamp; that is, a number of seconds since midnight UTC on January 1, 2001
function LrDate.timeFromPosixDate(time) end

--- Converts a timestamp to an ISO formatted date (not including the time).
--- @param time number The Cocoa date stamp; that is, a number of seconds since midnight UTC on January 1, 2001.
--- @return string # An ISO formatted date string (such as  "2007-10-06").
function LrDate.timeToIsoDate(time) end

--- Converts a Mac-style timestamp to a Unix/Posix-style date timestamp.
--- @param time number The Cocoa date stamp; that is, a number of seconds since midnight UTC on January 1, 2001
--- @return number # The Unix/Posix date stamp; that is, a number of seconds since midnight UTC on January 1, 1970
function LrDate.timeToPosixDate(time) end

--- Converts a timestamp to a specified date-time format.
--- @param time number The Cocoa date stamp; that is, a number of seconds since midnight UTC on January 1, 2001.
--- @param format string The date-time format string. Use the following special strings for date elements:  %B: Full name of month %b: 3-letter name of month %m: 2-digit month number %d: Day number with leading zero %e: Day number without leading zero %j: Julian day of the year with leading zero %a: Day name abbreviation %A: Day name %y: 2-digit year number %Y: 4-digit year number %H: Hour with leading zero (24-hour clock) %1H: Hour without leading zero (24-hour clock) %I: Hour with leading zero (12-hour clock) %1I: Hour without leading zero (12-hour clock) %M: Minute with leading zero %S: Second with leading zero %p: AM/PM designation %P: AM/PM designation, same as %p,but causes white space trimming to be applied as the last formatting step. %%: % symbol
--- @param isGMT boolean If true, use GMT rather than the local timezone when converting to the user format.
--- @return string # The formatted date-time string.
function LrDate.timeToUserFormat(time, format, isGMT) end

--- Converts a timestamp to a W3C formatted date and time.
--- @param time number The Cocoa date stamp; that is, a number of seconds since midnight UTC on January 1, 2001.
--- @return string # A W3C formatted date-time string (such as "2007-10-06T12:54:39-07:00").
function LrDate.timeToW3CDate(time) end

--- Retrieves the current time zone and reports whether that zone is currently observing daylight savings time.
function LrDate.timeZone() end

--- Converts a Cocoa date stamp to its components (that is, individual values for year, month, day, and so on).
--- @param time number The date and time as a Cocoa date stamp value (i.e. number of seconds since midnight UTC on January 1, 2001).
--- @param optTimeZone number An optional time zone bias to apply to the date stamp before conversion, expressed as a number of seconds relative to UTC (i.e. US Central Standard Time would be -21600). Defaults to local time zone if not supplied.
function LrDate.timestampToComponents(time, optTimeZone) end

return LrDate
