-- file: serialize.lus
-- serialize tables without cycles

function serialize(o, args)
    -- table of default values
    local defaults = {indent=0, inline=false, newline=true, hexnum=false}

    -- set defaults
    args = args or {}
    for k, v in pairs(defaults) do
        if args[k] == nil then
            args[k] = v
        end
    end

    -- indent if needed
    if not args.inline then
        io.write(string.rep("  ", args.indent))
    end

    -- function to check if a string is a valid
    -- identifier
    local function is_identifier(id)
        if string.match(id, "[a-zA-Z_][a-zA-Z0-9_]*") == id then
            return true
        else
            return false
        end
    end

    if type(o) == "number" then
        -- serialize number, using hex format
        -- if wanted
        if args.hexnum then
            io.write(string.format("%a", o))
        else
            io.write(tostring(o))
        end
    elseif type(o) == "boolean" then
        -- serialize boolean
        io.write(tostring(o))
    elseif type(o) == "string" then
        -- serialize string, using string.format
        -- to escape it properly
        io.write(string.format("%q", o))
    elseif type(o) == "table" then
        -- recursively serialize table
        -- write table header
        io.write("{\n")

        -- do array part first, remember which indices
        -- we have been to (numbers from 1 to #o)
        local indexes = {}
        for i, v in ipairs(o) do
            -- serialize value, indenting one more, not using a newline
            -- and passing on the hexnum settings
            serialize(v, {indent=args.indent+1, newline=false, hexnum=args.hexnum})
            io.write(",\n")
            indexes[i] = true
        end

        -- now do table part
        for k, v in pairs(o) do
            -- check if this was printed already (as
            -- array item)
            if not indexes[k] then
                -- indent
                io.write(string.rep("  ", args.indent+1))
                
                -- check if key is an identifier, and choose
                -- how to write it out based on that
                if is_identifier(k) then
                    io.write(k, " = ")
                else
                    io.write(string.format("[%q] = ", k))
                end

                -- serialize the value (inline makes sure
                -- that the indentation level is passed on 
                -- but it's not indented, which is needed for
                -- embedded tables)
                serialize(v, {indent=args.indent+1, inline=true, newline=false, hexnum=args.hexnum})
                io.write(",\n")
            end
        end
        -- indent, once again
        io.write(string.rep("  ", args.indent))

        -- write table footer
        io.write("}")
    else
        -- complain!
        error("cannot serialize a " .. type(o))
    end

    -- write final newline
    if args.newline then
        io.write("\n")
    end
end

t = {"a", "b", "c", "d", 
    name = "this",
    age = 131.89,
    bday = {
        d=8,
        m=6,
        y=1995
    },
    ["a dude"] = true
}

serialize(t)
