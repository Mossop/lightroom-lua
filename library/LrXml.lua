---@meta

---@class LrXml
local LrXml = {}

--- Creates an XML builder object (builderInstance) for constructing an XML document.
---@param omitDeclaration any
---@return XmlBuilderInstance # A new XML builder object.
function LrXml.createXmlBuilder(omitDeclaration) end

--- Parses a string containing valid XML to create and return a read-only XML DOM object (xmlDomInstance) which you can use to examine the XML content.
---@param xmlString string A string containing XML.
---@return XmlDomInstance # A new XML DOM instance, the root node of the XML node tree.
function LrXml.parseXml(xmlString) end

---@class XmlBuilderInstance
local XmlBuilderInstance = {}

--- Appends all the XML in another builderInstance to this one at the current point.The other object must not have any unclosed blocks.
---@param otherXmlBuilder XmlBuilderInstance Another XML builder object.
function XmlBuilderInstance:append(otherXmlBuilder) end

--- Adds an XML opening tag to this XML document.
---@param name string The name of the tag.
---@param attributes table? A set of attribute names and values. The keys and values in this table are converted to strings using tostring().
function XmlBuilderInstance:beginBlock(name, attributes) end

--- Appends an XML comment to this XML document.
---@param contents string The text of the new XML comment.
function XmlBuilderInstance:comment(contents) end

--- Adds an XML closing tag to this XML document.
function XmlBuilderInstance:endBlock() end

--- Retrieves the complete XML document as a string.
---@return string # The serialized XML document.
function XmlBuilderInstance:serialize() end

--- Adds a single tag to this XML document, with an optional text child node.
---@param name string The name of the new XML element.
---@param value string? The text content of the new element.
---@param attributes table? A set of attribute names and values. The keys and values in this table are converted to strings using tostring().
function XmlBuilderInstance:tag(name, value, attributes) end

--- Adds a text node to this XML document.
---@param value string The text content of the new element.
function XmlBuilderInstance:text(value) end

---@class XmlDomInstance
local XmlDomInstance = {}

--- Retrieves the attributes of this element node.
---@return table # The attributes as a table, keyed by attribute name. Each entry is itself a table containing keys for "value", "namespace", and "name". If this is not an element node, returns nil.
function XmlDomInstance:attributes() end

--- Retrieves a child of this element node by index.
---@param index any
---@return any
function XmlDomInstance:childAtIndex(index) end

--- Reports the number of children of this element node.
---@return number # The number of children, or nil if this node is not an element node.
function XmlDomInstance:childCount() end

--- Retrieves the name of the xml node from this XML document.
function XmlDomInstance:name() end

--- Converts the XML encapsulated by this object into its string representation.
---@return string # The XML as a string.
function XmlDomInstance:serialize() end

--- Retrieves the text of the xml node from this XML document.
---@return string # The text of the xml node.
function XmlDomInstance:text() end

--- Transforms this XML into string output by applying an XSLT transformation.
---@param xsltString any
---@return string # The output of the XSLT transformation.
function XmlDomInstance:transform(xsltString) end

--- Retrieves the type of the xml node from this XML document.
---@return string # The node type, one of "element", "text", "comment", "processinginstruction"
function XmlDomInstance:type() end

return LrXml
