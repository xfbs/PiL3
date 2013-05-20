#!/usr/bin/env lua
-- file: binary.lua
-- Shows the operations offered by the bitwise
-- library

function printx(x)
    print(string.format("0x%X", x))
end

printx(bit32.band(0xDF, 0xFD))  --> 0xDD
printx(bit32.bor(0xD0, 0x0D))   --> 0xDD
printx(bit32.bxor(0xD0, 0xFF))  --> 0x2F
printx(bit32.bnot(0))           --> 0xFFFFFFFF

printx(bit32.bor(0xA, 0xA0, 0xA00))     --> 0xAAA
printx(bit32.band(0xFFA, 0xFAF, 0xAFF)) --> 0xAAA
printx(bit32.bxor(0, 0xAAA, 0))         --> 0xAAA
printx(bit32.bor())     --> 0x0
printx(bit32.band())    --> 0xFFFFFFFF
printx(bit32.bxor())    --> 0x0

printx(bit32.bor(2^32)) --> 0x0
printx(bit32.band(-1))  --> 0xFFFFFFFF

-- rotations and shifts
printx(bit32.rshift(0xDF, 4))   --> 0xD
printx(bit32.lshift(0xDF, 4))   --> 0xDF0
printx(bit32.rshift(-1, 28))    --> 0xF
printx(bit32.arshift(-1, 28))   --> 0xFFFFFFFF
printx(bit32.lrotate(0xABCDEF01, 4))    --> 0xBCDEF01A
printx(bit32.rrotate(0xABCDEF01, 4))    --> 0x1ABCDEF0

printx(bit32.lrotate(0xABCDEF01, -4))   --> 1ABCDEF0
printx(bit32.lrotate(0xABCDEF01, -36))  --> 1ABCDEF0
printx(bit32.lshift(0xABCDEF01, -36))   --> 0x0
printx(bit32.rshift(-1, 34))    --> 0x0
printx(bit32.arshift(-1, 34))   --> 0xFFFFFFFF

-- btest
print(bit32.btest(12, 1))   --> false
print(bit32.btest(13, 1))   --> true

-- extract and replace
printx(bit32.extract(0xABCDEF01, 4, 8))     --> 0xF0
printx(bit32.extract(0xABCDEF01, 20, 12))   --> 0xABC
printx(bit32.extract(0xABCDEF01, 0, 12))    --> 0xF01
printx(bit32.extract(0x0000000F, 0))    --> 0x1
printx(bit32.extract(0xF0000000, 31))   --> 0x1
printx(bit32.replace(0xABCDEF01, 0x55, 4, 8))   --> 0xABCDE551
printx(bit32.replace(0xABCDEF01, 0x0, 4, 8))    --> 0xABCDE001
