#!/usr/bin/env lua
-- file: operations.lua
-- Exercise 19.4: Define the shift operations and the
-- bitwise not using the arithmetic operators in Lua

-- max number (all operations are modulo this constant)
MAX = 2^32

-- binary negation
function bnot(num)
    num = num % MAX
    return MAX - num - 1
end

-- right shift (same as integer division by 2)
function rshift(num, amount)
    num = num % MAX

    num = num / 2^amount

    return math.floor(num)
end

-- left shift (same as multiplication by 2)
function lshift(num, amount)
    num = num % MAX

    num = num * 2^amount

    return num % MAX
end

assert(bnot(4567) == bit32.bnot(4567))
assert(rshift(4567, 2) == bit32.rshift(4567, 2))
assert(lshift(4567, 2) == bit32.lshift(4567, 2))
