#!/usr/bin/env lua
-- file: arrayprint.lua
-- Exercise 5.2: Write a function that receives an array and prints all
-- the elements in that array. Consider the pros and cons of using
-- table.unpack in this function

-- prints all the items in an array
function arrayprint(ary)
    for key, value in pairs(ary) do
        print(key .. ' --> ' .. tostring(value))
    end
end

-- print an array from a variable
a = {firstname="John", lastname="Doe", age=25, interests={"Lua"}}
arrayprint(a)

-- use the short syntax for passing an array
-- "nothing" will not be printed, since any member
-- that is nil is effectively nonexistant
arrayprint{boolean=true, nothing=nil, number=3.14}
