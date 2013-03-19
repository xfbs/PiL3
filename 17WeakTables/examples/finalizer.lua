#!/usr/bin/env lua
-- file: finalizer.lua
-- A finalizer is a function associated with an object
-- that is called when the object is about to be
-- collected. Lua implements finalizers through the 
-- metamethod __gc.
-- This example shows an example of a finalizer taken
-- from the book.

-- some object that will get a finalizer
obj = {txt = "hi"}

-- define a metatable for the object with
-- a finalizer method
local mt = {__gc = function(obj) print(obj.txt) end}

-- set the metatable. note that the __gc field of the
-- metatable needs to be set (nonnil) to force Lua to
-- mark the object for finalization. adding such a 
-- field to the metatable (without calling setmeta-
-- table() again) will cause Lua not to run the 
-- finalizer.
setmetatable(obj, mt)

-- discard the reference to obj
obj = nil

-- force the garbage collector to run, causing it to
-- finalize and throw away obj.
collectgarbage()
