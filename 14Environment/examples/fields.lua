-- file: fields.lua
-- get and set any field of the global environment

-- gets a field from the global environment
-- eg. getfield("table.concat") --> table.concat
function getfield(f)
    local v = _G
    for w in string.gmatch(f, "[%w_]+") do
        v = v[w]
    end

    return v
end

-- sets a field from the global environment
-- eg. --> setfield("person.name", 1) --> person.name = 1
function setfield(f, v)
    local t = _G
    for w, d in string.gmatch(f, "([%w_]+)(%.?)") do
        if d == "." then
            t[w] = t[w] or {}
            t = t[w]
        else
            t = t[w]
        end
    end
end
