# E2-Coroutine Core

This is an extension for an addon for Garry's Mod, wiremod, specifically expression2.
This adds coroutine and try & catch functionality to e2, that lets you do stuff like make a function sleep for a few seconds or make a function that has four 'for' loops in each other without hitting quota.

FOR MORE DOCS, A WORKING WIKI AND MORE: https://github.com/Vurv78/VExtensions/wiki/CoroutineCore

Link to workshop addon: https://steamcommunity.com/sharedfiles/filedetails/?id=2233905819

## Documented functionality

### Regular functions
```golo
coroutine(string functionname) # Creates a coroutine object to be run with xco:resume()
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
try(string tryfunction) # Tries to run the first function, and returns an array with the first element being a number 1 or 0 for whether it successfully ran, and the next either being the error message or the return value of the 'try' function.

# With catching - behaves like xpcall
try(string tryfunction,string catchfunction) # Tries to run the first function, returns the same as try(s) but also calls a second callback function with the same results.
```

## Usage

```golo
@name E2-Coroutine Examples
@persist Co:coroutine Done Result:array

if(first()){
    runOnTick(1)
    function number yes(){
        local I = 0
        print("...")
        Co:wait(2)
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
    
    function number fyou(){
        print(coroutineRunning() ? "coroutine is running" : "nope") # --> coroutine is running
        while(1){} # Why was this missing?
        return 69
    }
    
    function string doerror(){
        print("hello world")
        # This will error because it is not returning a string.
    }
    function callback(A:array){
        print("Try failed with message: " + A[2,string])
    }
    Co = coroutine("yes")
    Co:resume()
    
    print(try("doerror")) # -- > [0,Function doerror() executed and didn't return a value - expecting a value of type string]
    
    try("doerror","callback") # --> Runs function callback() with array provided that returns the same values as the top example.
    
    #print(try("fyou")) # --> [0,tick quota exceeded]
    
    local O = coroutine("fyou")
    O:resume()
    
    O = O:reboot()
    O:resume()

}elseif(!Done & tickClk()){
    if(Co:status()!="dead"){
        Result = Co:resume()
    }else{
        runOnTick(0)
        Done = 1
        print("Finished e2 coroutine. Printing return result!")
        print(Result)
    }
}
```
