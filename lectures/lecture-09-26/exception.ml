(* ****** ****** *)
exception Done
exception True
exception False
(* ****** ****** *)

let rec
list_mul0(xs: int list): int =
match xs with
| [] -> 1
| x1 :: xs -> x1 * list_mul0(xs)

let rec
list_mul1(xs: int list): int =
match xs with
| [] -> 1
| x1 :: xs ->
  if x1 = 0 then 0 else list_mul1(xs)

exception Zero

let rec
list_mul2(xs: int list): int =
try
match xs with
| [] -> 1
| x1 :: xs ->
  if x1 = 0 then raise Zero else list_mul2(xs)
with Zero -> 0

(* ****** ****** *)

let test0 = list_mul0[1;2;3;0;4;5]
let test1 = list_mul1[1;2;3;0;4;5]
let test2 = list_mul2[1;2;3;0;4;5]

(* ****** ****** *)

let
foreach_to_forall
( foreach
: 'xs -> ('x0 -> unit) -> unit) =
fun xs test ->
try foreach(xs)
(fun x -> if test(x) then () else raise False); true with False -> false
;;
(* ****** ****** *)

(* end of [lecture-09-26-exception.ml] *)  
