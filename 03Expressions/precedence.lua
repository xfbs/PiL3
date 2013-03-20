#!/usr/bin/env lua
-- file: precedence.lua
-- Exercise 3.6: Consider the following expression:
--     (x and y and (not z)) or ((not y) and x)
-- Are the parentheses necessary? Would you recommend
-- their use in that expression?

-- operator precedence: not > and > or
-- thus, the parentheses in the following statement
-- are not really necessary:
-- (x and y and (not z)) or ((not y) and x)
-- however, they should probably be kept because
-- they show what is evaluated first (since most
-- people don't know the operator precedence by
-- hard)

-- proof
print("not true and 'false' or 'true'  --> " .. (not true and 'false' or 'true'))
print("not false and 'false' or 'true' --> " .. (not false and 'false' or 'true'))

-- first the not is evaluated (highest precedence),
-- then the and part is evaluated (below not but higher than or),
-- finally the or part is evaluated (lowest precedence)

-- not true and 'false' or 'true' becomes
-- false and 'false' or 'true' becomes
-- false or 'true' becomes
-- 'true'
