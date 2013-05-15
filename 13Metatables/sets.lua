-- file: sets.lua
-- Exercise 13.1: Define a metamethod __sub for sets that returns
-- the difference of two sets
-- Exercise 13.2: Define a metamethod __len for sets so that #s
-- returns the number of elements in set s

Set = {}
Set.mt = {}

-- create a new set with the values of a given list
function Set.new(l)
    local set = {}
    setmetatable(set, Set.mt)
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

-- set difference
function Set.difference(a, b)
    local set = Set.new{}
    for k in pairs(a) do
        if not b[k] then set[k] = true end
    end
    return set
end

-- get length
function Set.length(a)
    local len = 0
    for k in pairs(a) do
        len = len + 1
    end
    return len
end

-- print a set
function Set.print(s)
    print(Set.tostring(s))
end

-- set containment
function Set.mt.__le(a, b)
    for k in pairs(a) do
        if not b[k] then return false end
    end
    return true
end

function Set.mt.__lt(a, b)
    return a <= b and not (b <= a)
end

function Set.mt.__eq(a, b)
    return a <= b and b <= a
end

Set.mt.__add = Set.union
Set.mt.__sub = Set.difference
Set.mt.__len = Set.length
Set.mt.__mul = Set.intersection
Set.mt.__tostring = Set.tostring
Set.mt.__metatable = "not your business"

-- examples
print("set a = {1, 2, 3, 4, 5}")
a = Set.new{1, 2, 3, 4, 5}
print("set b = {2, 3, 4}")
b = Set.new{2, 3, 4}
print("set c = {3, 4, 5, 6}")
c = Set.new{3, 4, 5, 6}

io.write("a + c = ")
print(a + c)

io.write("a - b = ")
print(a - b)

io.write("a * c = ")
print(a * c)

io.write("   #a = ")
print(#a)
