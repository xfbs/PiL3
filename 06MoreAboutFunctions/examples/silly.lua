-- silly example from the book to illustrate
-- the concept that functions are first-class
-- citizens in Lua
a = {p=print}
a.p("Hello World")

print = math.sin
a.p(print(1))

sin = a.p
sin(10, 20)
