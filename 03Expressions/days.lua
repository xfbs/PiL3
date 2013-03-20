#!/usr/bin/env lua
-- file: days.lua
-- Exercise 3.7: What will the following print?
--     sunday = "monday"; monday = "sunday"
--     t = {sunday = "monday", [sunday] = monday}
--     print(t.sunday, t[sunday], t[t.sunday])

-- Answer: it should print "monday sunday sunday"
-- It is probably better understood if we show what
-- the constructor is really doing:
--     t = {sunday = "monday", monday = "sunday"}

-- By this logic, the print statement should be more clear:
--     print(t.sunday, t.monday, t.monday)

-- Here is the actual output:
sunday = "monday"
monday = "sunday"
t = {sunday = "monday", [sunday] = monday}
print(t.sunday, t[sunday], t[t.sunday])
