-- file: for.lua
-- some example for loops

-- simple numeric loop
for i = 1, 3 do
    print('i = ' .. i)
end

-- table loop
t = {name="John Doe", age=25, rank="noob"}
for key, value in pairs(t) do
    print(key .. ' --> ' .. value)
end

-- (fibonacci) sequence loop
s = {1, 1, 2, 3, 5, 8}
for index, value in ipairs(s) do
    print('fibonacci number: ' .. value)
end
