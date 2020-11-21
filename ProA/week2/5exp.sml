fun xilly1(x: int)=
	let 
		val z = if x > 0 then x else 7
		val y = x+z+9 
	in
		if x < y then 90 else 20
	end

fun silly()=
	let 
		val x = 2
	in
		(let val x = 1 in x+2 end) + (let val y = x+1 in y+4 end)
	end