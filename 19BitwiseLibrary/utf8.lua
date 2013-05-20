#!/usr/bin/env lua
-- file: utf8.lua
-- Exercise 19.5: Write a function that receives a string coded in UTF-8
-- and returns its first code point as a number. The function should
-- return nil if the string does not start with a valid UTF-8 sequence.

utf8 = {}

-- finds the first utf-8 multibyte
local function find_multibyte(s)
    for i = 1, #s do
        local byte = string.byte(s, i)

        -- if the highest bit is set, this is the start of
        -- a multibyte
        if(bit32.btest(byte, 128)) then
            return i
        end
    end

    -- else, this string does not have any multibytes
    return 0
end

-- read the length of the multibyte
local function multibyte_length(m)
    if bit32.rshift(m, 5) == 6 then return 2 end
    if bit32.rshift(m, 4) == 14 then return 3 end
    if bit32.rshift(m, 3) == 30 then return 4 end
    if bit32.rshift(m, 2) == 62 then return 5 end
    if bit32.rshift(m, 1) == 126 then return 6 end
    return 0
end

local function check_multibyte(s, i, l)
    local m = string.byte(s, i)

    for j = 2, l do
        if not (bit32.rshift(string.byte(s, i+j-1), 6) == 2) then
            return false, "illegal multibyte sequence"
        end
    end

    return true
end

function utf8.decode(s)
    local multibyte_pos = find_multibyte(s)
    if multibyte_pos == 0 then
        return false, "no multibyte found"
    end

    local multibyte_len = multibyte_length(string.byte(s, multibyte_pos))
    if multibyte_len == 0 then
        return false, "illegal multibyte"
    end

    local ret, err
    ret, err = check_multibyte(s, multibyte_pos, multibyte_len)
    if not ret then return ret, err end

    local unicode = bit32.extract(string.byte(s, multibyte_pos), 6-multibyte_len, 7-multibyte_len)

    for i = 2, multibyte_len do
        unicode = bit32.lshift(unicode, 6) + bit32.extract(string.byte(s, multibyte_pos+i-1), 5, 6)
    end

    return unicode
end

return utf8
