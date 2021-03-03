(*list and options are datatype constructors that type parameters to produce types*)

datatype 'a option = NONE | SOME of 'a
(*option for a particular type say int or string, this is how options are defined before the REPL loads*)


datatype 'a mylist = Empty | Cons of 'a * 'a mylist
(*mylist of any datatype*)


(* a fancier example for binary trees where internal nodes have data of
   any one type and leaves have data of another possibly-different type *)

datatype ('a,'b) tree = Node of 'a * ('a,'b) tree * ('a,'b) tree
		      | Leaf of 'b

(* type is (int,int) tree -> int *)
fun sum_tree tr =
    case tr of
	Leaf i => i
     | Node(i,lft,rgt) => i + sum_tree lft + sum_tree rgt

(* type is ('a,int) tree -> int *)
fun sum_leaves tr =
    case tr of
	Leaf i => i
     | Node(i,lft,rgt) => sum_leaves lft + sum_leaves rgt

(* type is ('a,'b) tree -> int *)
fun num_leaves tr =
    case tr of
	Leaf i => 1
     | Node(i,lft,rgt) => num_leaves lft + num_leaves rgt