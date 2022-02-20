(* 目的：m >= n >= 0 なる二つの自然数を受け取ると、その最大公約数を返す。 *)
(* gcd : int -> int -> int *)
let rec gcd m n = if n = 0 then m else gcd n (m mod n)

(* 再帰のたびに n の値が小さくなっているので、いずれ 0 になり停止する *)

(* テスト *)
let test1 = gcd 0 0 = 0
let test2 = gcd 4 0 = 4
let test3 = gcd 3 2 = 1
let test4 = gcd 42 28 = 14
let test5 = gcd 156 34 = 2
