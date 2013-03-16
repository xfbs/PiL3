-- file: readonly.lua
-- implements a read-only table in Lua

function readOnly(t)
    local proxy = {}
    local mt = {
        __index = t,
        __newindex = function(t, k, v)
            error("attempt to update a read-only table", 2)
        end
    }
    setmetatable(proxy, mt)
    return proxy
end

print("Reading works: ")
days = readOnly{"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"}
print(days[2])

print("Writing raises an error: ")
days[2] = "Noday"
