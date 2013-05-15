#!/usr/bin/env lua
-- Exercise 21.3: Write a transliterate function. This function receives
-- a string and replaces each character in that string by another character,
-- according to a table given as second argument. If the table maps 'a' to
-- 'b', the function should replace any occurence of 'a' by 'b'. If the
-- table maps 'a' to false, the function should remove any occurences of
-- 'a' from the resulting string

function transliterate(s, dict)
    s = s:gsub(".", function(c)
        if dict[c] ~= nil then
            return dict[c] or ""
        else
            return c
        end
    end)

    return s
end
