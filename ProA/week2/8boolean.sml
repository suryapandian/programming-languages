(*We do not need andalso orelse not*)

(*e1 andalso e2*)
if e1
then e2
else false

(*e1 orelse e2*)
if e1
then true
else e2

(*not e1*)
if e1
then true
else false