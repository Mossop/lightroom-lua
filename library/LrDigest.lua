---@meta

---@class Factory
local Factory = {}

--- Quick digest a string
---@param input string Add the input string to the ongoing digest
---@param digest_name string one of the digests support in this namespace: "SHA256" or "SHA512". Only used for HMAC.
---@param key string the key for HMAC. Only used for HMAC.
function Factory.digest(input, digest_name, key) end

--- Create a new digester instance
---@return digester # The new digester
function Factory.init() end

---@class LrDigest
local LrDigest = {}

--- Construct a HMAC digest
---@param digest_name string one of the digests support in this namespace: "SHA256" or "SHA512"
---@param key string the key for HMAC
---@return digester # The new digester, or nil if params are invalid
function LrDigest.HMAC.init(digest_name, key) end

---@class digester
local digester = {}

--- Compute the current digest for the digester
function digester:digest() end

--- Clear a digester making ready for reuse
function digester:reset() end

--- Add new data to a digester
---@param str string Add the input string to the ongoing digest
function digester:update(str) end

return Factory
