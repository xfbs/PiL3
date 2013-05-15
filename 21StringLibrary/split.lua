#!/usr/bin/env lua
-- Exercise 21.1: Write a split function that receives a string and
-- a delimiter pattern and returns a sequence with the chunks in the
-- original string separated by the delimiter

function split(s, delim)
    -- make sure that neither of the arguments is an empty string
    if #s==0 or #delim==0 then
        return {}
    end

    -- match indices
    local match_start = 0
    local match_end = 0
    local old_match_end = 0

    -- result array
    local result = {}

    -- find matches and split s
    while match_end ~= nil do
        -- keep the end of the old match around
        old_match_end = match_end

        -- look for the next occurence of the delimiter
        match_start, match_end = string.find(s, delim, old_match_end+1)

        -- if we have a match, take everything from between the end of the
        -- old match and the beginning of the new one
        if match_start ~= nil then
            result[#result+1] = string.sub(s, old_match_end+1, match_start-1)
        end
    end

    -- if there is anything beyone the last delimiter, take it as well
    if old_pattern_end < #s then
        result[#result+1] = string.sub(s, old_pattern_end+1)
    end

    -- return the list of split strings
    return result
end
