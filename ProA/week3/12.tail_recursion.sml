(*tail recursion does not have stack trace, since the end of the stack gives the result*)

(*huge stack trace*)
fun fact1 n = if n=0 then 1 else n * fact1(n-1)

(*very minimal stack trace*)
fun fact2 n =
    let fun aux(n,acc) = if n=0 then acc else aux(n-1,acc*n)
    in
        aux(n,1)
    end


(*recursion for sum*)
fun sum1 xs =
    case xs of
        [] => 0
      | i::xs' => i + sum1 xs'

(*tail recursion for sum*)
fun sum2 xs =
    let fun f (xs,acc) =
            case xs of
                [] => acc
              | i::xs' => f(xs',i+acc)
    in
        f(xs,0)
    end


(*recursion for rev*)
fun rev1 xs =
   case xs of
       [] => []
     | x::xs' => (rev1 xs') @ [x]


(*tail recursion for rev*)
fun rev2 xs =
    let fun aux(xs,acc) =
            case xs of
                [] => acc
              | x::xs' => aux(xs', x::acc)
    in
        aux(xs,[])
    end