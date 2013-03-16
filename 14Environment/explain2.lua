-- file: explain2.lua

-- make new local variable called 'print'
-- which is a reference to the global print
local print = print

-- new global function
function foo(_ENV, a)
    -- _ENV is passed in as parameter, so
    -- all global variables are taken from 
    -- there
    -- Both a and print are in local scope
    -- Thus, the following statement is
    -- equal to print(a + _ENV.b)
    print(a + b)
end

-- calls foo with the global 'b' being 14,
-- will print 26
foo({b = 14}, 12)

-- calls foo with the global 'b' bein 10,
-- will print 11
foo({b = 10}, 1)
