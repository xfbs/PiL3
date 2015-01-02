#!/usr/bin/env lua
-- file: maze.lua
-- Exercise 6.4: As we have seen, a tail call is a goto in
-- disguise. Using this idea, reimplement the simple maze
-- game from section 4.4 using tail calls. Each block
-- should become a new function, and each goto becomes
-- a tail call.

-- This solution is given in Programming in Lua first edition
-- http://www.lua.org/pil/6.3.html

function room1 ()
    local move = io.read()
    if move == "south" then return room3()
    elseif move == "east" then return room2()
    else
        print("invalid move")
        return room1()   -- stay in the same room
    end
end
    
function room2 ()
    local move = io.read()
    if move == "south" then return room4()
    elseif move == "west" then return room1()
    else
        print("invalid move")
        return room2()
    end
end
    
function room3 ()
    local move = io.read()
    if move == "north" then return room1()
    elseif move == "east" then return room4()
    else
        print("invalid move")
        return room3()
    end
end
    
function room4 ()
    print("congratulations!")
end
    
-- We start the game with a call to the initial room:

room1()
