#!/usr/bin/env lua
-- file: hamming.lua
-- Exercise 19.2: Write a function to compute the Hamming
-- weight of a given integer. (The Hamming weight of a
-- number is the number of ones in it's binary
-- representation.)

function hamming(num)
    -- convert num to an int
    num = bit32.bor(num)

    -- count each bit
    local weight = 0
    for i = 0, 31 do
        weight = weight + bit32.extract(num, i)
    end

    return weight
end
