-- file: serialize.lus
-- serialize tables without cycles

function serialize(o)
    if type(o) == "number" then
        io.write(o)
        -- alternatively:
        -- io.write(string.format("%a", o))
    elseif type(o) == "string" then
        io.write(string.format("%q", o))
    elseif type(o) == "table" then
        io.write("{\n")
        for k, v in pairs(o) do
            io.write("  ", k, " = ")
            serialize(v)
            io.write(",\n")
        end
        io.write("}\n")
    else
        error("cannot serialize a " .. type(o))
    end
end

t = {"a", "b", "c", "d", 
    name = "this",
    age = 131.89,
    bday = {
        d=8,
        m=6,
        y=1995
    }
}

serialize(t)
