-- file: combinations.lua
-- Exercise 9.1: Use coroutines to transform the function in
-- Exercise 5.4 into a generator for combinations.

function generator(ary)
    -- local combinations function (ripped from Exercise 5.4)
    local combinations
    combinations = function(first, ...)
        -- turn the rest of the items into an array
        local rest = {...}

        -- if there are not at least 2 values, there
        -- is nothing to do
        if not first and not rest[1] then
            return
        end

        -- yield the combinations
        for i, v in ipairs(rest) do
            -- yield the coroutine, returning the combination
            -- we have right now.
            coroutine.yield(first, v)
        end

        -- yield the combinations of the other values
        return combinations(...)
    end

    -- the factory function for the generator. first,
    -- make a coroutine out of combinations
    local c = coroutine.create(combinations)
    return function()
        -- continually resume coroutine and return
        -- useful output (else, implicitly return
        -- nil, ending the loop)
        status, a, b = coroutine.resume(c, table.unpack(ary))
        if status then
            return a, b
        end
    end
end

-- test the generator
for a, b in generator{'a', 'b', 'c', 'd'} do
    print(a..b)
end
