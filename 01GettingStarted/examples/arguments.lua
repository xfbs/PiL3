#!/usr/bin/env lua
-- file: arguments.lua
-- shows how arguments can be accessed using
-- the global variable `arg`

-- prints arguments
for i = 0, #arg do
    print(arg[i])
end
