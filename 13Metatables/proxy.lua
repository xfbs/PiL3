-- file: proxy.lua
-- Exercise 13.3: Complete the implementation of proxies in
-- Section 13.4 with an __ipairs metamethod.

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
    end,

    -- is called when iterating with ipairs()
    __ipairs = function(t)
        -- stateless iterator
        local function iter(array, index)
            index = index + 1
            local value = array[index]
            if value then
                return index, value
            end
        end

        return iter, t[index], 0
    end
}

function track(t)
    local proxy = {}
    proxy[index] = t
    setmetatable(proxy, mt)
    return proxy
end

t = track{"a", "b", "c"}

for i, v in ipairs(t) do
    print(i .. " --> " .. v)
end
