-- file: sets.lua
-- an example of how to implement sets
-- in lua

-- set of reserved words
reserved = {
    ["while"] = true,
    ["end"] = true,
    ["function"] = true,
    ["local"] = true
}

-- check if the given word is reserved
io.write("please enter a word: ")
word = io.read()
if reserved[word] then
    print('"' .. word .. '" is a reserved word')
else
    print('"' .. word .. '" is not a reserved word')
end
