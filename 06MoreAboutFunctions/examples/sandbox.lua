-- file: sandbox.lua
-- an example of how to write a sandbox
-- in Lua

-- this sandboxes the print function in a way
-- that it will only print numbers (no strings)
do
    local old_print = print
    local function check_arguments(...)
        args = table.pack(...)
        for i = 1, args.n do
            if type(args[i]) ~= 'number' then
                return false
            end
        end
        return true
    end
    function print(...)
        if check_arguments(...) then
            return old_print(...)
        else
            return old_print("unauthorized use of print!")
        end
    end
end

-- now we can only print numbers. let's
-- test it
print(2)
print(4)
print(1e-4)
print("some text")
print(true)
print(nil)
print({"harrow"})
