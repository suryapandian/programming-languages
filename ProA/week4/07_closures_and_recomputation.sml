fun filter (f,xs) =
    case xs of
	[] => []
      | x::xs' => if f x then x::(filter(f,xs')) else filter(f,xs')


(*
(e1; e2)
does e1 throws away the result and returns e2
this is useful for printing
*)


fun allShorterThan1 (xs,s) = 
    filter (fn x => String.size x < (print "!"; String.size s), xs)

(*Size is calculated only once here*)
fun allShorterThan2 (xs,s) =
    let 
	val i = (print "!"; String.size s)
    in
	filter(fn x => String.size x < i, xs)
    end

val _ = print "\nwithAllShorterThan1: "

val x1 = allShorterThan1(["1","333","22","4444"],"xxx")

val _ = print "\nwithAllShorterThan2: "

val x2 = allShorterThan2(["1","333","22","4444"],"xxx")

val _ = print "\n"
