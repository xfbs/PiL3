#!/usr/bin/env lua
-- file: loop.lua
-- Exercise 3.1: What will the following program
-- print?
--     for i = -10, 10 do
--       print(i, i % 3)
--      end

-- As the for loop progresses from -10 to 10,
-- The values of `i` are printed at each step,
-- along with the value of `i mod 3`. -10 mod
-- 3 is 2, so it will start there, and either 
-- increase or go to 0 (the latter if it is
-- at 2).
for i = -10, 10 do
    print(i, i % 3)
end
