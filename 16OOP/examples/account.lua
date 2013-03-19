#!/usr/bin/lua
-- file: account.lua
-- Classes (and objects) can be represented by tables in Lua.
-- Every class is a table with the methods and functions that
-- the instances of that class need to be able to access, along
-- with any default values and a new method. Instances are then
-- created as a new table with a metatable that looks into the
-- class table for any methods not implemented in the instance.
-- This can be done with a metafield __index, which points to
-- the class table. This is done automatically in the new()
-- method.
-- The following example demonstrates such a class in Lua

-- class table (balance is zero by default)
Account = {balance = 0}

-- the new() method. this creates new instances of the class,
-- and it takes one parameter, which can contain default
-- values for that object
function Account:new(o)
    -- either use the provided table or make a new one
    o = o or {}

    -- set the metatable to the class table (like this we
    -- don't need an extra metatable but can use the class
    -- table)
    setmetatable(o, self)

    -- set the __index field to self (this only matters
    -- when creating subclasses)
    self.__index = self

    return o
end

-- an example method: deposits money on the account. uses
-- the colon operator (:) to be provided with an explicit
-- reference to the object this is called on, and the values
-- of that object are manipulated
function Account:deposit(v)
    self.balance = self.balance + v
end

-- same as Account:deposit(), but takes money from the
-- account unless there is not enough
function Account:withdraw(v)
    if v > self.balance then error("insufficient funds", 2) end
    self.balance = self.balance - v
end
