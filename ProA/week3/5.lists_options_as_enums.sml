
(*Implementing list and option, but this is bad style use the pre-defined data types itself*)


datatype my_int_list = 
	Empty  
	| Cons of int * my_int_list

val x = Cons(4, Cons(23, Cons(8,Empty)));
val y = Cons(3, Empty);

fun append_my_list (xs, ys) =
	case xs of
		Empty => ys
		| Cons (x, xs') => Cons(x, append_my_list(xs',ys))

val b = append_my_list(x,y);
(*
Similarly, "Options" is a datatype binding, with NONE and SOME are constructors 
*)

fun sum_list xs =
	case xs of
		[] => 0
	| x::xs' => x + sum_list xs'


fun append (xs, ys) =
	case xs of
		[] => ys
	| x::xs' => x :: append(xs',ys)	

	(*Append method defined above is polymorphic can append lists of any type*)


(*Options can also be thought of as datatype bindings*)

fun inc_or_zero_intoption(intooption) = 
	case intooption of 
		NONE => 0
		| SOME i => i+1