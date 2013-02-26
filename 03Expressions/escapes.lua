-- file: escapes.lua

-- a table that can be used to look up
-- string escapes
escapes = {
    ["\n"] = "newline",
    ["\r"] = "carriage return",
    ["\a"] = "alert",
    ["\0"] = "null character"}

-- show some examples
print("\\n --> " .. escapes["\n"])
print("\\a --> " .. escapes["\a"])
