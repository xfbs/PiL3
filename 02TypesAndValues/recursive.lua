-- file: recursive.lua

-- illustrates how recursive tables behave
print("a = {}")
a = {}

print("a.a = a")
a.a = a

print("print(a.a.a.a)")
print(a.a.a.a)

print("print(a == a.a.a.a)")
print((a==a.a.a.a) and "true" or "false")

print("a.a.a.a = 3")
a.a.a.a = 3

print("print(a.a)")
print(a.a)

print("print(a == a.a)")
print((a == a.a) and "true" or "false")
