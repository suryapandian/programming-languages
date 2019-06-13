fun silly1 (x: int) = 
	let 
		val z = if x > 0 then x else 33
		val y = z + x + 7
	in
		if x > y then x + 2 else z
	end;


fun silly2 () = 
	let 
		val x = 1
	in
		(let val x = 2 in x+1 end) + (let val y = x+2 in y+1 end)
	end;

fun count (from : int, to : int) =
	if from=to
	then to::[]
	else from :: count(from+1, to)

fun count_up_from(x: int) =
	count(1,x)