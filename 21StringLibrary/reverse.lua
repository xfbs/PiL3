#!/usr/bin/env lua
-- file: split.lua
-- Exercise 21.4: Write a function to reverse a UTF-8 string.

require "utf8"

-- Function to reverse an array
function table.reverse(t)
    local size = #t
    local r = {}

    for i, v in ipairs(t) do
        r[size-i+1] = v
    end

    return r
end

-- Function to reverse a utf8 string
function reverse(s)
    local code_points
    code_points = utf8.split(s)
    code_points = table.reverse(code_points)
    return table.concat(code_points)
end

-- Test it (should result in the same strings)
print(reverse("!ölläH"), "Hällö!")
