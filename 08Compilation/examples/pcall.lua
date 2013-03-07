-- file: pcall.lua
-- demonstrates the power of pcall.

-- simple addition function
function add(a, b)
    return a+b
end

-- deliberately throws an error
function fail(why)
    error(why)
end

-- add two numbers, no problem
print("pcall(add, 4, 5) --> ", pcall(add, 4, 5))
-- add 0 to {} (oops!)
print("pcall(add, 0, {}) --> ", pcall(add, 0, {}))

-- fail with a reason
print("pcall(fail, \"it's monday\" --> ", pcall(fail, "it's monday"))
-- fail without reason
print("pcall(fail) --> ", pcall(fail))

-- pcall's first argument indicates if it caught an error, the other
-- arguments are either the ones returns from the function (if any)
-- or the error message.
