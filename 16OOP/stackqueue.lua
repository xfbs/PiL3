#!/usr/bin/env lua
-- file: stackqueue.lua
-- Exercise 16.2: Implement a class StackQueue as a subclass of
-- Stack. Besides the inherited methods, add to this class a method
-- insertbottom, which inserts an element as the bottom of the
-- stack. (This method allows us to use objects of this class as
-- queues.)

-- load the stack class
dofile("stack.lua")

-- create a subclass of Stack with a new pointer, bottompointer,
-- which keeps track of where the lowest element in the queue
-- is.
StackQueue = Stack:new{bottompointer=0}

-- due to the new bottompointer, we need a new test for the 
-- stackqueue being empty. this is true if the bottompointer and
-- the stack pointer are equal.
function StackQueue:isempty()
    return self.pointer == self.bottompointer
end

-- method to insert data at the bottom (so as to be able to use
-- the class as a queue)
function StackQueue:insertbottom(v)
    -- insert value
    self[self.bottompointer] = v

    -- update bottom pointer
    self.bottompointer = self.bottompointer - 1
end
