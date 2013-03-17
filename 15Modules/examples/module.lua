-- file: module.lua
-- an example of how to write a module in Lua

-- create local _ENV value so that we
-- can change it
local _ENV = _ENV

-- do this in a new chunk so that the
-- local variables are not visible 
-- outside of it
do
    -- metatable for new _ENV
    local mt = {
        -- when looking for a global variable, first
        -- check if it's in _G (global variables) and
        -- then if it's in _M (global variables local
        -- to this module)
        __index = function(t, k)
            return t._G[k] or t._M[k] or nil
        end,

        -- when setting new global variables, complain
        -- if existing global variables would be 'over-
        -- written', and if not, define them as a 
        -- variable in the module table _M
        __newindex = function(t, k, v)
            if t._G[k] ~= nil then
                error(string.format("attempt to change global variable %q!", k), 2)
            end

            t._M[k] = v
        end
    }

    -- new environment. need two global variables:
    -- the global environment _G and the module
    -- table _M
    local env = {_G=_G, _M={}}
    setmetatable(env, mt)
    _ENV = env
end

local text = "asda"

-- private because it's local
local function printr_private()
    -- we can access global variables as well
    -- as local variables
    print(text)
end

-- function definitions (anything that is global
-- will be exported to the module table)
function printr(a)
    -- call private function
    printr_private()
end

-- return the module table (any global variables
-- defined will be in here)
return _M
