#!/usr/bin/env lua
-- file: random.lua
-- Exercise 18.3: Implement a better random function in
-- Lua. Search the Web for a good algorithm. (You may
-- need the bitwise library; see Chapter 19.)

-- Example taken from a post from comp.land.c, written
-- by George Marsaglia, a link to it is below:
--   http://groups.google.com/d/msg/comp.lang.c/
--   qZFQgKRCQGg/rmPkaRHqxOMJ

do
    -- the seeds used. I use the ones provided by Marsaglia,
    -- multiplied them with the current time and take that
    -- modulo 2^32 (size of an int). probably not very
    -- safe, but better than static seeds ;)
    local x = 123456789 * os.time() % 2^32
    local y = 362436069 * os.time() % 2^32
    local z = 521288629 * os.time() % 2^32
    local w = 88675123  * os.time() % 2^32
    local v = 886756453 * os.time() % 2^32

    -- random number generation function. this assumes
    -- that everything is done modulo 2^32, so the
    -- return value is stripped accordingly.
    function random()
        local t = bit32.bxor(x, bit32.rshift(x, 7))
        x, y, z, w = y, z, w, v
        v = bit32.bxor(bit32.bxor(v, bit32.lshift(v, 6)), bit32.bxor(t, bit32.lshift(t, 13)))
        return(v * (y+y+1) % 2^32)
    end
end

for i = 1, 10 do
    print(random())
end
