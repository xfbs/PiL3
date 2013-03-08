-- file: coroutines.lua
-- shows how coroutines are created, resumed
-- and how they yield

-- some useless coroutine. coroutine.yield() suspends
-- the coroutine, and raising an error kills it
function useless()
    -- some math
    print("useless: 2+2=4")
    coroutine.yield()
    print("useless: 1+1=2")
    coroutine.yield()
    print("useless: sqrt(9)=3")
    coroutine.yield()

    -- oops, an error is yielded from
    -- within the coroutine!
    error("ran out of ideas")
end

-- coroutines are created with coroutine.create(), which
-- returns a suspended coroutine that will execute the
-- given function when resumed
print "=> creating coroutine 'useless'"
co = coroutine.create(useless)

-- while the coroutine is suspended, we resume it and 
-- print some diagnostics. any error from within the 
-- coroutine will appear as a return value of resume.
while coroutine.status(co) == 'suspended' do
    print "=> resuming coroutine"
    succ, ret = coroutine.resume(co)
    status = coroutine.status(co)
    print("status: "..status)
    print("returned: ", succ, ret)
end
