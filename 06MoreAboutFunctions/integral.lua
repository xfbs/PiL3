-- file: integral.lua
-- calculates the integral of a given function
-- probably not mathematically correct, but you
-- get the idea

-- calculates the integral of function `func` in
-- the given range using the provided delta
function integral(func, start, stop, delta)
    local delta = delta or 1e-4
    local int = 0
    for i = start, stop, delta do
        int = int + func(i)*delta
    end
    return int
end

-- some sample functions (you can change these
-- to your own, custom functions)
function f(x)
    return 3*x^2 - 9*x + 4
end

function g(x)
    return math.sqrt(x + 4)
end

function h(x)
    return 4*x - 9
end

-- ask the user which function he wants the 
-- integral of
print("Please choose one of these functions:")
print(" f(x)=3x^2-9x+4")
print(" g(x)=sqrt(x+4)")
print(" h(x)=4x-9")

func = io.read()
if func == 'f' or func == 'f(x)' then
    func = f
elseif func == 'g' or func == 'g(x)' then
    func = g
elseif func == 'h' or func == 'h(x)' then
    func = h
else
    print("Unrecognized function")
    os.exit()
end

-- ask the user for the parameters (start,
-- stop, delta)
print("Where should the integral start?")
start = io.read("*n")

print("Where should it end?")
stop = io.read("*n")

print("What should be the delta?")
delta = io.read("*n")
if delta == 0 then
    delta = nil
end

-- calculate and print the integrals
print("Calculating integral...")
i = integral(func, start, stop, delta)
print("The integral is " .. i)
