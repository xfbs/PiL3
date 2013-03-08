-- file: markov-chain.lua
-- generated pseudo-random text based on what words can follow
-- a sequence of two words

dofile("markov-definitions.lua")

local N = 2
local MAXGEN = 10000
local NOWORD = "\n"

-- build table
local w1, w2 = NOWORD, NOWORD
for w in allwords() do
    insert(prefix(w1, w2), w)
    w1, w2 = w2, w
end
insert(prefix(w1, w2), NOWORD)

-- generate text
w1 = NOWORD
w2 = NOWORD
for i = 1, MAXGEN do
    local list = statetab[prefix(w1, w2)]

    -- choose random item from list
    local r = math.random(#list)
    local nextword = list[r]
    if nextword == NOWORD then return end
    io.write(nextword, " ")
    w1, w2 = w2, nextword
end
