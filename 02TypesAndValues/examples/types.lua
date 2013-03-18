#!/usr/bin/env lua
-- file: types.lua
-- shows which variables have which types
-- (determined with the type() function)

-- print the types of those values
print('"Hello world"', '--> '..type("Hello world"), "-- anything enclosed in quotes is a string")
print('10.4*3\t', '--> '..type(10.4*3), "-- ints and floats have the same type in lua")
print('print\t',  '--> '..type(print), "-- functions are also variables with a type")
print('type\t',   '--> '..type(type), "-- type() is a function just like all the others")
print('true\t',   '--> '..type(true))
print('nil\t',    '--> '..type(nil))
print('type(X)\t','--> '..type(type(X)), "-- type() always returns a string")
