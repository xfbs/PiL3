#!/usr/bin/env lua
-- file: explain.lua
-- Exercise 17.4: Explain the output of the following program:

local count = 0

-- a metatable that defines a finalizer, which decreases the
-- count variable on invocation
local mt = {__gc = function() count = count - 1 end}

-- a variable to hold the objects that will be created
local a = {}

-- repeat this 10000 times
for i = 1, 10000 do
    -- increment the count variable
    count = count + 1

    -- create a new table, set it's metatable to the metatable
    -- with the finalizer and store the result in a
    a[i] = setmetatable({}, mt)
end

-- collect garbage. doesn't have much to do because there
-- is not garbage (everything has a reference to it).
-- collectgarbage("count") returns how much memory Lua needs
-- at this point.
-- count is 10000 right now (because we increased it to that
-- value in the loop)
collectgarbage()
print(collectgarbage"count" * 1024, count)

-- delete the reference to a (let the garbage collecting begin!)
a = nil

-- collect garbage. this first time, the gc will find out that
-- there are 10001 tables floating around and call their
-- finalizers. this will not reduce memory (at least not very
-- much), but it will bring the count down to 0
collectgarbage()
print(collectgarbage"count" * 1024, count)

-- now that everything is finalized, nothing stands in the way 
-- of actually collecting the data. after this, the memory will
-- decrease and count will still be 0.
collectgarbage()
print(collectgarbage"count" * 1024, count)
