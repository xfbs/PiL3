#!/usr/bin/env lua
-- file: random.lua
-- Shows how to generate randomness from within Lua

-- seed the pseudorandom number generator
-- anything can be used as seed, often the
-- current time is used as it is available
-- from everywhere
math.randomseed(os.time())

-- harvest random numbers
for i = 1, 10 do
    print(math.random(100))
end
