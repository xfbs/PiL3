#!/usr/bin/env lua
-- file: boolean.lua
-- Exercise 3.5: How can you check whether a value is boolean
-- without using the type function?

-- check if a variable is a boolean
function is_boolean(v)
    -- comparisons are false if the types are different
    if v == true then
        -- v is true and thus it's boolean
        return true
    elseif v == false then
        -- v is false and thus it's boolean
        return true
    else
        -- if it's neither true not false
        -- it can't be boolean (or we have 
        -- alpha particles affecting the
        -- hardware)
        return false
    end
end

-- test the function with some examples
num = 123
str = "str"
bool = true

print("is_boolean(123)   --> " .. (is_boolean(num) and "true" or "false"))
print("is_boolean('str') --> " .. (is_boolean(str) and "true" or "false"))
print("is_boolean(true)  --> " .. (is_boolean(bool) and "true" or "false"))
