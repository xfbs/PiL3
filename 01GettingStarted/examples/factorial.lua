#!/usr/bin/env lua
-- file: factorial.lua
-- an factorial function taken from the book

-- defines a factorial function
function fact(n)
    if n == 0 then
        return 1
    else
        return n * fact(n-1)
    end
end

print("enter a number:")
a = io.read("*n")
print(fact(a))
