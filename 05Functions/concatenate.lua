#!/usr/bin/env lua
-- file: concatenate.lua
-- Exercise 5.1: Write a function that receives an arbitrary number
-- of strings and returns all of them concatenated together

-- function to concatenate all the strings
-- passed as arguments
function concatenate(...)
    -- put the variable arguments into an array
    args = table.pack(...)

    -- complain if there are no arguments
    if args.n == 0 then
        return "concatenate: no arguments!"
    end

    -- concatenate arguments
    str = tostring(args[1])
    for i = 2, args.n do
        str = str .. ' ' .. tostring(args[i])
    end
    return str
end

-- some examples
print(concatenate('This', 'is', 'a', 'concatenated', 'string.'))
print(concatenate(true))
print(concatenate())
