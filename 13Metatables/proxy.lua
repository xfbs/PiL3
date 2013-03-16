-- file: proxy.lua
-- a proxy for a table to track access

t = {"a", "b", "c"}  -- original table

-- keep a private access to the original table
local _t = t

-- create proxy
t = {}

-- create metatable
local mt = {
    __index = function(t, k)
        print("*access to element " .. tostring(k))
        return _t[k]    -- access to the original table
    end,

    __newindex = function(t, k, v)
        print("*update of element " .. tostring(k) ..
            " to " .. tostring(v))
        _t[k] = v   -- update original table
    end,

    -- is called when iterating with pairs()
    __pairs = function()
        return function(_, k)
            return next(_t, k)
        end
    end,

    -- is called when iterating with ipairs()
    __ipairs = function()
        -- stateless iterator
        local function iter(array, index)
            index = index + 1
            local value = array[index]
            if value then
                return index, value
            end
        end

        return iter, _t, 0
    end
}

setmetatable(t, mt)

for k, v in ipairs(t) do
    print(k .." --> " .. v)
end
