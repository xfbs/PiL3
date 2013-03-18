#!/usr/bin/env lua
-- file: embedding.lua
-- Exercise 2.4: How can you embed the following piece
-- of XML as a string in Lua? Show at least two
-- different ways.

-- you can use a long string literal
-- -> no need to escape stuff
-- -> readable
-- -> ugly if the line this is on is indented
xmldata1 = [=[
<![CDATA[
  Hello World
]]>]=]

-- an escaped string
-- -> full control over what's in string
-- -> not too readable
-- -> compact
xmldata2 = "<![CDATA[\n  Hello World\n]]>"

-- these two forms are identical,
print("xmldata1 == xmldata2 --> " .. ((xmldata1==xmldata2) and "true" or "false"))
print(xmldata1)
