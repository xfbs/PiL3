-- file: sorting.lua
-- shows an example of how an anonymous function
-- is used for sorting

-- function to print a person's name
function print_person(p)
    print(p.first .. ' ' .. p.last)
end

-- a list of people
people = {
    {first="Richard", last="Stallman"},
    {first="Linus", last="Torvalds"},
    {first="Bill", last="Gates"},
    {first="Steve", last="Jobs"},
    {first="Johnny", last="Cash"}
}

-- sort the list of people with the custom 
-- comparison function
table.sort(people, function(a,b)
    return(a.last < b.last)
end)

-- print the sorted list of people
for i, person in ipairs(people) do
    print_person(person)
end
