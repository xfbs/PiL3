-- file: strings.lua
-- some string examples

a = "Some random string"
b = string.gsub(a, "random", "deterministic")

print('a = "' .. a .. '"')
print('b = "' .. b .. '"')
print('#a = ' .. #a)
print('#b = ' .. #b)
