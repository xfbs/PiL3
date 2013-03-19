#!/usr/bin/env lua
-- file: cycle.lua
-- It is possible to write a program to call a given
-- function on every collection cycle with finalizers.
-- The trick here is to write an object with a
-- finalizer such that when being garbage collected,
-- it creates a new object with the same finalizer.
-- The folliwing example from the book illustrates
-- this:

do
    local mt = {__gc = function(o)
        -- whatever you want to do
        print("new cycle")

        -- creates new object for next cycle
        setmetatable({}, getmetatable(o))
    end}

    -- creates first object
    setmetatable({}, mt)
end

-- call collectgarbage a couple of times to see
-- what happens
collectgarbage()
collectgarbage()
collectgarbage()
