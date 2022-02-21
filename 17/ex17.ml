(* 目的：受け取った lst の中の最小値を返す *)
(* minimum : int list -> int *)
let rec minimum i lst =
  match lst with
  | [] -> i
  | first :: rest ->
      let rest_min = minimum first rest in
      if i <= rest_min then i else rest_min

(* テスト *)
let test1 = minimum 3 [] = 3
let test2 = minimum 1 [ 2 ] = 1
let test3 = minimum 3 [ 2 ] = 2
let test4 = minimum 3 [ 2; 6; 4; 1; 8 ] = 1
