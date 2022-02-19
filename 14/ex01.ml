(* 目的：受け取った整数が偶数かどうか判定する *)
(* is_even : int -> bool *)
let is_even n = if n mod 2 = 0 then true else false

(* テスト *)
let test1 = is_even 0 = true
let test2 = is_even 1 = false
let test3 = is_even (-2) = true
let test4 = is_even 4 = true

(* 目的：整数のリストを受け取ったら、その中の偶数の要素のみを含むリストを返す *)
(* even : int list -> int list *)
let rec even lst = List.filter is_even lst

(* テスト *)
let test5 = even [] = []
let test6 = even [ 1 ] = []
let test7 = even [ 1; 3; 5; 7 ] = []
let test8 = even [ 2; 3; 6; 7; 9; 14; 15 ] = [ 2; 6; 14 ]
let test9 = even [ 2; 4; 16; 24; 30 ] = [ 2; 4; 16; 24; 30 ]
