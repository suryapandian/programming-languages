(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)


val test1 = is_older ((1,2,3),(2,3,4)) = true

val test2 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1

val test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3

val test4 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]

val test5 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]

val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"

val test7 = date_to_string (2013, 6, 1) = "June 1, 2013"

val test8 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3

val test9 = what_month 70 = 3

val test10 = month_range (31, 34) = [1,2,2,2]

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)


val n1_test1 = is_older ((2020,2,13),(2018,3,14)) = false
val n1_test2 = is_older ((2018,2,13),(2018,3,14)) = true
val n1_test3 = is_older ((2018,2,15),(2018,2,14)) = false
val n1_test4 = is_older ((2018,3,14),(2020,2,13)) = true
val n1_test5 = is_older ((2018,3,13),(2018,3,14)) = true
val n1_test6 = is_older ((2018,3,17),(2018,3,13)) = false
val n1_test7 = is_older ((2011,4,28),(2011,3,31)) = false



val n2_test1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val n2_test2 = number_in_month ([(2012,2,28),(2013,12,1)],7) = 0
val n2_test3 = number_in_month ([(2012,7,28),(2013,7,1)],7) = 2

val n3_test1 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3
val n3_test2 = number_in_months ([(2012,2,28),(2013,12,10),(2011,3,31),(2011,10,28)],[2,3,4]) = 2
val n3_test3 = number_in_months ([(2012,2,28),(2013,12,10),(2011,7,31),(2011,7,28)],[2,12,7]) = 4


val n4_test1 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val n4_test2 = dates_in_month ([(2012,7,28),(2013,12,1)],2) = []
val n4_test3 = dates_in_month ([(2012,3,28),(2013,3,1)],3) = [(2012,3,28),(2013,3,1)]
val n3_test4 = dates_in_month ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],4) = [(2011,4,28)]


val n5_test1 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]
val n5_test2 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[]) = []
val n5_test3 = dates_in_months ([],[5,3,2]) = []
val n5_test4 = dates_in_months ([(2012,2,28)],[5,3,2]) = [(2012,2,28)]
val n5_test5 = dates_in_months ([(2012,5,28),(2013,12,1),(2013,2,1)],[7,3,2]) = [(2013,2,1)]


val n6_test1 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val n6_test2 = get_nth ([], 2) = ""
val n6_test3 = get_nth (["hi", "there", "how", "are", "you"], 4) = "are"

val n7_test1 = date_to_string (2013, 6, 1) = "June 1, 2013"
val n7_test2 = date_to_string (2014, 7, 1) = "July 1, 2014"
val n7_test3 = date_to_string (2020, 3, 1) = "March 1, 2020"
val n7_test4 = date_to_string (2019, 12, 5) = "December 5, 2019"

val n8_test1 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3
val n8_test2 = number_before_reaching_sum (10, [10,20,30,40,50]) = 0
val n8_test3 = number_before_reaching_sum (13, [1,2,3,4,5,10]) = 4
val n8_test4 = number_before_reaching_sum (7, [1,2,3,4,5]) = 3
val n8_test4 = number_before_reaching_sum (1, [10,2,3,4,5]) = 0

val n9_test1 = what_month 70 = 3
val n9_test2 = what_month 59 = 2
val n9_test3 = what_month 331 = 11
val n9_test4 = what_month 365 = 12
val n9_test5 = what_month 14 = 1
val n9_test6 = what_month 900 = 0

val n10_test1 = month_range (31, 34) = [1,2,2,2]
val n10_test2 = month_range (72, 84) = [3,3,3,3,3,3,3,3,3,3,3,3,3]
val n10_test3 = month_range (356, 360) = [12,12,12,12,12] 
val n10_test4 = month_range (370, 390) = []


val n11_test1 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val n11_test2 = oldest([(2002,2,28),(2011,3,31),(2011,4,28)]) = SOME (2002,2,28)
val n11_test3 = oldest([(2002,2,28),(2002,3,31),(2002,4,28)]) = SOME (2002,2,28)
val n11_test4 = oldest([(2012,3,28),(2012,3,31),(2012,3,28)]) = SOME (2012,3,28)
val n11_test5 = oldest([]) = NONE


