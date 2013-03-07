-- file: xpcall.lua
-- shows xpcall

-- do something 'complicated'
function complicated(fails, why)
    if fails then
        return fail(why)
    else
        return "2+2=4"
    end
end

-- raises an error
function fail(why)
    error(why)
end

-- see what we get from complicated(false)
-- we gotta use an anonymous function because
-- xpcall doesn't take variable arguments
err, ret = xpcall(function()
    complicated(false)
end, debug.traceback)
print("complicated(false) --> ", err, ret)

-- see what we get from complicated(true)
err, ret = xpcall(function()
    complicated(true, "problems concentrating")
end, debug.traceback)
print("complicated(true) --> ", err, ret)

-- xpcall takes two arguments: a function to
-- call in protected mode and an error handler.
-- common are these:
--  debug.traceback: shows traceback
--  debug.debug: shows interactive console
-- xpcall returns true or false, depending
-- on the success, and the return value(s)
-- or the error string from the error handler.
