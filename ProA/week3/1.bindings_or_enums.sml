(*ENUMS*)
datatype mytype = TwoInts of (int * int )
	| Str of string
	| Pizza

val a = Str "hi"
val b = Str
val c = Pizza
val d = TwoInts(2,45)
val e = a



fun f(x : mytype) = 
	case x of
		  Pizza => 3
		| Str s => 10
		| TwoInts(i1,i2) => i1 + i2;



f (Pizza);
f (Str("sur"));

f (TwoInts(7,3));

datatype exp = 
	Constant of int 
	| Negate of exp
	| Add of exp * exp
	| Multiply of exp * exp

fun eval e = 
	case e of 
		  Constant i => i
		| Negate e2 => ~ (eval e2)
		| Add(e1, e2) => (eval e1) + (eval e2)
		| Multiply(e1, e2) => (eval e1) * (eval e2);

eval(Constant 5);
eval(Negate(Constant 9));
eval(Add(Constant 9, Constant 4));
eval(Add(Add(Constant 8, Constant 6), Multiply(Constant 6,Constant 7)));

fun number_of_adds e =
	case e of 
		Constant i => 0
		| Negate(e1) => number_of_adds e1
		| Add(e1,e2) => 1 + number_of_adds e1 + number_of_adds e2
		| Multiply(e1, e2) => number_of_adds e1 + number_of_adds e2;

val numAdd = number_of_adds(Add(Add(Constant 8, Constant 6), Multiply(Constant 6,Constant 7)));
