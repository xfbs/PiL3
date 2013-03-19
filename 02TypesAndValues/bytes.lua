#!/usr/bin/env lua
-- file: bytes.lua
-- Exercise 2.5: Suppose you need to format a long sequence
-- of arbitrary bytes as a string literal in Lua. How would
-- you do it? Consider issues like readability, maximum line
-- length, and performance.

-- In such a case, I would use a long string literal. The
-- advantage here is that it doesn't need much escaping, but 
-- one can still enter arbitrary binary data. It can be as
-- long as necessary, it can span multiple lines and it
-- should be quite fast.
data = [[
fklshfs lkfhjsdfsdf sdklfshghsfglksdfh...
]]

