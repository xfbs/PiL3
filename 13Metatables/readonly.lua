-- file: readonly.lua
-- implementation of a read-only table in lua

-- private index
local index = {}

local mt = {
    __index = function(t, k)
        return t[index][k]
    end,

    __newindex = function(t, k, v)
        error("trying to modify a read-only table", 2)
    end
}

-- create a read-only table
function readOnly(t)
    local proxy = {}
    proxy[index] = t
    setmetatable(proxy, mt)
    return proxy
end

-- make read-only table
days = readOnly{"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"}

print("Reading works: ")
print(days[2])

print("Writing raises an error: ")
days[2] = "Noday"
