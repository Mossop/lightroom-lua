---@meta

---@class LrDigest
local LrDigest = {}
LrDigest.HMAC = {}

--- Construct a HMAC digest
---@param digest_name string one of the digests support in this namespace: "SHA256" or "SHA512"
---@param key string the key for HMAC
---@return LrDigester? # The new digester, or nil if params are invalid
function LrDigest.HMAC.init(digest_name, key) end

---@class LrDigestFactory
local LrDigestFactory = {}

--- Quick digest a string
---@param input string Add the input string to the ongoing digest
---@param digest_name string one of the digests support in this namespace: "SHA256" or "SHA512". Only used for HMAC.
---@param key string the key for HMAC. Only used for HMAC.
---@return string # The digest, as a hex string
---@return string # The digest, as a binary data string.
function LrDigestFactory.digest(input, digest_name, key) end

--- Create a new digester instance
---@return LrDigester # The new digester
function LrDigestFactory.init() end

---@class LrDigester
local LrDigester = {}

--- Compute the current digest for the digester
---@return string # The digest, as a hex string
---@return string # The digest, as a binary data string
function LrDigester:digest() end

--- Clear a digester making ready for reuse
function LrDigester:reset() end

--- Add new data to a digester
---@param str string Add the input string to the ongoing digest
function LrDigester:update(str) end

return LrDigest
