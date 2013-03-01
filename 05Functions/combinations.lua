-- file: combinations.lua
-- prints all possible combination of
-- elements in an array

print("enter array items, when done enter 'end'")
array = {}
repeat
    array[#array+1] = item or nil
    item = io.read()
until item == "end"

function print_combinations(first, ...)
    -- turn the rest of the items into an array
    local rest = {...}

    -- if there are not at least 2 values, there
    -- is nothing to do
    if not first and not rest[1] then
        return
    end

    -- print the combinations
    for i, v in ipairs(rest) do
        print(first .. ' and ' .. v)
    end

    -- print the combinations of the other values
    return print_combinations(...)
end

print_combinations(table.unpack(array))
