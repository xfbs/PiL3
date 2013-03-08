-- file: markov-definitions.lua
-- auxillary definitions for the Markov program

function allwords()
    local line = io.read()
    local pos = 1
    return function()
        while line do
            local s, e = string.find(line, "%w+", pos)
            if s then
                pos = e + 1
                return string.sub(line, s, e)
            else
                line = io.read()
                pos = 1
            end
        end
        return nil
    end
end

function prefix(w1, w2)
    return w1 .. " " .. w2
end

-- EDIT: in the book this was local, here it's
-- global so it's scope expands across the files
statetab = {}

function insert(index, value)
    local list = statetab[index]
    if list == nil then
        statetab[index] = {value}
    else
        list[#list+1] = value
    end
end
