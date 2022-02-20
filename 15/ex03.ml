(* 目的：2 以上 n 以下の自然数のリストを受け取ると、 2 以上 n 以下の素数のリストを返す　*)
(* sieve : int list -> int list *)
let rec sieve lst =
  match lst with
  | [] -> []
  | first :: rest ->
      first :: sieve (List.filter (fun x -> x mod first <> 0) rest)

(* 再帰のたびに rest が小さくなっているので、いずれ空になり停止する *)

(* テスト *)
let test1 = sieve [ 2 ] = [ 2 ]
let test2 = sieve [ 2; 3; 4; 5 ] = [ 2; 3; 5 ]

let test3 =
  sieve [ 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15 ]
  = [ 2; 3; 5; 7; 11; 13 ]

(* 目的：2 から自然数 n までのリストを作成する　*)
let two_to_n n =
  let rec loop m = if m <= n then m :: loop (m + 1) else [] in
  loop 2

let test4 = two_to_n 10 = [ 2; 3; 4; 5; 6; 7; 8; 9; 10 ]

(* 目的：自然数 n 以下の素数を全て求める *)
(* prime : int -> int list *)
let prime n = if n < 2 then [] else sieve (two_to_n n)

(* テスト *)
let test5 = prime 1 = []
let test6 = prime 2 = [ 2 ]
let test7 = prime 10 = [ 2; 3; 5; 7 ]
let test8 = prime 30 = [ 2; 3; 5; 7; 11; 13; 17; 19; 23; 29 ]
