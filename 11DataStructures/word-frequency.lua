-- file: word-frequency.lua
-- a simple program that reads a text and prints the most 
-- frequent words in that text

local function allwords()
    local ignored = {
        ["and"] = true,
        ["the"] = true,
        ["an"] = true,
        ["as"] = true,
        ["a"] = true
    }

    local auxwords = function()
        for line in io.lines() do
            for word in string.gmatch(line, "%w+") do
                if not ignored[word] then
                    coroutine.yield(word)
                end
            end
        end
    end

    return coroutine.wrap(auxwords)
end

local counter = {}
for w in allwords() do
    counter[w] = (counter[w] or 0) + 1
end

local words = {}
for w in pairs(counter) do
    words[#words+1] = w
end

table.sort(words, function(w1, w2)
    return counter[w1] > counter[w2] or
        counter[w1] == counter[w2] and w1 < w2
end)

for i = 1, (tonumber(arg[1]) or 10) do
    print(words[i], counter[words[i]])
end
