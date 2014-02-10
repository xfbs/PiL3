#!/usr/bin/env lua
-- file: recursive.lua
-- Exercise 2.6: Assume the following code:
--     a = {};  a.a = a
-- What would be the value of a.a.a.a? Is any
-- a in that sequence somehow different from
-- the others?
-- Now, add the next line to the previous line:
--     a.a.a.a = 3
-- What would be the value of a.a.a.a now?

-- set everything up
print("a = {}; a.a = a")
a = {}
a.a = a

-- we now have a recursive table. this means
-- that since a.a refers to a, a.a.a would
-- be (a.a).a, which would then be reduced
-- to a.a which is still a
-- thus, any amount of as will be equal to
-- a, and there is no difference between them
print("a", a)
print("a.a", a.a)
print("a.a.a", a.a.a)
print("a.a.a.a", a.a.a.a)

-- now, we set a.a.a.a to 3. what does this
-- actually do? well, (a.a).a.a gets reduced
-- to a.a.a, and (a.a).a to a.a. so what we
-- are really doing is this:
--     a.a = 3
-- thus, we are breaking the recursion. a.a
-- no longer refers to a, it's now 3!
print("a.a = 3")
a.a = 3
print("a", a)
print("a.a", a.a)

-- what is a.a.a.a now? we can't get
-- a value for it. now, a.a is 3, so a.a.a.a,
-- interpreted as (a.a).a.a is equivalent to
-- 3.a.a, and 3.a is not a valid operation,
-- since number 3 is not a table, and you cannot
-- lookup its key.
-- You can test it on `lua -i`:
-- [[
; lua
> a = {}; a.a =a
> a.a.a.a = 3
> = a.a.a.a
stdin:1: attempt to index field 'a' (a number value)
stack traceback:
        stdin:1: in main chunk
        [C]: in ?
-- ]]
