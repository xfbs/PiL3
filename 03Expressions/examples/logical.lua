#!/usr/bin/env lua
-- file: logical.lua
-- logical operators examples from the book
function p(a, b)
    print(a .. string.rep(' ', 18-#a) .. tostring(b))
end

p("4 and 5", 5 and 5)
p("nil and 13", nil and 13)
p("false and 13", false and 13)
p("4 or 5", 4 or 5)
p("false or 5", false or 5)

p("true and 1 or 9", true and 1 or 9)
p("false and 1 or 9", false and 1 or 9)

p("not nil", not nil)
p("not false", not false)
p("not 0", not 0)
p("not not 1", not not 1)
p("not not nil", not not nil)
