-- file: uniquewords.lua
-- an iterator example that iterates over 
-- unique words in a file

-- factory function for the iterator
function uniquewords()
    -- the state: current line, position in it
    -- and which words were already read
    local line = io.read()
    local pos = 1
    local words = {}

    -- the iterator. finds all words in the line
    -- and when there are no more, read the next
    -- line
    return function()
        -- when line == nil then there is nothing
        -- more to read (the user pressed Ctrl-D)
        while line do
            -- try to find the next word
            local s, e = string.find(line, "%w+", pos)
            -- if we found a word
            if s then
                -- increase the position to beyond
                -- it (so we don't find it again)
                pos = e + 1
                local word = string.sub(line, s, e)

                -- check if we've read this word before
                if not words[word] then
                    words[word] = true
                    return word
                end
            else
                line = io.read()
                pos = 1
            end
        end

        return nil
    end
end

for word in uniquewords() do
    print("word: " .. word)
end
