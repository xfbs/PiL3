#!/usr/bin/env lua
-- file: inheritance.lua
-- Because classes are objects, they can get methods from other
-- classes, too. This behavior makes inheritance (in the usual
-- object-oriented meaning) quite easy to implement in Lua.
-- This is an example from the book that illustrates how the
-- Account class can be subclassed:

-- load the Account class
dofile("account.lua")

-- create a subclass of the Account class with a new class
-- variable, limit, which defaults to zero
SpecialAccount = Account:new{limit=0}

-- override methods from the Account class
function SpecialAccount:withdraw(v)
    if v - self.balance >= self:getLimit() then
        error("insufficient funds", 2)
    end
    self.balance = self.balance - v
end

-- define new methods that are only visible in the
-- SpecialAccount class
function SpecialAccount:getLimit()
    return self.limit or 0
end
