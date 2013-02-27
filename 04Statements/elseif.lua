-- file: elseif.lua

-- why does Lua need elseif more than
-- other languages?
-- other languages (C, C++, Java) offer
-- a switch statement, which allow the
-- programmer to write code which should
-- be executed depending on what some 
-- variable is
-- lua does not have this, however it 
-- can be synthesised with an elseif
-- conditional like so:
cat = {name="Pinky", kind="cat"}
dog = {name="Watson", kind="dog"}
god = {name="The Lord", kind="god"}

function make_sound(e)
    -- this is where one would traditionally
    -- use a switch statement
    if e.kind == "cat" then
        print(e.name .. " says 'meow'.")
    elseif e.kind == "dog" then
        print(e.name .. " says 'woof'.")
    elseif e.kind == "god" then
        print(e.name .. " doesn't say anything.")
    end
end

make_sound(cat)
make_sound(dog)
make_sound(god)
