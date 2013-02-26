-- file: expression.lua

-- type(x) always returns a string,
-- so it is not equal to nil
print("type(nil)==nil --> " .. (type(nil)==nil and "true" or "false"))
print("Because type(nil) --> " .. type(nil) .. " which is of type " .. type(type(nil)))
