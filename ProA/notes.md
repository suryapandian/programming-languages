### To run an sml file:
- ML is statically typed
- First type "sml" -> it will open a SML repl
- run `use "filename.sml";` the file runs successfully if no error
- comment (* add comment here *)
- you could see the declarations
- the last line will always be `val it = () : unit`, the result of running use. You are free to ignore this.
- the variables in the file are loaded in the REPL, you could access the variables with the values.
- To write a negative number: `~5`
- `=` assertion check for equal
- `<>` assertion check for not equal
- `Real.fromint 2` to convert into to real
- `=` and `<>` cannot be used with `real` or floating point numbers. Because they might hav trailing digits. Should always check with small delta diffs and not directly assert.
- For floating point(called reals by SML REPL) numbers you can divide using operator `/`, for integerators `div`
- ANything that you can do with a loop can be done with recursion :ooooo:
- No function overloading with different number of arguments (SML there isn't a way to have functions that take variable numbers of arguments.)
- Possible ways to declare functions
- nested functions can be used when the function is used only within a function
- ML has a datatype called OPTIONS (which is sort of like a pointer)
- We have datatypes like `andalso` , `orelse`, `not`
- `andalso` and `orelse` are both keywords while `not` is a function
- Functions evaluate the arguments before invoking the function. Since that is not the case with `andalso` and `orelse` they are not functions.
- function binding with keyword `fun`, variable binding with keyword `val`, datatype  binding with keyword `datatype`

```
val ans = pow(2,3)
val ans = pow (2,3)
val x = (2,3)
val ans = pow(x)
```