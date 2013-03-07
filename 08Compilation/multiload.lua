-- file: multiload.lua
-- defines a function, multiload, which accepts a variable
-- amount of either strings or reader functions and runs 
-- load on them

function multiload(...)
    local args = {...}

    -- reader function factory
    local function reader_factory(str)
        local has_read = false

        return function()
            if not has_read then
                has_read = true
                return str
            else
                return nil
            end
        end
    end

    -- turn all string arguments into reader functions
    for i = 1, #args do
        if type(args[i]) ~= 'function' then
            factory = reader_factory(args[i])
            args[i] = factory
        end
    end

    -- custom reader function
    local index = 1
    local function reader()
        while args[index] ~= nil do
            val = args[index]()

            if val ~= nil then
                return val
            else
                index = index + 1
            end
        end
    end

    -- call load
    return load(reader, "multiload", 't')
end

-- define a sample reader function factory
function reader(ary)
    local i = 0
    return function()
        i = i + 1
        return ary[i]
    end
end

f = multiload(reader{'print', ' ', '"should be 45: "'}, 'return ', "10^2", '-5^2', '-5*4', -10)
print(f())
