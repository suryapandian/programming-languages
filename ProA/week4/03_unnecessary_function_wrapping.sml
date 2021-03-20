fun n_times (f,n,x) = 
    if n=0
    then x
    else f (n_times(f,n-1,x))

(* bad style: the if e then true else false of functions  *)
fun nth_tail (n,xs) = n_times((fn y => tl y), n, xs)

(* good style: *)
fun nth_tail (n,x) = n_times(tl, n, x)

(*for some reason if we need to rename an existing function*)
(* bad style *)
fun rev xs = List.rev xs

val rev = fn xs => List.rev xs

(* good style *)
val rev = List.rev
