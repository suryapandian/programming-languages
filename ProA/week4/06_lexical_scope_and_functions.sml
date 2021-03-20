(*
The sope of other variables where a function is defined is called as lexical scope
not where the function is called 
*)

(* 1 *) val x = 1

(* 2 *) fun f y = x + y

(* 3 *) val x = 2

(* 4 *) val y = 3

(* 5 *) val z = f (x + y) (*Result is 6*)



val x = 1
fun f y = 
    let 
        val x = y+1
    in
        fn z => x + y  + z
    end
val x = 3 (*irrelevant*)
val g = f 4 (*returns a function that adds 9*)
val y = 5 (*irrelevant*)
val z = g 6 (*returns 15)

(*Function closure = function + environment *)

(* second example *)
fun f g = 
    let 
        val x = 3
    in
        g 2
    end
(*
a function that accepts a function g as input and calls the function with 2
the local variable x is not used and hence not necessary
*)

val x = 4
fun h y = x + y  (*adds 4 to its argument*)
val z = f h


(* Being able to pass closures that have free variables (private data)
   makes higher-order functions /much/ more useful *)
fun filter (f,xs) =
    case xs of
    [] => []
      | x::xs' => if f x then x::(filter(f,xs')) else filter(f,xs')

fun greaterThanX x = fn y => y > x

fun noNegatives xs = filter(greaterThanX ~1, xs)

fun allGreater (xs,n) = filter (fn x => x > n, xs)