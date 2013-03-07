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

