-- file: readonly.lua
-- Exercise 13.4: An alternative way to implement read-only tables
-- might use a function as the __index metamethod. This alternative
-- makes accesses more expensive, but the creation of read-only tables
-- is cheaper, as all read-only tables can share a single metatable.
-- Rewrite function readOnly using this approach.

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
