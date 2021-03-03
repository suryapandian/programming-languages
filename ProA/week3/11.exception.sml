fun hd xs =
    case xs of
        []   => raise List.Empty
      | x::_ => x

exception MyUndesirableCondition

exception MyOtherException of int * int

fun mydiv (x,y) =
    if y=0
    then raise MyUndesirableCondition
    else x div y 

(*passing exception*)
fun maxlist (xs,ex) = (* int list * exn -> int *)
    case xs of
        [] => raise ex
      | x::[] => x
      | x::xs' => Int.max(x,maxlist(xs',ex))

val w = maxlist ([3,4,5],MyUndesirableCondition) (* 5 *)

val x = maxlist ([3,4,5],MyUndesirableCondition) (* 5 *)
	handle MyUndesirableCondition => 42

(*val y = maxlist ([],MyUndesirableCondition)*)

val z = maxlist ([],MyUndesirableCondition) (* 42 *)
	handle MyUndesirableCondition => 42

(*handle can have multiple patters with branches of exception*)
exception MyException of int
fun f n =
    if n=0
    then raise List.Empty
    else if n=1
    then raise (MyException 4)
    else n * n
val x = (f 1 handle List.Empty => 42) handle MyException n => f n