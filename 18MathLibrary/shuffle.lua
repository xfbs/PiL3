#!/usr/bin/env lua
-- file: shuffle.lua
-- Exercise 18.5: Write a function to shuffle a given list.
-- Make sure that all permutations are equally probable.

-- seed the PRNG
math.randomseed(os.time())

function shuffle(list)
    -- make and fill array of indices
    local indices = {}
    for i = 1, #list do
        indices[#indices+1] = i
    end

    -- create shuffled list
    local shuffled = {}
    for i = 1, #list do
        -- get a random index
        local index = math.random(#indices)

        -- get the value
        local value = list[indices[index]]

        -- remove it from the list so it won't be used again
        table.remove(indices, index)

        -- insert into shuffled array
        shuffled[#shuffled+1] = value
    end

    return shuffled
end

-- test the shuffle function
nums = shuffle{1, 2, 3, 4, 5, 6, 7, 8, 9}

for i, v in ipairs(nums) do
    io.write(v)
    if i ~= #nums then
        io.write(", ")
    else
        io.write("\n")
    end
end

