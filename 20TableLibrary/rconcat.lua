#!/usr/bin/env lua
-- file: rconcat.lua
-- Exercise 20.1: Rewrite the function rconcat so that it 
-- can get a seperator, just like table.concat does:
--     print(rconcat({{{"a", "b"}, {"c"}}, "d", {}, {"e"}}, ";"))
--       --> a;b;c;d;e

function rconcat(l, sep)
    if type(l) ~= 'table' then return l end
    local res = {}
    for i = 1, #l do
        -- ignore empty tables
        if type(l[i]) ~= 'table' or #l[i] > 0 then
            -- pass the seperator on to rconcat
            res[#res+1] = rconcat(l[i], sep)
        end
    end
    for i, v in ipairs(res) do
    end

    -- pass the seperator to tabl.concat
    return table.concat(res, sep)
end

-- test it
assert(rconcat({{{"a", "b"}, {"c"}}, "d", {}, {"e"}}, ";") == "a;b;c;d;e")
