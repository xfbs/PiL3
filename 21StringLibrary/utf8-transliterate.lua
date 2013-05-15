#!/usr/bin/env lua
-- Exercise 21.5: Rewrite the transliterate function for UTF-8 characters.

function transliterate(s, dict)
    -- now iterates over every code point instead of every character
    s = s:gsub(".[\128-\192]*", function(c)
        if dict[c] ~= nil then
            return dict[c] or ""
        else
            return c
        end
    end)

    return s
end

print(transliterate("Hallö!", {a="ä", ["ö"]="o", ["!"]=false}))
