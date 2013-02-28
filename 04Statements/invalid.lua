-- file: invalid.lua

-- this code is invalid, so don't run it
print("don't run this code, it doesn't work!")
os.exit()

-- this code is so wrong, it was really hard to 
-- decipher. I think the author wanted to have
-- a function that returns an anonymous function,
-- which, when called, resumes the original 
-- function. This is provided with `getlabel()`.
-- The idea is that, when the anonymous function
-- is called, it executes `goto L1`, thus going
-- to the label and causing `getlabel()` to 
-- return. 

function getlabel()
    return function() goto L1 end
    ::L1::
    return 0
end

function f(n)
    if n == 0 then return getlabel()
    else
        local res = f(n-1)
        print(n)
        return res
    end
end

x = f(10)
x()
