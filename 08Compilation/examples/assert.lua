-- file: assert.lua
-- demonstrates the assert function

function example(fails)
    if fails then
        return false, "couldn't lock the matrix!"
    else
        return "the answer you are looking for is 42."
    end
end

print("pcall(assert, example(true)) --> ", pcall(assert, example(true)))
print("pcall(assert, example(false)) --> ", pcall(assert, example(false)))

-- assert is usually used to test if a function encountered an
-- error, which is indicated by returning false and a string 
-- representing the error. thus assert checks if it's first
-- argument is false, and if so, it raises an error with the
-- given error message.
