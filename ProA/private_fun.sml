fun count_up_from(x: int) =
	let
		fun count (from : int) =
			if from=x
			then x::[]
			else from :: count(from+1, x)
	in
		count(1)
	end
	