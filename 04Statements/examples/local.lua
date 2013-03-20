#!/usr/bin/env lua
-- file: local.lua
-- Lua supports local variables with the local operator.
-- This shows some example of local/global variables:

-- global count
count = 1

-- work with a local count
for i = 1, 5 do
    local count = 2 * i
    print('local count = ' .. count)
end

-- work with the global count
for i = 1, 5 do
    count = 2 * count
    print('global count = ' .. count)
end
