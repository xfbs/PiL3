#!/usr/bin/env lua
-- module: utf8.lua
-- Provides functions to work with UTF-8 encoded Unicode strings

-- Splits a UTF-8 encoded string into its code points
local function split(s)
    local code_points = {}

    for cp in string.gmatch(s, ".[\128-\191]*") do
        code_points[#code_points+1] = cp
    end

    return code_points
end

-- Build the module table
utf8 = {}
utf8.split = split

-- Return the module table
return utf8
