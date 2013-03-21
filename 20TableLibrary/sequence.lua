#!/usr/bin/env lua
-- file: sequence.lua
-- Exercise 20.3: Write a function to test whether a
-- given table is a valid sequence

-- A valid sequence "seq" has elements from 1 to #seq
-- without any gaps (nils) in between
function sequence(s)
    local max = #s

    -- traverse table part to see if any indexes do
    -- not fall into the valid sequence part
    for k, v in pairs(s) do
        if type(k) ~= "number" then
            return false
        elseif k < 1 or k > max then
            return false
        end
    end

    -- traverse array to see if there are embedded nils
    for i = 1, max do
        if s[i] == nil then
            return false
        end
    end

    return true
end

assert(sequence{"a", "b", "c"})
assert(sequence{"a", "b", nil})
assert(not sequence{"a", nil, "b"})
assert(not sequence{nil, "b", "c"})
assert(not sequence{[0]="a", "b", "c"})
