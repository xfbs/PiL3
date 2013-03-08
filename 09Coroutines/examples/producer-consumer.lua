-- file: producer-consumer.lua
-- Producer-consumer example with filters

function receive(prod)
    local status, value = coroutine.resume(prod)
    return value
end

function send(x)
    coroutine.yield(x)
end

function producer()
    return coroutine.create(function()
        while true do
            local x = io.read() -- produce new value
            send(x)
        end
    end)
end

function filter(prod)
    return coroutine.create(function()
        for line = 1, math.huge do
            local x = receive(prod) -- get new value
            x = string.format("%5d %s", line, x)
            send(x) -- send it to consumer
        end
    end)
end

function consumer(prod)
    while true do
        local x = receive(prod) -- get new value
        io.write(x, "\n")       -- consume new value
    end
end

consumer(filter(producer()))
