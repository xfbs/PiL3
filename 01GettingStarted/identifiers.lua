#!/usr/bin/env lua
-- file: identifiers.lua
-- Exercise 1.4: Which of the following  strings are
-- valid identifiers?
-- ___  _end  End  end  until?  nil NULL

-- Identifiers in Lua can be composed of English
-- letters (a-z and A-Z), underscores (_) and
-- digits (0-9), however they may not start with
-- a digit. Also, in order to be valid, they must
-- not be one of the reserved identifiers.

-- which are valid identifiers?
print("until?\t--> nope, question marks are not allowed")
print("end\t--> nope, reserved keyword")
print("nil\t--> nope, reserved type name")
print("___\t--> valid")
print("_end\t--> valid")
print("End\t--> valid")
print("NULL\t--> valid")
