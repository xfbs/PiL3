-- file: loadwithprefix.lua
-- defines a function loadwithprefix() that has essentially
-- the same semantics as load() but allows us to add an optional
-- prefix to the code.

function loadwithprefix(prefix, code)
    -- make sure that code_func is a reader function that will
    -- read in the code
    local code_func
    if type(code) ~= 'function' then
        -- if code is not a function, we have to make the reader
        -- function ourselves

        -- remembers if we have read the code yet
        local read_code = false

        -- on the first call this reads the code, on any subsequent
        -- calls it returns nil to indicate end of code
        code_func = function()
            if not read_code then
                read_code = true
                return code
            else
                return nil
            end
        end
    else
        -- code is already a function, nothing to do
        code_func = code
    end 

    -- define a reader function that will read the prefix first
    -- and then read in the code
    local read_prefix = false
    local function reader()
        if read_prefix then
            return code_func()
        else
            read_prefix = true
            return prefix
        end
    end

    -- load the code with the prefix using the 
    -- custom reading function and make sure to
    -- only accept textual code
    return load(reader, "prefixed", 't')
end

-- define a sample reader function factory
function reader(ary)
    local i = 0
    return function()
        i = i + 1
        return ary[i]
    end
end

-- test our loadwithprefix code
f = loadwithprefix("return ", "8 + 2 - 13 + 5^2")
print("Should be 22: " .. f())

f = loadwithprefix("return ", reader{'5', '-7', '+3', '+2*4'})
print("Should be 9: " .. f())
