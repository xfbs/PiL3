#!/usr/bin/env lua
-- file: escapes.lua
-- Exercise 3.8: Suppose that you want to create a table
-- that associates each escape sequence for strings with
-- it's meaning. How could you write a constructor for
-- that table?

-- We want to use the table as a kind of associative map,
-- so there are two constructor types that we can consider:
--   Record constructor:  {a="a", b="b", ...}
--   General constructor: {["a"]="a", ["b"]="b", ...}
-- The record constructor has one catch: it only works if
-- the keys are valid identifiers. Escape sequences start
-- with backslashes, which is not a valid character for an
-- identifier, meaning that we cannot use this constructor.
-- Even if we omit the backslashes it won't work because
-- there are escape sequences (like \0) that, after
-- stripping the backslash, start with digits, which also
-- aren't supported. Thus, we should use the general
-- constructor syntax for this:
escapes = {
    ["\n"] = "newline",
    ["\r"] = "carriage return",
    ["\a"] = "alert",
    ["\0"] = "null character"
}

-- show some examples
print("\\n --> " .. escapes["\n"])
print("\\a --> " .. escapes["\a"])
