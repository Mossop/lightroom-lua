--- @meta LrXml

--- @class LrXml
local LrXml = {}

--- Creates an XML builder object (builderInstance) for constructing an XML document.
--- @param omitDeclaration any
--- @return builderInstance # A new XML builder object.
function LrXml.createXmlBuilder(omitDeclaration) end

--- Parses a string containing valid XML to create and return a read-only XML DOM object (xmlDomInstance) which you can use to examine the XML content.
--- @param xmlString string A string containing XML.
--- @return xmlDomInstance # A new XML DOM instance, the root node of the XML node tree.
function LrXml.parseXml(xmlString) end

return LrXml
