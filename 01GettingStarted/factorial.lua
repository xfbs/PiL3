-- file: factorial.lua

-- defines a factorial function
-- returns nil on error, the factorial otherwise
function fact (n)
    if n < 0 then
        return nil
    elseif n == 0 then
        return 1
    else
        return n * fact(n-1)
    end
end

-- get number from user
print("enter a number:")
a = io.read("*n")
f = fact(a)

-- check for error
if f == nil then
    print("bad number entered (maybe negative?)")
else
    print(f)
end
