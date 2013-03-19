#!/usr/bin/env lua
-- file: length.lua
-- shows some length operator applications

animals = {"cat", "dog", "mouse", "chicken"}
print('#animals = ' .. #animals)
for i = 1, #animals do
    print('animals[' .. i .. '] = ' .. animals[i])
end
