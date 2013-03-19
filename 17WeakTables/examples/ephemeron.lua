#!/usr/bin/env lua
-- file: ephemeron.lua
-- Weak tables can help the garbage collector a lot already.
-- However, problems arise when, in a table with weak keys,
-- the values have direct or indirect references to the keys.
-- In this case, a strict interpretation of weak tables would
-- be counter-productive.
-- To remedy this, Lua 5.2 has ephemeron tables, where in
-- tables with weak keys references from table values are 
-- treated as weak references. This example defines a
-- a factory that takes one argument, and it returns a 
-- function that will return this argument when called.

-- the do-end block hides the local variable 'mem' since
-- it's not needed outside of the block.
do
    -- a table to cache the functions that are returned
    -- (since there needs to be only one function per object
    -- returned)
    local mem = {}

    -- make the keys of the caching table weak. this means
    -- that if there is no reference to the key (object)
    -- anymore, the entry will be garbage collected.
    -- The values (closures that return their respective
    -- object) also have some kind of reference to the
    -- object, but this is ignored (ephemeron table)
    setmetatable(mem, {__mode = "k"})

    -- the factory. takes any Lua variable as argument
    function factory(o)
        -- gets the closure function from the cache
        local res = mem[o]

        -- if it's not in the cache, construct it
        if not res then
            res = function() return o end

            -- be sure to save it in the cache for
            -- later
            mem[o] = res
        end

        -- return the closure
        return res
    end
end
