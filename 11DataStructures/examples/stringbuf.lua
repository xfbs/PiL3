-- file: stringbuf.lua
-- shows how string buffers can be
-- constructed in Lua

-- read this script
filename = arg[0]

-- open file
file = io.open(filename)

-- read lines into string buffer
buffer = {}
for line in file:lines() do
    buffer[#buffer+1] = line
end

-- close file
file:close()

-- put lines from buffer together
file = table.concat(buffer, "\n")

-- print file
print(file)
