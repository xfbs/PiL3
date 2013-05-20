#!/usr/bin/env lua
-- file: redefine.lua
-- Redefines the Lua math.sin function to
-- work with degrees

-- Everything is put into a chunk so that
-- nothing leaks out
do
    -- save the original functions
    local sin, asin = math.sin, math.asin
    local deg, rad = math.deg, math.rad

    -- overwrite the functions from the
    -- math library
    math.sin = function(x) return sin(rad(x)) end
    math.asin = function(x) return deg(asin(x)) end
end

-- test it out
assert(math.sin(90) == 1)
assert(math.asin(1) == 90)
