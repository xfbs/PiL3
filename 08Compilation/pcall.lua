-- file: pcall.lua
-- Exercise 8.4: Can you find any value for f such that 
-- pcall(pcall, f) returns false as it's first result?

-- My Answer:
-- pcall() takes a function and it's parameters as it's
-- arguments, and returns a boolean indicating the status
-- as well as either the return values or an error code.
-- Thus, the only way of getting pcall to return false as
-- it's first argument is by having the function that it
-- takes as argument call error() somewhere, thus causing
-- pcall to catch that error.
-- Since pcall(f) will never raise an error (the whole 
-- point of it is to prevent errors from being raised, 
-- pcall(pcall, f) will never return false as first
-- return vale, regardless of what f is.

-- this is how to get pcall to return false
code, err = pcall(error, "some error code")
print('pcall(error, "some error code") --> ', code, err)

-- in this invocation, pcall(error, "...") is called,
-- returning false and "...", but since the invocation
-- is wrapped in another pcall, the whole thing returns
-- true (since the inner pcall doesn't raise an error),
-- false (since the inner pcall catches an error) and
-- "...", the error string
outer, inner, err = pcall(pcall, error, "some error code")
print('pcall(pcall, error, "some error code") --> ', outer, inner, err)


--[[
So the question is, how to raise an error to the outer pcall?
It seems impossible, since pcall will not raise an error.
But it only requires that the outer pcall receives an error,
rather than the inner pcall sends one.
Thus, if we manage to raise an error between the inner pcall
return and the outer pcall call, the first result of the outer
pcall will become `false`.
So we just need to insert a function inbetween, which will raise
an error.
We can insert the function via `debug.sethook`.

This implementation is inspired by Pierre Chapuis
gga-users.org/lists/lua-l/2013-01/msg00577.html
--]]

function f ()
  count = 0
  -- the hook function
  function g ()
    count = count + 1
    -- unset the hook function, otherwise when the outer pcall
    -- returns, there will be an error, and print wont't receive
    -- the result.
    -- raise an error
    if count == 2 then debug.sethook() end
    error()
  end
  -- run when a function returns
  debug.sethook(g, "r")
end

print(pcall(pcall, f))
