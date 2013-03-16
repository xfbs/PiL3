-- file: explain1.lua

-- new local variable 'foo'
local foo

do
    -- new local variable '_ENV', equal
    -- to the global '_ENV' variable
    local _ENV = _ENV

    -- foo is now a function which prints
    -- whatever _ENV.x happens to be
    function foo() print(X) end
end

-- set _ENV.X to 13
X = 13

-- set _ENV to be nil (no more access to
-- global variables after this)
_ENV = nil

-- calls foo(), which is local and uses
-- the print() function to print the value
-- of X (it still has access to these thanks
-- to scoping) --> will print 13
foo()

-- fail, _ENV is not a table
X = 0
