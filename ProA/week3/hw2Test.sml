(*use "assignment.sml";*)

val test1 = all_except_option ("string", ["string"]) = SOME []
val test12 = all_except_option ("string", []) = NONE
val test13 = all_except_option ("good", ["great", "awesome"]) = NONE
val test14 = all_except_option ("", ["meh", "brah"]) = NONE
val test15 = all_except_option ("good", ["great", "awesome","good","wonderful"]) = SOME ["great", "awesome", "wonderful"]
(*val test15 = all_except_option2 ("good", ["great", "awesome","good","wonderful"]) = SOME ["great", "awesome", "wonderful"]*)


val test2 = get_substitutions1 ([["foo"],["there"]], "foo") = []
val test21 = get_substitutions1 ([["foo","kim"],["bless"],["there","foo","smile"]], "foo") = ["kim","there","smile"]
val test22 = get_substitutions1 ([["foo","kim","best"]],"foo") = ["kim","best"]

val test3 = get_substitutions2 ([["foo"],["there"]], "foo") = []
val test31 = get_substitutions2 ([["foo","kim"],["bless"],["there","foo","smile"]], "foo") = ["kim","there","smile"]
val test32 = get_substitutions2 ([["foo","kim","best"]],"foo") = ["kim","best"]

val test4 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]], {first="Fred", middle="W", last="Smith"}) =
	    [{first="F",last="Smith",middle="W"},
   {first="Freddie",last="Smith",middle="W"},
   {first="Fredrick",last="Smith",middle="W"},
   {first="Fred",last="Smith",middle="W"}]


val test5 = card_color (Clubs, Num 2) = Black
val test51 = card_color (Hearts, Ace) = Red
val test52 = card_color (Spades, Queen) = Black
val test53 = card_color (Diamonds, King) = Red
val test54 = card_color (Clubs, Jack) = Black

val test6 = card_value (Clubs, Num 2) = 2
val test61 = card_value (Spades, Ace) = 11
val test62 = card_value (Hearts, Queen) = 10
val test63 = card_value (Clubs, Jack) = 10

val test7 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
val test71 = remove_card ([(Hearts, Jack),(Hearts, Num 5),(Spades, Num 9)], (Hearts, Jack), IllegalMove) = [(Hearts,Num 5),(Spades,Num 9)]
val test72 = remove_card ([(Hearts, Jack),(Hearts, Num 5),(Spades, Num 9),(Hearts, Jack)], (Hearts, Jack), IllegalMove) = [(Hearts,Num 5),(Spades,Num 9),(Hearts,Jack)]
val test73 = ((remove_card ([(Hearts, Ace)], (Hearts, King), IllegalMove);false) handle IllegalMove => true)
val test74 = ((remove_card ([(Hearts, Ace), (Diamonds, Queen), (Spades, Num 5)], (Hearts, King), IllegalMove);false) handle IllegalMove => true)
val test75 = ((remove_card ([(Hearts, Ace)], (Hearts, King), IllegalMove);false) handle IllegalMove => true)

val test8 = all_same_color [(Hearts, Num 5), (Hearts, Ace)] = true
val test81 = all_same_color [(Hearts, King), (Spades, Num 3)] = false
val test82 = all_same_color [(Clubs, Queen), (Hearts, Jack)] = false
val test83 = all_same_color [(Spades, Num 2), (Clubs, Num 9)] = true
val test84 = all_same_color [(Clubs, Ace), (Diamonds, Ace),(Spades, Ace)] = false
val test85 = all_same_color [] = true
val test86 = all_same_color [(Diamonds,Queen)] = true
val test87 = all_same_color [(Clubs,Ace),(Spades,Ace),(Diamonds,Ace)] = false
val test88 = all_same_color [(Diamonds, King), (Hearts, Queen), (Spades, Num 2)] = false

val test9 = sum_cards [(Diamonds, Num 2),(Clubs, Num 6)] = 8
val test91 = sum_cards [(Clubs, Num 5),(Hearts, King)] = 15
val test92 = sum_cards [(Spades, Jack),(Diamonds, Ace)] = 21
val test93 = sum_cards [(Clubs, Num 9),(Clubs, Queen)] = 19

val test10 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4
val test101 = score ([(Hearts, Num 2),(Diamonds, Ace)],10) = 4
val test102 = score ([(Spades, Jack),(Diamonds, Num 3)],20) = 7
val test103 = score ([(Clubs, Queen),(Spades, Queen)],15) = 7

val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],42) = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],42);
               false) 
              handle IllegalMove => true)


val test14 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw,Discard (Hearts, Num 2),Draw,Discard (Clubs, Num 4),Draw,Draw,Draw], 15) = 7

val test15 = ((officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw,Discard (Hearts, Num 2),Draw,Discard (Clubs, Num 4),Discard(Hearts, Ace),Draw], 15);
               false) 
              handle IllegalMove => true)


val test16 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[], 15) = 7

val test17 = officiate ([(Spades, King),(Hearts, Num 2),(Clubs, Num 4)],[Draw,Discard (Spades, King),Draw], 15) = 6

val test18 = officiate ([(Spades, King)],[Draw,Discard (Spades, King)], 15) = 7
             