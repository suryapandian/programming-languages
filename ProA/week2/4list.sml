val a = [23,45,5];

(*appending to list*)

val b = 5::a;

null b;
(*Returns true or false denoting if b is empty or not*)

hd b;
(*returns head of the list
head of one element list is the one element *)

tl b;
(*returns the list of elements expect first element
tail of one element list is empty list*)


(* '::' operator is called cons dons *)

(*CATCH
we can add a variable of any type to an empty list*)

fun sum_list(xs : int list) =
 if null xs
 then 0
 else hd xs+ sum_list(tl xs) 

fun list_product(xs : int list) =
 if null xs
 then 0
 else hd xs * list_product(tl xs) 


fun countdown(x: int) =
 if x=0
 then [] 
 else x::countdown(x-1)


fun append(x: int list, y: int list)=
 if null x
 then y
 else hd x::(append(tl x,y))


fun sum_pair_list(xs: (int * int) list)=
 if null xs
 then 0
 else  #2(hd xs) + #1(hd xs) + sum_pair_list(tl xs)

fun firsts(xs: (int *int) list)=
 if null xs
 then []
 else #1(hd xs)::firsts(tl xs)


fun seconds(xs: (int *int) list)=
 if null xs
 then []
 else #1(hd xs)::seconds(tl xs)

fun sum_pair_list2(xs: (int * int) list)=
	sum_list(firsts(xs))+sum_list(seconds(xs))