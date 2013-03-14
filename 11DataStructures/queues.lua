-- file: queues.lua
-- simple way to implement queues and
-- double queues
-- Couldn't keep myself from rewriting this :p

queue = {}
function queue.new()
    -- if first and last are equal, the list is empty
    -- else, list[first] is the first element and
    -- list[last-1] is the last element
    local list = {first=0, last=0}

    -- the functions
    for name, meth in pairs(queue) do
        if name ~= "new" then list[name]=meth end
    end

    return list
end

function queue.pushfirst(list, value)
    -- set value to be at list.first-1
    list[list.first-1] = value

    -- update list.first
    list.first = list.first-1
end

function queue.pushlast(list, value)
    -- set value to be at list.last
    list[list.last] = value

    -- increase list.last
    list.last = list.last+1
end

function queue.popfirst(list)
    -- make sure list is empty
    if list.first == list.last then return nil end

    -- save value
    local value = list[list.first]

    -- remove from list
    list[list.first] = nil

    -- update list.first
    list.first = list.first+1

    -- set first and last to 0 if possible
    if list.first == list.last then
        list.first = 0
        list.last = 0
    end

    return value
end

function queue.poplast(list)
    -- make sure list is empty
    if list.first == list.last then return nil end

    -- save value
    local value = list[list.last-1]

    -- remove from list
    list[list.last-1] = nil

    -- update list.last
    list.last = list.last-1

    -- set first and last to 0 if possible
    if list.first == list.last then
        list.first = 0
        list.last = 0
    end

    return value
end

-- example
q = queue.new()
q:pushfirst("example")
q:pushfirst("an")
q:pushfirst("is")
q:pushfirst("This")
q:pushlast("of")
q:pushlast("queues")

word = q:popfirst()
while word do
    io.write(word .. " ")
    word = q:popfirst()
end

io.write("\n")
print("q.first="..q.first)
print("q.last="..q.last)
