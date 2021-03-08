fun same_string(s1 : string, s2 : string) =
    s1 = s2

fun all_except_option (str: string, str_list: string list) =
    let 

      fun aux(_, str,[]) = NONE
        | aux(xs,str,y::ys) = if same_string(str,y) then SOME (xs@ys) else aux(y::xs, str,ys)
    in
       
        aux([],str,str_list)
    end


fun get_substitutions1 ([], _) = []
  | get_substitutions1(x::[],str) =  (case all_except_option(str,x) of
                        SOME lst => lst
                      | NONE => [])
  | get_substitutions1(x::xs,str) = get_substitutions1([x],str) @ get_substitutions1(xs,str)


fun get_substitutions2 (list_str_list: string list list, str: string) =
  let
    fun aux(list_str_list, str, acc) =
      case list_str_list of
       [] => acc
      | x::xs => aux(xs, str, (acc @ (case all_except_option(str,x) of
                              SOME lst => lst
                            | NONE => [])))
  in
    aux(list_str_list,str,[])
  end


fun similar_names(list_str_list,{first=x,middle=y,last=z})=
  let
    fun aux([],_,_,result)=result
      | aux(xs::ys,middle_name, last_name, result) = aux(ys,middle_name,last_name,{first=xs,middle=middle_name,last=last_name}::result)

  in
     aux(get_substitutions2(list_str_list,x ),y,z,[{first=x,middle=y,last=z}])
  end


(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

fun card_color(Clubs,_)=Black
  | card_color(Spades,_)=Black
  | card_color(Hearts,_)=Red
  | card_color(Diamonds,_)=Red


fun card_value(_,Ace)=11
  | card_value(_, Num x) = x
  | card_value(_,_)= 10


fun remove_card(cs: card list, a: card, ex: exn)=
  let

    fun aux(cs: card list, a: card, result: card list)=
      case (cs,a,result) of
        ([],_,result) => result
        | (c::s,a,result) => if c=a then result @ s else aux(s,a,c::result)

    val result = aux(cs,a,[])
      
  in
    case (cs,result) of
      (c::[],[])  => if c=a then result else raise ex
      | (_, []) => raise ex
      | (cs,x) => if x=cs then raise ex else x
  end


fun all_same_color(cs: card list)=
    case (cs) of
     x::xs::y => card_color(x)=card_color(xs) andalso all_same_color(xs::y) 
    | _ => true

fun sum_cards(cs: card list)=
  let
    fun aux(cs: card list, sum: int)=
      case cs of
        [] => sum
        | x::xs => aux(xs, sum+card_value(x))
  in
    aux(cs,0)
  end


fun score(cs: card list, goal: int)=
  let

    fun preliminary_score(sum: int, goal: int)=
      if sum > goal then 3*(sum-goal) else goal-sum
    
    val pre_score = preliminary_score(sum_cards(cs), goal)

  in
    if all_same_color(cs) then (pre_score div 2) else pre_score 
  end


fun officiate(cs: card list, mv: move list,goal: int)=
  let
    fun aux(cs: card list, hc: card list,mv: move list, goal: int)=
      if sum_cards(hc) > goal 
      then hc
      else (case (cs, mv,hc) of
               (_,[],hs) => hs
              | ([],Draw::ms,hs) => hs
              |(cs,(Discard x)::ms,hs) => aux(cs,remove_card(hs,x,IllegalMove),ms,goal) 
              |(c::cs,Draw::ms,hs) => aux(cs,c::hs,ms,goal))
    
    val final_hc = aux(cs,[],mv,goal) 
  in
    score(final_hc,goal)
  end