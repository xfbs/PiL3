-- file: stringrep.lua
-- functions to repeat a string a given amount of times

-- this is the stringrep function presented in the book (Listing 8.2)
function stringrep(s, n)
    local r = ""
    if n > 0 then
        while n > 1 do
            if n % 2 ~= 0 then
                r = r .. s
            end
            s = s .. s
            n = math.floor(n / 2)
        end
        r = r .. s
    end
    return r
end

-- this is the custom specialization which uses load to create
-- specialized functions
function stringrep_specialization(n)
    -- yeah, this code is pretty much ripped from
    -- the stringrep function, but it only stores
    -- what stringrep would do as a string (doesn't
    -- execute it)
    local code = {
        "args = {...};",
        "local s = args[1];",
        "local r = '';",
    }
    if n > 0 then
        while n > 1 do
            if n % 2 ~= 0 then
                code[#code+1] = "r=r..s;"
            end
            code[#code+1] = "s=s..s;"
            n = math.floor(n / 2)
        end
    end
    code[#code+1] = "r=r..s;"
    code[#code+1] = "return r;"

    -- now that we have code as an array of parts of the function,
    -- we gotta compile it, so we need a reader function
    local index = 0
    local function reader()
        index = index + 1
        return code[index]
    end

    -- compile the code and return function
    return assert(load(reader, "stringrep_"..n, 't'))
end

-- tiny testing function
function test(name, amount, func, args)
    print("running "..amount.." tests on "..name.." (might take a while)")
    local pre = os.time()
    for i = 1, amount do
        local r = func(table.unpack(args))
    end
    local post = os.time()
    local time = post-pre
    print(name.." took "..time.." seconds to execute.")
end

-- run tests on stringrep
test("stringrep", 10000, stringrep, {stringrep('asdf', 100), 500})

-- run tests on stringrep_specialization
test("stringrep_specialization", 10000, stringrep_specialization(500), {stringrep('asdf', 100)})
