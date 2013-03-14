-- file: linkedlists.lua
-- shows how to use linked lists in Lua

-- create a linked list from an array
function make_linked_list(ary)
    -- work backwards ;)
    local list
    for i = #ary, 1, -1 do
        -- make list, and since we work backwards,
        -- list automatically refers to the next
        -- list element
        list = {next=list, value=ary[i]}
    end

    return list
end

-- iterator to work through the linked
-- list
function iterate_linked_list(list)
    -- iterator function, first argument is
    -- ignored since we don't need a state
    local function iter(_, list)
        -- go to next list
        list = list.next

        -- get value or nil (if list is not
        -- nil, it will be list.value, else
        -- it will be {}.value, which is nil
        local value = (list or {}).value

        -- return current list and value
        return list, value
    end

    -- return iteration function, an empty
    -- state and a link to the list
    return iter, nil, {next=list}
end

-- make linked list
local linked_list = make_linked_list{"This", "is", "stored", "in", "a", "linked", "list"}

-- traverse linked list
for list, value in iterate_linked_list(linked_list) do
    io.write(value .. " ")
end

io.write("\n")
