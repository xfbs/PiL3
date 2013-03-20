#!/usr/bin/env lua
-- file: multiple_inheritance.lua
-- Multiple inheritance means that a class can have more than
-- one superclass. Therefore, we cannot use a class method to
-- create subclasses. Instead, we will define a specific
-- function for this purpose, createClass, which takes the
-- superclasses as arguments.
-- This code from the text illustrates how a class can be
-- made by subclassing the Named and the Account class:

-- the Named class: can store and access a name
Named = {}

function Named:getname()
    return self.name
end

function Named:setname(n)
    self.name = n
end

-- load the Account class
dofile("account.lua")

-- multiple inheritance function
-- look up for 'k' in list of tables 'plist'
local function search(k, plist)
    for i = 1, #plist do
        -- look in the i-th superclass
        local v = plist[i][k]
        if v then return v end
    end
end

-- this function takes a list of superclasses and returns
-- a class that inherits from all of them
function createClass(...)
    local c = {}
    local parents = {...}

    -- class will search for each method in the list of it's
    -- parents
    setmetatable(c, {__index = function(t, k)
        return search(k, parents)
    end})

    -- prepare 'c' to be the metatable of it's instance
    c.__index = c

    -- define new constructor for this new class
    function c:new(o)
        o = o or {}
        setmetatable(o, c)
        return o
    end

    return c
end

-- create a subclass of Named and Account
NamedAccount = createClass(Account, Named)

-- test the subclass
account = NamedAccount:new{name = "Paul"}
print(account:getname())
