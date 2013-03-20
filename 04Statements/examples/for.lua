#!/usr/bin/env lua
-- file: for.lua
-- There are 2 kinds of for loops in Lua: the numeric
-- for loop, which iterates through a given range of
-- numbers, and the generic for, which accepts an
-- iterator as argument and iterates over the values
-- it gets.

-- This is a simple numeric loop. The loop needs three
-- pieces of information: the name of the loop variable
-- (i in this case), the starting point (1) and where
-- to stop (3). The numbers are always inclusive.
for i = 1, 3 do
    print('i = ' .. i)
end

-- Optionally, the numeric for loop can take a step
-- parameter, specifying how big the increases of
-- the loop variable should be. An interesting use
-- of this is to loop backwards:
for j = 3, 1, -1 do -- negative step variable
    print("j = " .. j)
end

-- This is one example of a common generic for loop.
-- The iterator used here is pairs(), which takes
-- a table as argument and walks through the table's
-- data, one key/value pair at a time.
t = {name="John Doe", age=25, rank="noob"}
for key, value in pairs(t) do
    print(key .. ' --> ' .. value)
end

-- Another common iterator is ipairs(), which takes
-- a sequence as argument and walks through that.
s = {1, 1, 2, 3, 5, 8}
for index, value in ipairs(s) do
    print('fibonacci number: ' .. value)
end
