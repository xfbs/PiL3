-- file: permutations.lua
-- coroutine-based iterator to generate all permutations
-- of all elements of a

function permgen(a, n)
    n = n or #a
    if n <= 1 then
        coroutine.yield(a)
    else
        for i = 1, n do
            -- put i-th element as the last one
            a[n], a[i] = a[i], a[n]
            -- generate all permutations of the other elements
            permgen(a, n - 1)
            -- restore i-th element
            a[n], a[i] = a[i], a[n]
        end
    end
end

function permutations(a)
    -- this is how one would do it using the
    -- coroutine.create() function
    --[[
    local co = coroutine.create(function() permgen(a) end)
    return function()   -- iterator
        local code, res = coroutine.resume(co)
        return res
    end
    --]]

    -- using coroutine.wrap() is simpler
    return coroutine.wrap(function() permgen(a) end)
end

for p in permutations{"a", "b", "c"} do
    print(p[1], p[2])
end
