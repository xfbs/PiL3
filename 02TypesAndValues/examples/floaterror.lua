#!/usr/bin/env lua
-- file: floaterror.lua
-- shows one of the flaws of floating-point algebra
-- with fixed precision: not all numbers have an
-- exact representation, which can lead to funny
-- results in some cases.

-- here, we calculate 12.7 - 20 + 7.3, which should
-- be exactly zero, but since both 12.7 and 7.3 do
-- not have an exact representation, there is some
-- rounding involved which causes the result to not
-- be zero (~8x10^-16 on my machine)
num = 12.7 - 20 + 7.3
eqn = "12.7 - 20 + 7.3"

-- print if the number is equal to zero (probably
-- not) and what it is
print(eqn..' == 0 is '..tostring(num==0)..', but it should be true!')
print(eqn..' = '..num)
