(*
Functional:
= avoiding mutations
= using functions as values
= closer to mathetmatical formulas
= programming idioms using laziness
= not OOP or C is not a good definition


First class functions are functions that are passed to other functions
First order functions are functions that do not have any functions as arguments
Higher order functions are the functions that takes or returns a function
Function closures are functions that can use variables in the environment or scope that is not directly passed to the function
*)


fun double x = 2*x
fun incr x = x+1
val a_tuple = (double, incr, double(incr 7))
val eighteen = (#1 a_tuple) 9



(*WITHOUT USING FIRST CLASS FUNCTIONS*)

fun increment_n_times_lame (n,x) = (* silly example, this is addition (n+x) *)
   if n=0
   then x
   else 1 + increment_n_times_lame(n-1,x)

fun double_n_times_lame (n,x) = (* (2^n * x)*)
   if n=0
   then x
   else 2 * double_n_times_lame(n-1,x)

fun nth_tail_lame (n,xs) = (*2, [4,5,6,7,8] =  [6,7,8]*)
   if n=0
   then xs
   else tl (nth_tail_lame(n-1,xs))



(*abstract the common pieces into a function
   n_times(f,n,x) returns f(f(...(f(x)))) where there are n calls to f
   note: if we gave x type int, then we could not use this for lists
*)


fun n_times (f,n,x) = 
    if n=0
    then x
    else f (n_times(f,n-1,x))

fun increment x = x+1

fun double x = x+x



val x1 = n_times(double,4,7)
val x2 = n_times(increment,4,7)
val x3 = n_times(tl,2,[4,8,12,16]) 


(* and we can define functions that use n_times *)
fun addition (n,x) = n_times(increment,n,x) (* assumes n >=0 *)
fun double_n_times (n,x) = n_times(double,n,x)
fun nth_tail (n,x) = n_times(tl,n,x)

(* we can then use n_times for more things we did not plan on originally *)

fun triple x = 3*x

fun triple_n_times (n,x) = n_times(triple,n,x)




(* higher-order functions are often polymorphic based on "whatever
type of function is passed" but not always: *)
fun times_until_zero (f,x) = 
    (* note: a better implementation would be tail-recursive *)
    if x=0 then 0 else 1 + times_until_zero(f, f x)

(* conversely, we have seen polymorphic functions that are not higher-order *)
fun len xs =
    case xs of
       [] => 0
      | x::xs' => 1 + len xs'

