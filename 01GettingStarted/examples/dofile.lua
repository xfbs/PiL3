#!/usr/bin/env lua
-- file: dofile.lua
-- shows how the function `dofile()` to load
-- external libraries

dofile("lib1.lua")  -- load your library
n = norm(3.4, 1.0)
print(twice(n))     --> 7.0880180586677
