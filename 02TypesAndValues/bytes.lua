#!/usr/bin/env lua
-- file: bytes.lua
-- Exercise 2.5: Suppose you need to format a long sequence
-- of arbitrary bytes as a string literal in Lua. How would
-- you do it? Consider issues like readability, maximum line
-- length, and performance.

-- Since it's a long sequence of arbitrary bytes, it may be
-- very long. Considering maximum line length, it's a good
-- idea to use `\z`.

data = "\x00\x01\x02\x03\x04\x05\x06\x07\z
        \x08\x09\x0A\x0B\x0C\x0D\x0E\x0F"

-- If that arbitrary bytes is human readable, we don't need
-- to escape it. And `\z` works all the same.

objective_c_is_wonderful = "outputImageProviderFromBuffer\z
                            WithPixelFormat:pixelsWide:\z
                            pixelsHigh:baseAddress:\z
                            bytesPerRow:releaseCallback:\z
                            releaseContext:colorSpace:\z
                            shouldColorMatch"

