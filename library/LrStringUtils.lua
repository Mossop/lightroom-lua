--- @meta LrStringUtils

--- @class LrStringUtils
local LrStringUtils = {}

--- Converts a number into a string representation suitable for displaying byte values.
--- @param number number The number of bytes.
--- @param precision number? The total number of digits to show. left and right of the decimal point. The numeric value is rounded to this degree of precision, but trailing zeros are not removed. Default is 2. For example, using the default precision, the call LrStringUtils.byteString( 2000000 ) returns "1.90 MB".
--- @return string # The formatted string for the number of bytes.
function LrStringUtils.byteString(number, precision) end

--- Compares two strings using the operating system's localized string comparison.
--- @param string1 string The first string.
--- @param string2 string The second string.
--- @param treatNumberAsString boolean? Treat numbers in the string as normal string. Default is false
--- @return boolean # True if string1 < string2 according to the user's locale, false otherwise.
function LrStringUtils.compareStrings(string1, string2, treatNumberAsString) end

--- Decodes a string from base-64 encoding.
--- @param string string The base-64 encoded version of string. Only the first argument is decoded, other arguments are ignored.
--- @return string # The decoded version of string
function LrStringUtils.decodeBase64(string) end

--- Encodes a string in base-64 encoding.
--- @param string string The string to encode. Only the first argument is encoded, other arguments are ignored.
--- @return string # The base-64 encoded version of the string.
function LrStringUtils.encodeBase64(string) end

--- Reports whether a string contains only 7-bit ASCII characters.
--- @param string string The string to evaluate.
--- @return string # True if this string contains only 7-bit ASCII characters; false if any other data type is present or any byte is >= 128
function LrStringUtils.isOnlyAscii(string) end

--- Sorts an array of strings in-place, using the operating system's localized string comparison.
--- @param strings table An array of strings to sort.
--- @return nil # Returns nothing.
function LrStringUtils.localizedStringSort(strings) end

--- Converts a string to lowercase using the operating system's localized case conversion.
--- @param string string The string to convert to lowercase. Only the first argument is converted, other arguments are ignored.
--- @return string # The lowercase version of the string.
function LrStringUtils.lower(string) end

--- Formats a number as a string with an optional limit on precision.
--- @param number number The  number to format.
--- @param precision number? The number of digits to allow after the decimal point.Default is 0.
--- @return string # The formatted number string.
function LrStringUtils.numberToString(number, precision) end

--- Formats a number as a string with thousands separators with an optional limit on precision.
--- @param number number The  number to format.
--- @param precision number? The number of digits to allow after the decimal point.Default is 0.
--- @return string # The formatted number string.
function LrStringUtils.numberToStringWithSeparators(number, precision) end

--- Removes whitespace from the beginning and end of a string.
--- @param string string The string to trim.
--- @return string # The string without leading and trailing whitespace.
function LrStringUtils.trimWhitespace(string) end

--- Truncates a string to a maximum number of bytes, preserving the validity of the UTF-8 encoding.
--- @param string string The string to truncate.
--- @param maxBytes number The maximum number of bytes (not characters) to return
--- @return string # The truncated string.
function LrStringUtils.truncate(string, maxBytes) end

--- Converts a string to uppercase using the operating system's localized case conversion.
--- @param string string The string to convert to uppercase. Only the first argument is converted, other arguments are ignored.
--- @return string # The uppercase version of the string.
function LrStringUtils.upper(string) end

return LrStringUtils
