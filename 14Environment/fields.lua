-- file: fields.lua
-- get and set any field of the global environment

-- gets a field from the global environment
-- eg. getfield("table.concat") --> table.concat
function getfield(f)
    -- parse the field name
    local fields = {}

    -- get the names of all the tables
    for w in string.gmatch(f, "([%a_][%a%d_]*)%.") do
        fields[#fields+1] = w
    end

    -- get the name of the element requested from the last table
    fields[#fields+1] = string.match(f, "%.?([%a_][%a%d_]*)$")

    -- check if the field name is correct
    assert(table.concat(fields, ".") == f)

    local field = _G
    for i, f in ipairs(fields) do
        if type(field) ~= "table" then
            error("attempt to access a nonexistant field", 2)
        end
        field = field[f]
    end

    return field
end

-- sets a field from the global environment
-- eg. --> setfield("person.name", 1) --> person.name = 1
function setfield(f, v)
    -- parse the field name
    local fields = {}

    -- get the names of all the tables
    for w in string.gmatch(f, "([%a_][%a%d_]*)%.") do
        fields[#fields+1] = w
    end

    -- get the name of the element requested from the last table
    fields[#fields+1] = string.match(f, "%.?([%a_][%a%d_]*)$")

    -- check if the field name is correct
    assert(table.concat(fields, ".") == f)

    -- seperate the last field item from the rest
    local last = fields[#fields]
    fields[#fields] = nil

    -- go to the required table
    local field = _G
    for i, f in ipairs(fields) do
        if type(field) ~= "table" then
            error("attempt to access a nonexistant field", 2)
        end
        field = field[f]
    end

    -- make sure the field we are at is actually a table
    if type(field) ~= "table" then
        error("attempt to access a nonexistant field", 2)
    end

    -- set the field to the required value
    field[last] = v
end
