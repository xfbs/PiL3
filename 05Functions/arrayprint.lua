-- file: arrayprint.lua

-- prints all the items in an array
function arrayprint(ary)
    for key, value in pairs(ary) do
        print(key .. ' --> ' .. tostring(value))
    end
end

-- print an array from a variable
a = {firstname="John", lastname="Doe", age=25, interests={"Lua"}}
arrayprint(a)

-- use the short syntax for passing an array
-- "nothing" will not be printed, since any member
-- that is nil is effectively nonexistant
arrayprint{boolean=true, nothing=nil, number=3.14}
