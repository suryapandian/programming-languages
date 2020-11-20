### To run an sml file:
- ML is statically typed
- First type "sml" -> it will open a SML repl
- run `use "filename.sml";` the file runs successfully if no error
- you could see the declarations
- the last line will always be `val it = () : unit`, the result of running use. You are free to ignore this.
- the variables in the file are loaded in the REPL, you could access the variables with the values.
- To write a negative number: `~5`
- For floating point(called reals by SML REPL) numbers you can divide using operator `/`, for integerators `div`
- ANything that you can do with a loop can be done with recursion :ooooo:
- No function overloading with different number of arguments (SML there isn't a way to have functions that take variable numbers of arguments.)
- Possible ways to declare functions
```
val ans = pow(2,3)
val ans = pow (2,3)
val x = (2,3)
val ans = pow(x)
```