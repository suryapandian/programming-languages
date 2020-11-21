(*fun count(from: int, to: int)=
	if from=to
	then to::[]
	else from::count(from+1, to)*)

(*fun count_up(x: int)=
	count(1,x)*)

fun count_up_with_let(x: int)=
	let
		fun count(from: int)=
			if from=x
			then x::[]
			else from::count(from+1)
	in
		count(1)
	end
	