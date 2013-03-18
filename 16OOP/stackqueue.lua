-- file: stackqueue.lua

dofile("stack.lua") -- load the stack class
StackQueue = Stack:new{bottompointer=0}

function StackQueue:pop()
    -- make sure it's not empty
    if self.pointer == self.bottompointer then return nil end

    -- save value
    local value = self[self.pointer]

    -- delete from queue
    self[self.pointer] = nil

    -- decrease stack pointer
    self.pointer = self.pointer - 1

    return value
end

function StackQueue:isempty()
    return self.pointer == self.bottompointer
end

function StackQueue:insertbottom(v)
    -- insert value
    self[self.bottompointer] = v

    -- update bottom pointer
    self.bottompointer = self.bottompointer - 1
end
