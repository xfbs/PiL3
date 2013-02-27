-- file: maze.lua

-- room one function
function room1()
    while true do
        local move = io.read()
        if move == "south" then
            return room3()
        elseif move == "east" then
            return room2()
        else
            print("invalid move")
        end
    end
end

-- room two function
function room2()
    while true do
        local move = io.read()
        if move == "south" then
            return room4()
        elseif move == "west" then
            return room1()
        else
            print("invalid move")
        end
    end
end

-- room three function
function room3()
    while true do
        local move = io.read()
        if move == "north" then
            return room1()
        elseif move == "east" then
            return room4()
        else
            print("invalid move")
        end
    end
end

-- room four function
function room4()
    print("congratulations, you won!")
end

room1()
