#!/usr/bin/env lua
-- file: strings.lua
-- some examples of string operations

-- string.gsub() replaces a given substring of
-- a string with another one
a = "Some random string"
b = string.gsub(a, "random", "deterministic")

print('a = "' .. a .. '"')
print('b = "' .. b .. '"')

-- the length operator (#) returns the length
-- of the string
print('#a = ' .. #a)
print('#b = ' .. #b)
