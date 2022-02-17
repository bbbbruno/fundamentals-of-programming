(* 目的：受け取ったリスト lst の長さを求める *)
(* length : int list -> int *)
let rec length lst = match lst with [] -> 0 | first :: rest -> 1 + length rest

(* テスト *)
let test1 = length [] = 0
let test2 = length [ 3 ] = 1
let test3 = length [ 5; 6; 2; 5 ] = 4
let test4 = length [ 3; 2; 6; 7; 4; 21; 12; 43; 1; 56 ] = 10

(* 目的：整数のリストを受け取ったら、その中の偶数の要素のみを含むリストを返す *)
(* even : int list -> int list *)
let rec even lst =
  match lst with
  | [] -> []
  | first :: rest -> if first mod 2 = 0 then first :: even rest else even rest

(* テスト *)
let test1 = even [] = []
let test2 = even [ 1 ] = []
let test3 = even [ 1; 3; 5; 7 ] = []
let test4 = even [ 2; 3; 6; 7; 9; 14; 15 ] = [ 2; 6; 14 ]
let test5 = even [ 2; 4; 16; 24; 30 ] = [ 2; 4; 16; 24; 30 ]

(* 目的：文字列のリストを受け取ったら、その中の要素を前から順に全部くっつけた文字列を返す *)
(* concat : string list -> string *)
let rec concat lst =
  match lst with [] -> "" | first :: rest -> first ^ concat rest

(* テスト *)
let test1 = concat [] = ""
let test2 = concat [ "本" ] = "本"
let test3 = concat [ "春"; "夏"; "秋"; "冬" ] = "春夏秋冬"
