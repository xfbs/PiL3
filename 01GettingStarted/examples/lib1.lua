#!/usr/bin/env lua
-- file: lib1.lua
-- an example of external functions in Lua

function norm(x, y)
    return (x^2 + y^2)^0.5
end

function twice(x)
    return 2*x
end
