---@meta

---@class LrSocket
local LrSocket = {}

--- Closes a socket connection.
function LrSocket:close() end

--- Asks a socket to restablish its connection.
function LrSocket:reconnect() end

--- Sends a message via a "send" mode socket.
---@param message string Message to send.
function LrSocket:send(message) end

--- Reports the type of this object.
---@return string # 'LrSocket'.
function LrSocket:type() end

---@class LrSocketNamespace
local LrSocketNamespace = {}

--- Opens a socket connection (on localhost) for either reading or writing operations.
---@param params table containing the following named parameters: functionContext (LrFunctionContext) The function context. plugin (_PLUGIN) Your plug-in object. port (number) The port number to bind the socket to. If 0, the system automatically chooses a port. mode (requred, string) Must be either "send", "receive". In "send" mode, calls to the controller's send method will send data out via the socket. In "receive" mode, data coming in from the socket will be reported via the callback function. onConnecting (optional, function( socket, port )) called when the socket begins listing for a connection onConnected (optional, function( socket, port)) called when the socket establishes a connection onError (optional, function( socket, error)) called when the socket connection encounters an error (ex: "timeout" ) onMessage (optional, function( socket, message)) called when the socket receives a message onClosed (optional, function( socket )) called when th socket connection closes
---@return LrSocket # A controller object with the methods: send( message ): Sends string messages to the socket (mode must be "send"). reconnect(): tries to re-establish the socket connection (for example, call this after a "timeout" error to retry) close(): closes the socket connection. After calling this, send and reconnect can no longer be called on this connection object.
function LrSocketNamespace.bind(params) end

return LrSocketNamespace
