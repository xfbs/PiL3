#!/usr/bin/env lua
-- file: factorial.lua
-- Exercise 1.1: Run the factorial example. What happens
-- to your program if you enter a negative number? Modify
-- the example to avoid this problem.

-- when entering a negative number in the factorial example,
-- it keeps going until it stops due to a stack overflow.
-- The remedy is to check for negative numbers in the 
-- function.

-- defines a factorial function
-- returns nil on error, the factorial otherwise
function fact (n)
    if n < 0 then   -- check for negative number
        return nil
    elseif n == 0 then
        return 1
    else
        return n * fact(n-1)
    end
end

-- get number from user
print("enter a number:")
a = io.read("*n")
f = fact(a)

-- check for error
if f == nil then
    print("bad number entered (maybe negative?)")
else
    print(f)
end
