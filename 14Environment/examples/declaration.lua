-- file: declaration.lua
-- checking global-variable declaration

-- put this in a do loop to 'hide' the scope of
-- declaredNames
do
    local declaredNames = {}

    -- set metatable for the global environment
    setmetatable(_G, {
        -- called when trying to set a new global variable
        __newindex = function(t, n, v)
            -- check if the variable is already declared
            if not declaredNames[n] then
                -- if not, see if we're in a function
                local w = debug.getinfo(2, "S").what
                if w ~= "main" and w ~= "C" then
                    error("attempt to write to undeclared variable "..n, 2)
                end
                -- if we're in C or not in a function,
                -- everything is gold
                declaredNames[n] = true
            end
            -- actually set the variable (with rawset,
            -- to prevent an infinite loop)
            rawset(t, n, v)
        end,

        -- called when trying to read an undefined
        -- variable
        __index = function(_, n)
            -- if it's not defined, then complain
            if not declaredNames[n] then
                error("attempt to read undeclared variable "..n, 2)
            else
                -- else, return nil to suggest the
                -- variable's absence
                return nil
            end
        end
    })
end

print("Setting and reading work fine")
print("  global_var = 5")
global_var = 5

io.write("  print(global_var) --> ")
print(global_var)

print("\nTrying to set and read from in a function...")
ret, msg = pcall(function()
    print("[in function] works fine if the variable has been declared")
    print("  global_var = 9")
    global_var = 9

    io.write("  print(global_var) --> ")
    print(global_var)
    return true
end)
if not ret then print("    [error]: " .. msg) end

print("\n[in function] fails if variable has not been declared")
ret, msg = pcall(function()
    print("  new_global_var = 5")
    new_global_var = 5
    return true
end)
if not ret then print("    [error]: " .. msg) end

ret, msg = pcall(function()
    print("  print(new_global_var) --> ")
    print(new_global_var)
    return true
end)
if not ret then print("    [error]: " .. msg) end
