#!/usr/bin/env lua
-- file: returning.lua
-- Exercise 5.3: Write a function that receives an arbitrary number of values
-- and returns all of them, except the first one

-- returns all arguments except the first
function do_nothing(first, ...)
    return ...
end

x, y = do_nothing(1, 2, 3)
print('do_nothing(1, 2, 3) = ' .. x .. ', ' .. y)
