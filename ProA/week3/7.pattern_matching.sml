(*Every value binding and function binding uses pattern matching
 
val bindings pattern match on execution. 
`val NONE = SOME 2;` raises a run time bind exception not compile time exception

In ML, every function takes one argument and pattern matches it.
Zero argument is the unit pattern.
*)

(*Poor style - single case expression*)
fun sum_triple1 (triple : int * int * int) =
    case triple of
      (x,y,z) => z + y + x

fun full_name1 (r : {first:string,middle:string,last:string}) =
    case r of 
        {first=x,middle=y,last=z} => x ^ " " ^ y ^ " " ^z

(*Better style*)
fun full_name2 (r : {first:string,middle:string,last:string}) =
    let val {first=x,middle=y,last=z} = r
    in
	x ^ " " ^ y ^ " " ^z
    end

fun sum_triple2 triple =
    let val (x,y,z) = triple 
    in 
        x + y + z 
    end

(*Best style - pattern match at the argument level*)
fun full_name3 {first=x,middle=y,last=z} =
    x ^ " " ^ y ^ " " ^z

fun sum_triple3 (x,y,z) =
    x + y + z

fun rotate_left (x,y,z) = (y,z,x)

fun rotate_right triple = rotate_left(rotate_left triple)