(*max with recursion*)

fun max_list(xs: int list)=
	if null xs
	then 0
	else
		let val tl_max = max_list(tl xs)
		in 
			if tl_max > hd xs
			then tl_max
			else hd xs
		end


(*Max with options*)
fun max_with_options(xs: int list)=
	if null xs
	then NONE
	else
		let val tl_max = max_with_options(tl xs)
		in  if (isSome tl_max) andalso (valOf tl_max) > hd xs
			then tl_max
			else SOME (hd xs)
		end

fun max(xs: int list)=
	if null xs
	then NONE
	else
		let 
			fun max_nonempty(x: int list)=
				if null (tl x)
				then hd x
				else
					let val tl_max = max_nonempty(tl x)
					in  if tl_max > hd xs
						then tl_max
						else hd xs
					end
		in
			SOME (max_nonempty xs)
		end