-- file: returning.lua

-- returns all arguments except the first
function do_nothing(first, ...)
    return ...
end

x, y = do_nothing(1, 2, 3)
print('do_nothing(1, 2, 3) = ' .. x .. ', ' .. y)
