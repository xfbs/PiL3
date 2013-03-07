-- file: allwords.lua
-- word iterator example

-- factory function for the iterator
function allwords()
    -- the state: current line and
    -- position in it
    local line = io.read()
    local pos = 1

    -- the iterator. finds all words in the line
    -- and when there are no more, read the next
    -- line
    return function()
        while line do
            local s, e = string.find(line, "%w+", pos)
            if s then
                pos = e + 1
                return string.sub(line, s, e)
            else
                line = io.read()
                pos = 1
            end
        end

        return nil
    end
end

for word in allwords() do
    print("word: " .. word)
end
