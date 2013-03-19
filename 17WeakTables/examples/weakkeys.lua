#!/usr/bin/env lua
-- file: weakkeys.lua
-- Weak tables are the mechanism that you use to tell Lua
-- that a reference should not prevent the reclamation of
-- an object.
-- Weak tables can be fully weak, or have only weak keys
-- or weak values. In the case of weak keys or values, an
-- entry will only be collected if there is no reference
-- to the weak part (key/value) of the table.
-- This is a demonstration of a table with weak keys:

-- create a regular Lua table
a = {}

-- turn it into a table with weak keys with the __mode
-- field in the metatable
mt = {__mode = "k"}
setmetatable(a, mt)

-- create a new key and associate with 1 in the table
key = {}
a[key] = 1

-- create a new key, overwriting the old one (there is
-- no more reference to the old key anymore) and
-- associate it with 2 in the table
key = {}
a[key] = 2

-- force a garbage collection cycle to take place
collectgarbage()

-- print all values that exist in the table
for k, v in pairs(a) do
    print(v)    --> will print 2
end
