local E2Desc = E2Helper.Descriptions
local function desc(name,desc)
    E2Desc[name] = (desc .. "[CoroutineCore]")
end

desc("coroutine(s)","Creates a coroutine object to be run with xco:resume()")
desc("coroutineRunning()","Returns the current e2 coroutine running, else nothing")
desc("coroutineYield()","Makes the coroutine pause until it is resumed again. It will remember everything that is happening")
desc("coroutineWait(n)","Makes a coroutine wait for n amount of seconds, in this time, it is yielded and cannot be resumed")

-- Metamethods
desc("status(xco:)","Returns a string of the status of the coroutine, 'dead' for finished, 'suspended' for yielded, and 'running' for obvious reasons")
desc("wait(xco:n)","Makes a coroutine wait for n amount of seconds, in this time, it is yielded and cannot be resumed")
desc("yield(xco:)","Makes the coroutine pause until it is resumed again. It will remember everything that is happening")
desc("reboot(xco:)","Returns a coroutine object that behaves as if the coroutine given was never started or was reset, 'rebooting' it")

-- Metamethods
desc("status(xco:)","Returns a string of the status of the coroutine, 'dead' for finished, 'suspended' for yielded, and 'running' for obvious reasons")
desc("wait(xco:n)","Makes a coroutine wait for n amount of seconds, in this time, it is yielded and cannot be resumed.")
desc("yield(xco:)","Makes the coroutine pause until it is resumed again. It will remember everything that is happening")
desc("reboot(xco:)","Returns a coroutine object that behaves as if the coroutine given was never started or was reset, 'rebooting' it.")