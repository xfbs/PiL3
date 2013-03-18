#!/usr/bin/env lua
-- file: expression.lua
-- Exercise 2.1: What is the value of the expression
-- type(nil)==nil? (You can use Lua to check your
-- answer.) Can you explain this result?

-- The type() function in Lua can be used to determine
-- which type a given variable has. To do this, it
-- returns a string describing the type of the variable.
-- type(nil) is not an exception, in this case type()
-- will probably return the string "nil":
print("type(nil)\t\t--> " .. '"' .. type(nil) .. '"')

-- Now we know what type(nil) returns, so we can reduce
-- the expression to the folliwing one: "nil"==nil.
-- This looks as if it could be true, but it's not. We
-- are comparing the string "nil" to nil. nil is neither
-- a string, nor a number, it is it's own type. And
-- in Lua, when we compare two values that have different
-- types, the result is always false, no matter what
-- the values are.
print('"nil"==nil\t\t--> ' .. tostring("nil"==nil))
print('5 == "s"\t\t--> ' .. tostring(5=="s"))
print('type(nil)=="nil"\t--> ' .. tostring(type(nil) == nil))
