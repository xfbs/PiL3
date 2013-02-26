-- file: precedence.lua

-- operator precedence: not > and > or
-- thus, the parentheses in the following statement
-- are not really necessary:
-- (x and y and (not z)) or ((not y) and x)

-- proof
print("not true and 'false' or 'true'  --> " .. (not true and 'false' or 'true'))
print("not false and 'false' or 'true' --> " .. (not false and 'false' or 'true'))

-- first the not is evaluated (highes precedence),
-- then the and part is evaluated (below not but higher than or),
-- finally the or part is evaluated (lowest precedence)

-- not true and 'false' or 'true' becomes
-- false and 'false' or 'true' becomes
-- false or 'true' becomes
-- 'true'
