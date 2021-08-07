fun only_capitals (str_list : string list)=
	List.filter (fn s => Char.isUpper(String.sub(s,0))) str_list

fun longest_string1(str_list: string list)=
	List.foldl (fn (s1,s2) => if String.size(s2)<String.size(s1) then s1 else s2) "" str_list


fun longest_string2(str_list: string list)=
	List.foldl (fn (s1,s2) => if String.size(s1)>=String.size(s2) then s1 else s2) "" str_list

fun longest_string_helper f =
	List.foldl (fn(s1,s2) => if f(String.size(s1),String.size(s2)) then s1 else s2) "" 

val longest_string3 = longest_string_helper (fn (s1,s2) => s2<s1 ) 

val longest_string4 = longest_string_helper (fn (s1,s2) => s1>=s2) 

val longest_capitalized = (longest_string1 o only_capitals) 

val rev_string = (String.implode o List.rev o String.explode)

exception NoAnswer

fun first_answer f a_list = 
	case a_list of
		[] => raise NoAnswer
		| x::xs => (case f(x) of
                        SOME lst => lst
                      | NONE => first_answer f xs)

fun all_answers f a_list =
	let
		fun aux(acc, b_list) =
			case b_list of
				[] => SOME acc
				| x::xs => (case f(x) of
                        SOME lst => aux(lst@acc,xs)
                      | NONE => NONE)
	in
		aux([],a_list)
	end
	
datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

val count_wildcards = g (fn () => 1) (fn _ => 0)

val count_wild_and_variable_lengths = g (fn () => 1) (fn z => String.size(z))

fun count_some_var(str,p) = g (fn ()=> 0) (fn z => if str=z then 1 else 0) p

fun check_pat p=
	let
		fun get_strings(p,acc)=
			case p of
			   Variable x        => x::acc
			  | TupleP ps         => List.foldl (fn (p,acc) => get_strings(p,acc)) acc ps
			  | ConstructorP(_,p) => get_strings(p,acc)
			  | _                 => acc

		fun has_duplicate(str_list: string list)=
			case str_list of
				[] => false
				| x::xs => List.exists (fn str => x=str) xs
    
		val all_strings = get_strings(p,[])
	in
		not(has_duplicate(all_strings))
	end

fun match(v, p)=
	case (v,p) of
	  (_, Wildcard) => SOME []
	 | (v, Variable x) => SOME [(x,v)]
	 | (Unit, UnitP) => SOME []
	 | (Const y, ConstP x) => if x=y then SOME [] else NONE
	 | (Constructor (s1,va), ConstructorP(s2,pa)) => if s1=s2 then match(va,pa) else NONE
	 | (Tuple vu, TupleP ps) => if List.length ps = List.length vu 
	 							then all_answers (fn (vu1,ps1) => match(vu1,ps1)) (ListPair.zip(vu,ps))
	 							else NONE
	 | _ => NONE


fun first_match v p=
	(SOME (first_answer (fn x => match(v,x)) p) ) handle NoAnswer => NONE

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)