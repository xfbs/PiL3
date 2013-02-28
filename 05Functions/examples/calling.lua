-- file: calling.lua
-- some examples of function calling in lua

-- returns the sum of two numbers
function add(a, b)
    return a+b
end

-- extra arguments to a function are ignored
x = add(5, 6)
y = add(9, 1, 6)
print('add(5, 6) = ' .. x)
print('add(9, 1, 5) = ' .. y)

-- functions can be used like variables
a = add
x = a(5, 6)
print('a(5, 6) = ' .. x)


-- returns the decimal and the fractional part of a number
function split(num)
    frac = num % 1
    dec = num - frac
    return dec, frac
end

-- functions can return multiple values
x, y = split(45.96)
print('split(45.96) = ' .. x .. ', ' .. y)


-- greets a person
function greet(person)
    print('Hello, ' .. person.firstname .. ' ' .. person.lastname)
end

-- in some cases, the parentheses of a 
-- function call can be omitted
greet{firstname="John", lastname="Doe"}
