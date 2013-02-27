-- file: unconditional.lua

-- undonditional while loop
function whileloop()
    while true do
        print("loop")
    end
end

-- unconditional repeat-until loop
function repeatloop()
    repeat
        print("loop")
    until false
end

-- unconditional
function gotoloop()
    ::loop::
    print("loop")
    goto loop
end

function forloop()
    for i = 1, math.huge do
        print("loop")
    end
end

-- ask the user which he wants to run
print("which loop should be run?")
print(" 1. while loop")
print(" 2. for loop")
print(" 3. repeat-until loop")
print(" 4. goto loop")
loops = {whileloop, forloop, repeatloop, gotoloop}
selection = io.read("*n")
loops[selection]()
