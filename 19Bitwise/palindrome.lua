#!/usr/bin/env lua
-- file: palindrome.lua
-- Exercise 19.3: Write a function to test whether
-- the binary representation of a number is a 
-- palindrome

function is_palindrome(num)
    -- convert num to int
    num = bit32.bor(num)

    -- get position of highest bit
    local highest = 31
    while highest >= 0 and bit32.extract(num, highest) ~= 1 do
        highest = highest - 1
    end

    -- get how many bits need to be checked
    local check = math.floor(highest/2)

    -- check the bits
    for i = 0, check do
        if bit32.extract(num, i) ~= bit32.extract(num, highest-i) then
            return false
        end
    end

    return true
end

-- some tests
assert(is_palindrome(9))
assert(is_palindrome(27))
assert(not is_palindrome(41))
assert(not is_palindrome(100))
assert(not is_palindrome(55))
