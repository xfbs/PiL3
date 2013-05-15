#!/usr/bin/env lua
-- file: polynomial.lua
-- Exercise 6.2: Exercise 3.3 asked you to write a function that
-- receives a polynomial (represented as a table) and a value
-- for its variable, and returns the polynomial value.
-- Write the curried version of that function. Your functions
-- should receive a polynomial and returns a function that, when
-- called with a value for x, returns the value of the polynomial
-- for that x.

-- a curried polynomial function
function polynomial(coefficients)
    return function(x)
        y = 0
        cur_x = 1
        for i = #coefficients, 1, -1 do
            y = y + cur_x * coefficients[i]
            if i ~= 1 then cur_x = cur_x * x end
        end
        return y
    end
end

f = polynomial{3, 0, 1}
print('f(0)\t--> ' .. f(0))
print('f(5)\t--> ' .. f(5))
print('f(10)\t--> ' .. f(10))
