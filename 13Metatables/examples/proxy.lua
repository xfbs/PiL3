-- file: proxy.lua
-- a proxy for a table to track access

-- create private index
local index = {}

-- create metatable
local mt = {
    __index = function(t, k)
        print("*access to element " .. tostring(k))
        return t[index][k]    -- access to the original table
    end,

    __newindex = function(t, k, v)
        print("*update of element " .. tostring(k) ..
            " to " .. tostring(v))
        t[index][k] = v   -- update original table
    end,

    -- is called when using pairs() with the proxy
    __pairs = function(t)
        return function(t, k)
            return next(t[index], k)
        end, t
    end
}

function track(t)
    local proxy = {}
    proxy[index] = t
    setmetatable(proxy, mt)
    return proxy
end

t = track{"a", "b", "c"}

for k, v in pairs(t) do
    print(tostring(k) .. " --> " .. tostring(v))
end
