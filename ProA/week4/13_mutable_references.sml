(*A variable bound to the reference is still immutable though, it will always refer to the same reference*)

val x = ref 42 

val y = ref 42 

val z = x
(*z and x refer to the same reference*)

val _ = x := 43
(*updating value at x*)

val w = (!y) + (!z) (* 85 *)
(* ! is to access the value at the reference *)

(* x + 1 does not type-check *)
