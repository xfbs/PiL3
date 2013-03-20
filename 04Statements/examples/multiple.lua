#!/usr/bin/env lua
-- file: multiple.lua
-- some examples of multiple assignment

-- declare two variables
x = 9
y = 4
print('x = ' .. x)
print('y = ' .. y)

-- swap them using multiple assignment
x, y = y, x
print('x, y = x, y')
print('x = ' .. x)
print('y = ' .. y)

-- more values than variables
x, y = 3, 4, 9
print('x, y = 3, 4, 9')
print('x = ' .. x)
print('y = ' .. y)

-- more variables than values
x, y, z = 9, 7
print('x, y, z = 9, 7')
print('x = ' .. x)
print('y = ' .. y)
print('z = ' .. tostring(z)) -- use tostring to convert nil to a string
