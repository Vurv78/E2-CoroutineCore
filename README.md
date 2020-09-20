# E2-Coroutine Core

This is an extension for an addon for Garry's Mod, wiremod, specifically expression2.
This adds coroutine and try & catch functionality to e2, that lets you do stuff like make a function sleep for a few seconds or make a function that loops through 4 arrays without hitting quota.

## Documented functionality

### Regular functions
```golo
coroutine(s) # Creates a coroutine object to be run with xco:resume()
coroutineRunning() # Returns the current coroutine object running, else nothing.
```

### Metamethods
```golo
coroutine:status() # Returns a string of the status of the coroutine, 'dead' for finished, 'suspended' for yielded, and 'running' for obvious reasons
coroutine:wait(number waitseconds) # Makes a coroutine wait for n amount of seconds, in this time, it is yielded and cannot be resumed.
coroutine:yield() # Makes the current coroutine running yield, does not actually need to be any particular coroutine.
coroutine:reboot() # Returns a coroutine object that behaves as if the coroutine given was never started or was reset, 'rebooting' it. Same as creating a new coroutine(s) with the same function, but cheaper.
```

### Try & Catch Functions( Kind of separate )

```golo
# Without a 'catch' function, behaves like pcall
try(s) # Tries to run the first function, and returns an array with the first element being a number 1 or 0 for whether it successfully ran, and the next either being the error message or the return value of the 'try' function.

# With catching - behaves like xpcall
try(s,s) # Tries to run the first function, returns the same as try(s) but also calls a second callback function with the same results.
```