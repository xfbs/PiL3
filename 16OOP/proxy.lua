#!/usr/bin/env lua
-- file: proxy.lua
-- Exercise 16.3: Another way to provide privacy for objects is to
-- implement them using proxies (Section 13.4). Each object is 
-- represented by an empty proxy table. An internal table maps
-- proxies to tables that carry the object state. This internal
-- table is not accessible from the outside, but methods use it
-- to translate their self parameters to the real tables where
-- they operate. Implement the Account example using this approach
-- and discuss it's pros and cons.
-- (There is a small problem with this approach. Try to figure
-- it out or see Section 17.3, which also presents a solution)

-- DISCLAIMER: I cheated by reading chapter 17 before writing
-- this solution. If there is something you don't (yet) understand,
-- read chapter 17, which should make one or two things a little
-- clearer ;)

-- To implement a proxy, we need a couple of things. First, we
-- need a way of forwarding the request made to it to the actual
-- objects, for this we can use a table mapping the proxy class
-- to the actual objects. Then, for method calls we need to
-- translate the arguments (which will be proxy classes) to
-- actual objects. Furthermore, I assume that methods will not
-- return objects, since the proxy class has no way of knowing
-- what needs to be proxified and what doesn't.

-- load the account example
dofile("examples/account.lua")

-- start new scope (to hide local variables)
do
    -- associates proxy classes with real objects
    local proxies = {}

    -- make it's keys weak (for garbage collection)
    setmetatable(proxies, {__mode="k"})

    -- the proxy lookup function
    local function lookup(tbl, key)
        -- get the object we want to access
        local obj = proxies[tbl] or error("object not found", 2)

        -- see what is requested (only functions allowed!)
        if type(obj[key]) ~= 'function' then
            error("not allowed to access "..tostring(key).." of object "..tostring(obj))
        end

        return function(...)
            args = {...}

            -- translate all proxy objects to the real thing
            for i = 1, #args do
                args[i] = proxies[args[i]] or args[i]
            end

            return obj[key](table.unpack(args))
        end
    end

    -- the global metatable
    local mt = {__index = lookup,
        __newindex = function(t, k, v)
            error("not allowed to set "..tostring(k).." of object "..tostring(t))
        end
    }

    -- make new proxy
    function proxify(tbl)
        local proxy = {}
        proxies[proxy] = tbl
        return setmetatable(proxy, mt)
    end
end

-- create new account and proxify it
acc = proxify(Account:new{balance=100})

-- proxy can be used just like the real account class
acc:deposit(50)
acc:withdraw(150)
