#!/usr/bin/env lua
-- file: colors.lua
-- A common use of weak tables is to use them to cache
-- function return values, this is called memoizing.
-- Since the cache should not prevent the returned 
-- values from being collected, it is usually a weak
-- table (with weak values). There is another advantage
-- to using weak tables like this: a kind of uniqueness
-- is now guaranteed, so we can compare the returned
-- objects with the primitive equality operator.
-- The following is an example shows how this can be
-- used to cache colors

-- the results table with weak values
local results = {}
setmetatable(results, {__mode = "v"})

function createRGB(r, g, b)
    -- I use different keys than in the book: colors
    -- go from 0 to 255, so why not use a number as
    -- key? number comparisons are probably faster,
    -- too.
    local key = r*256*256 + g*256 + b

    -- lookup from cache
    local color = results[key]

    -- construct color if not cached
    if color == nil then
        color = {red=r, green=g, blue=b}
        results[key] = color
    end

    return color
end

-- some tests (note that the direct comparison
-- only works because we cache the results)
assert(createRGB(2, 4, 5) == createRGB(2, 4, 5))
assert(createRGB(2, 4, 5) ~= createRGB(2, 4, 6))
