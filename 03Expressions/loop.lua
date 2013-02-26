-- file: loop.lua

-- an example of a loop
print("What will this print:")
print("\tfor i = -10, 10 do")
print("\t  print(i, i % 3)")
print("\tend")

print([[
As the for loop progresses from -10 to 10,
The values of `i` are printed at each step,
along with the value of `i mod 3`. -10 mod
3 is 2, so it will start there, and either 
increase or go to 0 (the latter if it is
at 2).
]])

for i = -10, 10 do
    print(i, i % 3)
end
