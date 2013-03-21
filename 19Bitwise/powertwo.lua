#!/usr/bin/env lua
-- file: powertwo.lua
-- Exercise 19.1: Write a function to test whether
-- a given integer is a power of two.

-- A number that is a power of two has only one 
-- bit set in binary representation. This function
-- goes through the individual bits and checks if
-- one (only one) is set to 1.
function powertwo(num)
    -- turn num into int
    num = bit32.bor(num)

    -- go through all bits, setting bit to true
    -- if we found the true bit, if there are
    -- more than one true bit return false
    local bit = 0
    while num > 0 do
        if bit32.band(num, 1) == 1 then
            if bit == 1 then
                return false
            else
                bit = 1
            end
        end

        num = bit32.rshift(num, 1)
    end

    -- the number is a power of two if the bit
    -- has been set (otherwise it's 0)
    return bit == 1
end
