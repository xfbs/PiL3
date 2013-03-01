-- file: nonlocal.lua
-- shows how variables can escape their
-- scope (become nonlocal)

-- generator function for a closure
function newCounter()
    local i = 0
    return function()
        i = i + 1
        return i
    end
end

-- create first counter
c1 = newCounter()
print('c1() --> ' .. c1()) -- works as expected
print('c1() --> ' .. c1())

-- generate second counter. even though both are
-- functions that work by increasing `i`, they do
-- not conflic with each other because they both
-- have their independent `i` variable
c2 = newCounter()
print('c2() --> ' .. c2())
print('c1() --> ' .. c1())
print('c2() --> ' .. c2())
