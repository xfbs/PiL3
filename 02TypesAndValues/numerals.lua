-- file: numerals.lua

-- shows which numerals are
-- valid and which ones aren't
print(".e12\t\t--> invalid (no decimal part specified)")
print("0.0e\t\t--> invalid (no exponent specified)")
print("0xABFG\t\t--> invalid (no G in hexadecimal)")
print("FFFF\t\t--> invalid (identifier)")
print("0x\t\t--> invalid (no number specified")
print(".0e12\t\t--> " .. .0e12)
print("0x12\t\t--> " .. 0x12)
print("0xA\t\t--> " .. 0xA)
print("0xFFFFFFFF\t--> " .. 0xFFFFFFFF)
print("0x1P10\t\t--> " .. 0x1P10)
print("0.1e1\t\t--> " .. 0.1e1)
print("0x0.1p1\t\t--> " .. 0x0.1p1)
