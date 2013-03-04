-- file: fromto.lua
-- implements an iterator with two
-- approaches

-- stateless iterator implementation
function fromto(min, max)
    -- iterator function, the max variable is 
    -- stored by the for loop and automagically
    -- passed to it on every invocation
    local function iter(max, current)
        -- increase the current value
        current = current + 1

        -- if we've not reached max yet, return
        -- current value
        if not (current > max) then
            return current
        else
            -- otherwise, return nil (thereby
            -- ending the for loop)
            return nil
        end
    end

    -- return the iter function, the max value
    -- (which will be stored in the for loop)
    -- and the starting value
    return iter, max, min-1
end

-- the fromto function implemented as a state
-- machine (as a closure)
function sfromto(min, max)
    -- the current variable holds the state, since
    -- it gets increased with every invocation we
    -- subtract one from it now
    local current = min - 1

    -- the iterator function
    local function iter()
        -- increment the state variable
        current = current + 1
        
        -- return it when we haven't reached 
        -- max yes
        if not (current > max) then
            return current
        else
            -- return nil otherwise to end the loop
            return nil
        end
    end

    -- return the iterator function
    return iter
end

-- run the loop with the stateless 
-- iterator
for i in fromto(1, 5) do
    print("stateless: " .. i)
end

-- run the loop with the stateful
-- iterator
for i in sfromto(1, 5) do
    print("stateful: " .. i)
end
