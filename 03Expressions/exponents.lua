#!/usr/bin/env lua
-- file: exponents.lua
-- Exercise 3.2: What is the result of the expression 2^3^4?
-- What about 2^-3^4?

-- The exponentiation operator (^) is right associative in
-- Lua. This means that 2^3^4 is equivalent to 2^(3^4). This
-- means that the following two equations will have the same
-- result:
print("   2^3^4", 2^3^4)
print(" 2^(3^4)", 2^(3^4))
print()

-- however, this one will not have the same result since the
-- order of execution is not the same as in Lua:
print(" (2^3)^4", (2^3)^4)
print()

-- The same is true for 2^-3^4. This one is a little more
-- tricky since there is a minus sign involved, which could
-- be interpreted to mean that the 3 is negative or that the
-- result of 3^4 should be made negative.
-- Lua, being right-associative first computes 3^4, then
-- turns that into a negative result (thanks to the -) and
-- then takes 2 to the power of that. This means that the
-- following equations are identical:
print("  2^-3^4", 2^-3^4)
print("2^-(3^4)", 2^(-3^4))
print()

-- If, instead, you want the 3 to be negative, you need
-- to put it in parentheses, like so:
print("2^(-3)^4", 2^(-3)^4)
print()

-- This yields something entirely different, since it forces
-- Lua to work left-associative by enclosing 2^-3 in brackets.
print("(2^-3)^4", (2^-3)^4)
