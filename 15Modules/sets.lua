-- file: sets.lua
-- implementation of sets using lua tables

Set = {}
local mt = {}

-- create a new set with the values of a given list
function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do set[v] = true end
    return set
end

function Set.union(a, b)
    local res = Set.new{}
    for k in pairs(a) do res[k] = true end
    for k in pairs(b) do res[k] = true end
    return res
end

function Set.intersection(a, b)
    local ret = Set.new{}
    for k in pairs(a) do
        ret[k] = b[k]
    end
    return ret
end

-- presents a set as a string
function Set.tostring(set)
    local l = {}
    for e in pairs(set) do
        l[#l+1] = e
    end
    return "{" .. table.concat(l, ", ") .. "}"
end

-- print a set
function Set.print(s)
    print(Set.tostring(s))
end

-- set containment
function mt.__le(a, b)
    for k in pairs(a) do
        if not b[k] then return false end
    end
    return true
end

function mt.__lt(a, b)
    return a <= b and not (b <= a)
end

function mt.__eq(a, b)
    return a <= b and b <= a
end

mt.__add = Set.union
mt.__mul = Set.intersection
mt.__tostring = Set.tostring
mt.__metatable = "not your business"

return Set
