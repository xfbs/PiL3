-- file: exponents.lua

-- what do these expressions do?
print("'2^3^4' is treated my the interpreter as")
print("being equivalent to '2^(3^4)' (so the caret")
print("sign, standing for exponentiation, is right-")
print("associative).")
print(" 2^3^4  = " .. 2^3^4)
print("2^(3^4) = " .. 2^(3^4))
print("(2^3)^4 = " .. (2^3)^4)

print("The same should be true for '2^-3^4'.")
print(" 2^-3^4  = " .. 2^-3^4)
print("2^(-3^4) = " .. 2^(-3^4))
print("(2^-3)^4 = " .. (2^-3)^4)
