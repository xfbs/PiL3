-- file: transfer.lua
-- Exercise 9.3: Implement a transfer function in Lua. If you think
-- about resume-yield as similar to call-return, a transfer would
-- be like a goto: it suspends the running coroutine and resumes
-- any other coroutine, given as argument.
coroutines = {}

-- transfer control to a given coroutine
function transfer(name)
    if coroutines[name] == nil then
        error("coroutine "..name.." doesn't exist")
    else
        coroutine.yield(name)
    end
end

-- register some function as a coroutine
function register(name, func)
    coroutines[name] = coroutine.create(func)
end

-- the main loop (transfers control between 
-- coroutines)
function start(name)
    local status, pname
    while name do
        if coroutines[name] == nil then
            error("coroutine "..name.." doesn't exist")
        end
        pname = name
        status, name = coroutine.resume(coroutines[name])
        if status == 'dead' then
            coroutines[pname] = nil
        end
    end
end

register('mario', function()
    print('mario: hey, how are you?')
    transfer('luigi')
    print('mario: great. what have you been up to?')
    transfer('luigi')
    print("mario: huh, really? isn't mike also learning that? mike?")
    transfer('mike')
    print("mario: aren't you also learning Lua?")
    transfer('mike')
    print('mario: well then, good luck both of you!')
    transfer('mike')
end)

register('mike', function()
    print(' mike: yup?')
    transfer('mario')
    print(' mike: yes I am, such a fun language')
    transfer('luigi')
    print(' mike: thanks mario')
    transfer('luigi')
end)

register('luigi', function()
    print('luigi: fine, thanks for asking!')
    transfer('mario')
    print("luigi: oh, i'm learning and awesome language called Lua")
    transfer('mario')
    print("luigi: I'm glad you think that way, mike")
    transfer('mario')
    print('luigi: thank you')
end)

start('mario')
