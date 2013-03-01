-- file: maze.lua
-- implemented using tail calls

-- room one function
function room1()
    local func
    while true do
        local move = io.read()
        if move == "south" then
            func = room3
            break
        elseif move == "east" then
            func = room2
            break
        else
            print("invalid move")
            return
        end
    end

    return func()
end

-- room two function
function room2()
    local func
    while true do
        local move = io.read()
        if move == "south" then
            func = room4
            break
        elseif move == "west" then
            func = room1
            break
        else
            print("invalid move")
            return
        end
    end
    
    return func()
end

-- room three function
function room3()
    local func
    while true do
        local move = io.read()
        if move == "north" then
            func = room1
            break
        elseif move == "east" then
            func = room4
            break
        else
            print("invalid move")
            return
        end
    end

    return func()
end

-- room four function
function room4()
    print("congratulations, you won!")
end

room1()
