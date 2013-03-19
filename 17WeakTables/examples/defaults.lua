#!/usr/bin/env lua
-- file: defaults.lua
-- There are multiple ways of how to change the default
-- values for empty tables in Lua. This is an example
-- taken from the book showing one way of achieving this
-- by using weak tables.

-- this keeps track of the metatables, there is one
-- metatable per default value, these are shared between
-- tables that need the same default value
local metas = {}

-- changes the metatables table to have weak keys. we
-- only need to cache the metatables actually in use
setmetatable(metas, {__mode="v"})

-- function to set the default value
function setDefault(table, default)
    -- look up metatable from the list of cached
    -- metatables
    local mt = metas[default]

    -- if it's not currently cached, we need to create
    -- it
    if mt == nil then
        mt = {__index = function() return default end}
        metas[d] = mt
    end

    -- change the table's metatable to out custom one
    setmetatable(table, mt)
end
