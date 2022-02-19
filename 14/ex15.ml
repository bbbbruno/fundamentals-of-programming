(* 目的：n から 1 までリストを作る *)
(* enumerate : int -> int list *)
let rec enumerate n = if n = 0 then [] else n :: enumerate (n - 1)

(* テスト *)
let test1 = enumerate 0 = []
let test2 = enumerate 1 = [ 1 ]
let test3 = enumerate 5 = [ 5; 4; 3; 2; 1 ]

(* 目的：1から受け取った自然数までの合計を求める *)
(* one_to_n : int -> int *)
let one_to_n n = List.fold_right ( + ) (enumerate n) 0

(* テスト *)
(* テスト *)
let test7 = one_to_n 0 = 0
let test6 = one_to_n 1 = 1
let test5 = one_to_n 2 = 3
let test4 = one_to_n 10 = 55
