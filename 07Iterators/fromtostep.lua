-- file: fromtostep.lua
-- Exercise 7.2: Add a step parameter to the iterator from the
-- previous exercise. Can you still implement it as stateless
-- iterator?

-- fromto iterator generator with step variable
function fromto(min, max, step)
    -- iterator function, takes a state (table)
    -- and the current value
    local function iter(state, current)
        -- increase current by the step specified
        -- in the invariant state
        current = current + state.step

        -- check to see if we have passed the max
        -- and return nil if so to end the loop
        if not (current > state.max) then
            return current
        else
            return nil
        end
    end

    -- return iterator and crease the invariant
    -- state
    return iter, {max=max, step=step}, min-step
end

-- test the iterator in a for loop
for i in fromto(0, 15, 3) do
    print("fromtostep(0, 15, 3): " .. i)
end
