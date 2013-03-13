-- file: substrings.lua
-- defines an iterator that returns ALL
-- non-empty substrings of a given string

-- the iterator
function substrings(str)
    -- nonlocal variables used by the
    -- iterator function
    local from = 1
    local to = 0
    local length = #str

    -- the iterator function
    local function iter()
        -- next substrings is one longer
        -- than previous one
        to = to + 1
        if to > length then
            -- 'wrap around' when we are at the 
            -- end of the string
            from = from + 1
            to = from
        end
        
        -- generate substring
        local substring = string.sub(str, from, to)

        -- return substring (if not empty, which
        -- means we've hit the end)
        if #substring ~= 0 then
            return substring
        else
            return nil
        end
    end

    return iter
end

-- test the iterator
for str in substrings("abcdefg") do
    print(str)
end
