-- file: values.lua
-- simple array iterator like ipairs

-- factory function
function values(t)
    -- nonlocal index variable for
    -- the iterator
    local i = 0
    
    -- the iterator itself
    return function()
        i = i + 1
        return t[i]
    end
end

-- some random examples
t = {'a', 'b', 'c', 'd', 'e', 'f'}

-- use the iterator
for elem in values(t) do
    print(elem)
end
