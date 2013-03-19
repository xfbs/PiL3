#!/usr/bin/env lua
-- file: ephemeron.lua
-- Exercise 17.1: Write an experiment to determine whether
-- Lua actually implements ephemeron tables. (Remember to
-- call collectgarbage() to force a garbage collection
-- cycle.) If possible, try your code both in Lua 5.1 and
-- in Lua 5.2 to see the difference.

-- An ephemeron table accounts for the fact that the values
-- of a weak table may have references to the keys, however
-- these can't be counted in when doing a garbage collection
-- since these are only accessible via the key. Thus, in an
-- ephemeron table, the keys are only strong if there is 
-- either a strong reference to them outside of the table.

-- Let's test if ephemeron tables are available in whatever
-- version of Lua is used to run this code:

-- create a key for use in the ephemeron table
key = {}

-- create a value with a back-reference to the key
value = {key=key}

-- construct an ephemeron table from these (mode: weak keys)
ephemeron = {}
ephemeron[key] = value
setmetatable(ephemeron, {__mode = "k"})

-- create finalizers to keep track of whether the key
-- and/or the value was collected
mt = {__gc = function(t)
    print("ephemeron behavior detected! " .. (t.key and "value" or "key"))
end}
setmetatable(key, mt)
setmetatable(value, mt)

-- run gc (should not collect anything since we have
-- references to both the key and the value)
collectgarbage()

-- run gc with reference to value (should not collect
-- anything because we still have a reference to the value
-- and with it, a reference to the key)
key = nil
collectgarbage()

-- run gc with reference to key (should not collect anything
-- since we still have a reference to the key, and only keys
-- are weak in the ephemeron table)
key = value.key
value = nil
collectgarbage()

-- run gc without any references (should collect both the key
-- and the value, since the reference to the key of the value
-- should be ignored)
print("ephemeron table behavior should be detected:")
key = nil
collectgarbage()
