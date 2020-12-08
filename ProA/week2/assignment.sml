fun  is_older (date1: int*int*int, date2: int*int*int) =
    if ((#1 date1) <> (#1 date2)) andalso ((#1 date1) > (#1 date2))
    then false
    else
    	if ((#1 date1) = (#1 date2)) andalso ((#2 date1) <> (#2 date2)) andalso ((#2 date1) > (#2 date2))
    	then false
    	else 
    		if ((#1 date1) = (#1 date2)) andalso ((#2 date1) = (#2 date2)) andalso ((#3 date1) > (#3 date2)) 
    	    then false
    	    else
    			true

fun number_in_month(dates : (int*int*int) list, month: int) =
 if null dates
 then 0
 else 
	if (#2 (hd dates)) = month 
	then 1+number_in_month(tl dates,month)
	else number_in_month(tl dates,month)

fun number_in_months(dates : (int*int*int) list, months: int list) =
 if null dates orelse null months
 then 0
 else 
	number_in_month(dates,hd months) + number_in_months(dates, tl months)

fun dates_in_month(dates : (int*int*int) list, month: int) = 
	if null dates
	then []
	else
		if (#2 (hd dates)) = month 
		then hd dates::(dates_in_month(tl dates,month))
		else dates_in_month(tl dates,month)

fun dates_in_months(dates : (int*int*int) list, months: int list) = 
	if null dates orelse null months
	then []
	else
		dates_in_month(dates, (hd months)) @ dates_in_months(dates, tl months)

fun get_nth(input: string list, position: int) = 
	if null input
	then ""
	else
	  if position = 1
	  then hd input
	  else 
	  	get_nth(tl input, (position - 1))


fun date_to_string(date: int*int*int) =
	let
		val mm = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
	in
		get_nth(mm,#2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
	end

fun number_before_reaching_sum(sum: int, arr: int list) = 
	if null arr
	then 0
	else
		if sum <= (hd arr)
		then 0
		else
			1+number_before_reaching_sum(sum-(hd arr), tl arr)

fun what_month(day: int) =
	if day > 365
	then 0
	else
		let
			val date_range = [31,28,31,30,31,30,31,31,30,31,30,31]
		in
			number_before_reaching_sum(day,date_range)+1
		end

fun month_range(day1: int, day2: int) =
	if day1 > day2 orelse day1>365
	then []
	else
		what_month(day1)::month_range(day1+1,day2)


fun oldest(dates: (int*int*int) list)=
	if null dates
	then NONE
	else
		let 
			val tl_old = oldest(tl dates)
		in  
			if (isSome tl_old) andalso is_older((valOf tl_old),hd dates)
			then tl_old
			else SOME (hd dates)
		end
