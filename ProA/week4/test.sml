val test11 = only_capitals ["A","B","C"] = ["A","B","C"]
val test12 = only_capitals ["sathA","923B","Cat"] = ["Cat"]
val test13 = only_capitals ["surya","B-39","Cupper"] = ["B-39","Cupper"]
val test14 = only_capitals ["Surta","opB","Woe"] = ["Surta","Woe"] 
val test15 = only_capitals ["aaAn","Bbap","Calisto"] = ["Bbap","Calisto"] 

val test21 = longest_string1 ["A","bc","C"] = "bc"
val test22 = longest_string1 ["badfffA","bc","C"] = "badfffA"
val test23 = longest_string1 ["badfffA","badfffp","C"] = "badfffA"
val test24 = longest_string1 [] = ""
val test25 = longest_string1 ["A"] = "A"

val test31 = longest_string2 ["A","bc","C"] = "bc"
val test32 = longest_string2 ["badfffA","badfffp","C"] = "badfffp"
val test34 = longest_string2 ["badfffA","bc","C"] = "badfffA"
val test34 = longest_string2 [] = ""
val test35 = longest_string2 ["A"] = "A"

val test4a1 = longest_string3 ["A","bc","C"] = "bc"
val test4a3 = longest_string3 ["badfffA","bc","C"] = "badfffA"
val test4a4 = longest_string3 ["badfffA","badfffp","C"] = "badfffA"
val test4a5 = longest_string3 [] = ""
val test4a2 = longest_string3 ["A"] = "A"

val test4b1 = longest_string4 ["A","B","C"] = "C"
val test4b2 = longest_string2 ["badfffA","badfffp","C"] = "badfffp"
val test4b3 = longest_string2 ["badfffA","bc","C"] = "badfffA"
val test4b4 = longest_string2 [] = ""
val test4b5 = longest_string2 ["A"] = "A"

val test51 = longest_capitalized ["A","bc","C"] = "A"
val test52 = longest_capitalized ["aaaA","bc","C"] = "C"
val test53 = longest_capitalized ["polkA","Bufferc","Colka"] = "Bufferc"
val test54 = longest_capitalized ["aaa","bc","c"] = ""
val test55 = longest_capitalized [] = ""

val test61 = rev_string "abc" = "cba"
val test62 = rev_string "" = ""
val test63 = rev_string "13mpod" = "dopm31"

val test71 = first_answer (fn x => if x > 3 then SOME x else NONE) [1,2,3,4,5] = 4
val test72 = first_answer (fn x => if String.size(x) > 3 then SOME x else NONE) ["a","bc","abc","abcd","abcde"] = "abcd"
val test73 = (( (first_answer (fn x => if x > 3 then SOME x else NONE) []); false) handle NoAnswer => true)
val test74 = (((first_answer (fn x => if x > 11 then SOME x else NONE) [1,2,3,4,5]); false) handle NoAnswer => true) 

val test81 = all_answers (fn x => if x = 1 then SOME [x] else NONE) [2,3,4,5,6,7] = NONE
val test82 = all_answers (fn x => if x > 1 then SOME [x] else NONE) [2,3,4,5,6,7] = SOME [7,6,5,4,3,2]
val test83 = all_answers (fn x => SOME [x, x+1]) [2, 5, 3, 4] = SOME [4,5,3,4,5,6,2,3]

val test9a1 = count_wildcards Wildcard = 1
val test9a2 = count_wildcards UnitP = 0
val test9a3 = count_wildcards (Variable("a")) = 0
val test9a4 = count_wildcards (TupleP([Variable("x"),Wildcard,Wildcard]))=2

val test9b1 = count_wild_and_variable_lengths (Variable("a")) = 1
val test9b2 = count_wild_and_variable_lengths Wildcard = 1
val test9b3 = count_wild_and_variable_lengths UnitP = 0
val test9b4 = count_wild_and_variable_lengths (TupleP([Variable("xew"),Wildcard,Wildcard]))=5

val test9c1 = count_some_var ("x", Variable("x")) = 1
val test9c2 = count_some_var ("x", Variable("k")) = 0
val test9c3 = count_some_var ("x", Wildcard) = 0
val test9c4 = count_some_var ("py", (TupleP([Variable("py"),Wildcard,Variable("py")])))=2

val test101 = check_pat (Variable("x")) = true
val test102 = check_pat (TupleP([Variable("x")])) = true
val test103 = check_pat (TupleP([Variable("x"),Wildcard,Variable("wiw"),Variable("x")])) = false

val test111 = match (Const(1), UnitP) = NONE
val test112 = match (Const(1), ConstP(1)) = SOME[]


val test12 = first_match Unit [UnitP] = SOME []
