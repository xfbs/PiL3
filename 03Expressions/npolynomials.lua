-- file: npolynomials.lua

-- coefficients are stored in a Lua array,
-- with the first array member representing
-- the first coefficient (which is multiplied
-- by x^n) and the last array member representing
-- the last coefficient (multiplied by x)

-- calculates polynomials using 2n multiplications,
-- n additions and no exponentiations or something
-- along those lines
function calculate(coefficients, x)
    p = 0
    cur = 1
    for i = #coefficients, 1, -1 do
        p = p + cur*coefficients[i]
        cur = cur * x
    end
    return p
end

-- read coefficients from user
print("how many coefficients should be read?")
size = io.read("*n")
print("reading " .. size .. " coefficients")
c = {}
for i = 1, size do
    c[#c+1] = io.read("*n")
end

-- asks for x values to calculate the function
print("please enter x values (ctrl-d to exit)")
while true do
    x = io.read("*n")
    print("f(" .. x .. ") = " .. calculate(c, x))
end
