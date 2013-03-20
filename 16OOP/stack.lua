#!/usr/bin/env lua
-- file: stack.lua
-- Exercise 16.1: Implement a class Stack, with methods
-- push, pop, top and isempty.

Stack = {pointer = 0}

function Stack:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Stack:push(v)
    -- increment stack pointer
    self.pointer = self.pointer + 1

    -- save value
    self[self.pointer] = v
end

function Stack:isempty()
    -- if stack pointer is zero, the
    -- stack is empty
    return self.pointer == 0
end

function Stack:pop()
    if self:isempty() then return nil end

    -- get value
    local value = self[self.pointer]

    -- set to nil (for the gc)
    self[self.pointer] = nil

    -- decrement stack pointer
    self.pointer = self.pointer - 1

    return value
end
