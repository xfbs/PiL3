#!/usr/bin/env lua
-- file: finalization.lua
-- Exercise 17.2: Consider the first example of Section 17.6,
-- which creates a table with a finalizer that only prints a
-- message when activated. What happens if the program ends
-- without a collection cycle? What happens if the program
-- calls `os.exit()`? What happens if the program ends with
-- some error?

-- My initial hypothesis was that the object would be
-- collected if the program was allowed to gracefully end,
-- meaning that `os.exit()` and `error()` would prevent
-- garbage collection. However, as it seems only `os.exit()`
-- avoids the garbage collector. 

-- example from section 17.6 (a little changed but still does
-- what it's supposed to)
obj = {txt = "the object has been collected"}
local mt = {__gc = function(obj) print(obj.txt) end}
setmetatable(obj, mt)
obj = nil

-- ask the user what to do
io.write([[
what should I do?
 a. collect garbage and end gracefully
 b. end gracefully
 c. call `os.exit()`
 d. throw an error
? ]])

-- read user input
action = io.read()

-- respond to user input
if action == 'b' then
    collectgarbage()
elseif action == 'c' then
    os.exit()
elseif action == 'd' then
    error("some kind of error")
else
    if action ~= 'a' then print("unrecognized command!") end
end
