-- file: local.lua
-- some examples for local variables

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
