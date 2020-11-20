(*THIS IS A comment*);

val x = 34; (*Variable bindings*)

val y = 17;

val abs_of_x = if x < 0 then 0-x else x ;

val abs_of_x_simpler = abs x;

val arr = [1,2];
(*THIS IS A list(array)*);

fun pow(x : int, y : int) = 
	if y = 0
	then 1
	else x * pow(x,y-1)

fun cube(x : int) = x * x * x

fun cubeUsingpow(x : int) = 
	pow(x,3)