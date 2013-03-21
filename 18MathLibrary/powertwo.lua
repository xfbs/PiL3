#!/usr/bin/env lua
-- file: powertwo.lua
-- Exercise 18.1: Write a function to test whether a given
-- number is a power of two

-- check if a given number is a power of two
function is_power_of_two(num)
    -- get the logarithm to the base two. this is going to
    -- be an integer if the number is a power of two.
    log2 = math.log(num, 2)

    -- function that determines if a given number is an
    -- integer
    local function is_int(n)
        -- an integer is the same, regardless in which
        -- direction it is rounded
        return math.floor(n)==math.ceil(n)
    end

    -- check if the logarithm is an integer
    -- warning: due to the finite precision that a float
    -- has, this will only work until about 2^40
    return is_int(log2)
end

-- some tests
assert(is_power_of_two(2))
assert(is_power_of_two(8))
assert(is_power_of_two(256))
assert(is_power_of_two(2048))
assert(not is_power_of_two(3))
assert(not is_power_of_two(127))
assert(not is_power_of_two(10000))
assert(not is_power_of_two(2049))
