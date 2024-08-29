---@meta

---@class LrHttp
local LrHttp = {}

--- Retrieves data over the network using HTTP or HTTPS GET.
---@param url string The URL to get.
---@param headers table? A table of tables, one for each header. Each header table has a 'field' and a 'value' entry. Unless you specify a 'Content-Type' header, Lightroom will add such a header with a value of 'text/plain'. To force the omission of a 'Content-Type' header, specify a 'Content-Type' header with a value of 'skip'.
---@param timeout number The length of time (in seconds) to wait during each phase of the connection before canceling the request. This parameter will be ignored by Lightroom 1.3 and 1.4.
function LrHttp.get(url, headers, timeout) end

--- Opens a URL in the user's preferred web browser.
---@param url string The URL to open.
function LrHttp.openUrlInBrowser(url) end

--- Converts a received "Set-Cookie" field into a Lua table.
---@param cookie string The received cookie value from a 'Set-Cookie' HTTP header.
---@param decodeUrlEncoding boolean? True to decode URL-encoded content. Default is true.
function LrHttp.parseCookie(cookie, decodeUrlEncoding) end

--- Sends or retrieves data using HTTP or HTTPS POST.
---@param url string The URL to post to.
---@param postBody any
---@param headers table? A table of tables, one for each header. Each header table has a 'field' and a 'value' entry. To specify the content type of your post, include a "Content-Type" header. Unless you specify a 'Content-Type' header, Lightroom will add such a header with a value of 'text/plain'. To force the omission of a 'Content-Type' header, specify a 'Content-Type' header with a value of 'skip'.
---@param method string? The name of the HTTP method to use. Default is "POST".
---@param timeout number The length of time (in seconds) to wait during each phase of the connection before canceling the request. This parameter will be ignored by Lightroom 1.3 and 1.4.
---@param totalSize number The total size of the post body, when a byte getter function is passed in for the 'postBody' parameter, which is only supported starting with Lightroom 4.1.
function LrHttp.post(url, postBody, headers, method, timeout, totalSize) end

--- Sends or retrieves MIME-Multipart data using HTTP or HTTPS POST.
---@param url string The URL to post to.
---@param content table An array of content chunks. The data for each chunk is either in a file, or in a string. If both are specified, the file is used. Each entry in the table should contain: name (optional, string): The name of the multipart chunk. fileName (optional, string): The name of a file to pass in the MIME header. filePath (optional, string): The path to the file. value (optional, string (or, as of Lightroom 4.0, a function)): The data for the chunk. As of Lightroom 4.0, this may also be a callback function to be called to provide data chunks. If this approach is used, the content table may only contain one entry. This function must return nil when all the data has been provided, which will be the last time it is called. Required if no file is specified. totalSize (optional, number): As of Lightroom 4.0, required if 'value' is a function. Specifies the total size of the data which will be provided by the data provider function, before it returns nil to indicate that all data has been provided. contentType (optional, string): The content MIME type.
---@param headers table? A table of tables, one for each header. Each header table has a 'field' and a 'value' entry. A Content-Length header will be added automatically if one isn't specified. (It is difficult for the caller of this API to calculate the correct length ahead of time.)
---@param timeout number The length of time (in seconds) to wait during each phase of the connection before canceling the request. This parameter will be ignored by Lightroom 1.3 and 1.4.
---@param callbackFn function? Will be called back with a number between 0 and 1 indicating the % of the upload that has completed
---@param suppressFormData boolean? If true, a 'Content-Disposition' header will not be added to each MIME chunk.
function LrHttp.postMultipart(url, content, headers, timeout, callbackFn, suppressFormData) end

return LrHttp
