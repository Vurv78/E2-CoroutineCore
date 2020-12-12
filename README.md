# E2-Coroutine Core

This won't be worked on until I get an actual workflow with VExtensions going. https://github.com/Vurv78/VExtensions/wiki/CoroutineCore
Will be archived until that happens.

This is an extension for an addon for Garry's Mod, wiremod, specifically expression2.
This adds coroutine and try & catch functionality to e2, that lets you do stuff like make a function sleep for a few seconds or make a function that has four 'for' loops in each other without hitting quota.

FOR MORE DOCS, A WORKING WIKI AND MORE: https://github.com/Vurv78/VExtensions/wiki/CoroutineCore

Link to workshop addon: https://steamcommunity.com/sharedfiles/filedetails/?id=2233905819

## Documented functionality

### Regular functions
```golo
coroutine(string functionname) # Creates a coroutine object to be run with xco:resume()
coroutineRunning() # Returns the current coroutine object running, else nothing.
coroutineYield() # See xco:yield()
coroutineWait(number waitseconds) # See xco:wait(number waitseconds)
```

### Metamethods
```golo
coroutine:status() # Returns a string of the status of the coroutine, 'dead' for finished, 'suspended' for yielded, and 'running' for obvious reasons
coroutine:wait(number waitseconds) # Makes a coroutine wait for n amount of seconds, in this time, it is yielded and cannot be resumed.
coroutine:yield() # Makes the current coroutine running yield, does not actually need to be any particular coroutine.
coroutine:reboot() # Returns a coroutine object that behaves as if the coroutine given was never started or was reset, 'rebooting' it. Same as creating a new coroutine(s) with the same function, but cheaper.
```

Try and Catch functions have been removed. Please use VExtensions if you want these! https://github.com/Vurv78/VExtensions

## Usage

```golo
@name E2-Coroutine Examples
@persist Co:coroutine

if(first()){
    runOnTick(1)
    function number yes(){
        local I = 0
        print("...")
        coroutineWait(3) # Use either the metamethod or this one.
        print("Hey you, you're finally awake.")
        Co:wait(2)
        print("You were trying to cross the border right?")
        Co:wait(2)
        print("Walked right into that Imperial ambush same as us and that thief over there")
        Co:wait(2)
        print("Damn you Stormcloaks... Skyrim was fine until you came along!")
        Co:wait(3)
        print("Empire was nice and lazy. If they hadnt been looking for you Id have stolen that horse and been halfway to Hammerfell.")
        Co:wait(1)
        print("Looks at Dragonborn You there, you and me, we shouldnt be here. Its these Stormcloaks the Empire wants.")
        
        return 69
    }
    
    function number bruh(){
        print(coroutineRunning() ? "coroutine is running" : "nope") # --> coroutine is running
        coroutineYield()
        print("bruh")
        return 69
    }
    
    local O = coroutine("bruh")
    O:resume()
    O:resume()
    
    O = O:reboot()
    O:resume()
    # Doesn't resume a second time, no 'bruh' output

}elseif(tickClk()){
    if(Co:status()!="dead"){
        Co:resume()
    }else{
        runOnTick(0)
        print("Finished e2 coroutine!")
    }
}
```
