#!/usr/bin/env lua
-- file: rconcat.lua
-- An interesting generalization of table.concat.
-- It accepts nested lists of strings:

function rconcat(l)
    if type(l) ~= 'table' then return l end
    local res = {}
    for i = 1, #l do
        res[i] = rconcat(l[i])
    end
    return table.concat(res)
end
