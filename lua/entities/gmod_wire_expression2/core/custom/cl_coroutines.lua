local E2Desc = E2Helper.Descriptions
local function desc(name,desc)
    E2Desc[name] = (desc .. " [CoroutineCore]")
end

desc("coroutine(s)","Creates a coroutine object to be run with xco:resume(). The given UDF's return type must be void and must have no arguments")
desc("coroutine(st)","Creates a coroutine object to be run with xco:resume(t). The given UDF's return type must be void/table and must have a single argument of type table. This overload allows to pass initial data to the UDF by using a table argument")
desc("coroutineRunning()","Returns the current running coroutine for this E2, else nothing")
desc("coroutineYield()","Makes the coroutine pause until it is resumed again. It will remember everything that is happening")
desc("coroutineYield(t)","Makes the coroutine pause until it is resumed again. It will remember everything that is happening. Use this overload if you need to pass data back to the caller (main thread)")
desc("coroutineWait(n)","Makes a coroutine wait for the given amount of seconds, in this time, it is yielded and cannot be resumed")
desc("nocoroutine()","Returns an 'invalid' coroutine value")
desc("coroutinesLeft()","Returns the how many coroutines you have left to use in the chip, see _XCO_MAX for the maximum amount of coroutines per chip")

-- Metamethods
desc("resume(xco:)","Resumes the coroutine (if it is suspended), or starts the coroutine if it hasn't been started yet")
desc("resume(xco:t)","Resumes the coroutine (if it is suspended), or starts the coroutine if it hasn't been started yet. Use this overload if you need to pass data to the coroutine thread using the table argument")
desc("status(xco:)","Returns a string of the status of the coroutine, 'dead' for finished, 'suspended' for yielded/unstarted, and 'running' for obvious reasons")
desc("wait(xco:n)","Makes a coroutine wait for the given amount of seconds, in this time, it is yielded and cannot be resumed")
desc("yield(xco:)","Makes the coroutine pause until it is resumed again. It will remember everything that is happening")
desc("yield(xco:t)","Makes the coroutine pause until it is resumed again. It will remember everything that is happening. Use this overload if you need to pass data back to the caller (main thread)")
desc("reboot(xco:)","Returns a coroutine object that behaves as if the coroutine given was never started or was reset, 'rebooting' it")
