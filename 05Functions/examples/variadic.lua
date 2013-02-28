-- file: variadic.lua
-- illustrates variadic functions

-- the three dots mean that any number of
-- arguments will be accepted
function add(...)
    -- this causes the numbers array to fill
    -- with the arguments passed
    local numbers = {...}
    local sum = 0
    for i, number in ipairs(numbers) do
        sum = sum + number
    end
    return sum
end

x = add(4, 5, 9)
print('add(4, 5, 9) = ' .. x)

y = add(1, 3, 5, 6, 7)
print('add(1, 3, 5, 6, 7) = ' .. y)

z = add()
print('add() = ' .. z)
