-- file: embedding.lua

-- two ways to embed XML data
-- into Lua. First uses a long
-- string literal while the second
-- one uses the more compact
-- escaped string version.
xmldata1 = [=[
<![CDATA[
  Hello World
]]>]=]

xmldata2 = "<![CDATA[\n  Hello World\n]]>"

-- these two forms are identical,
-- but the former is more readable.
print("xmldata1 == xmldata2 --> " .. ((xmldata1==xmldata2) and "true" or "false"))
print(xmldata1)
