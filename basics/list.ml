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

(* 昇順に並んでいる整数のリスト lst と整数 n を受け取ると、昇順となる位置に n を挿入したリストを返す *)
(* insert : int list -> int -> int list *)
let rec insert lst n =
  match lst with
  | [] -> [ n ]
  | first :: rest ->
      if n <= first then n :: first :: rest else first :: insert rest n

(* テスト *)
let test1 = insert [] 1 = [ 1 ]
let test2 = insert [ 5 ] 1 = [ 1; 5 ]
let test3 = insert [ 1 ] 5 = [ 1; 5 ]
let test4 = insert [ 2; 5; 5; 6 ] 5 = [ 2; 5; 5; 5; 6 ]
let test5 = insert [ -5; -3; 0; 1; 6 ] (-3) = [ -5; -3; -3; 0; 1; 6 ]

(* 整数のリストを受け取ると、それを昇順に整列したリストを返す *)
(* ins_sort : int list -> int list *)
let rec ins_sort lst =
  match lst with [] -> [] | first :: rest -> insert (ins_sort rest) first

(* テスト *)
let test1 = ins_sort [] = []
let test2 = ins_sort [ 5; 3; 8; 1; 7; 4 ] = [ 1; 3; 4; 5; 7; 8 ]
let test3 = ins_sort [ 1; -5; 6; -3; 0 ] = [ -5; -3; 0; 1; 6 ]
