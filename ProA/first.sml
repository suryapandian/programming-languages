(*THIS IS A comment*);

val x = 34;

val y = 17;

val x = [1,2];
(*THIS IS A list(array)*);
val abs_of_x = if x < 0 then 0-x else x ;

val abs_of_x_simpler = abs x;

fun pow(x : int, y : int) = 
	if y = 0
	then 1
	else x * pow(x,y-1)