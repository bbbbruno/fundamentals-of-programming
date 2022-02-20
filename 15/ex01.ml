(* 目的：受け取った lst をクイックソートを使って昇順に整列する *)
(* quick_sort : int list -> int list *)
let rec quick_sort lst =
  match lst with
  | [] -> []
  | first :: rest ->
      let take n lst p = List.filter (fun x -> p x n) lst in
      let take_less n lst = take first lst ( < ) in
      let take_greater n lst = take first lst ( > ) in
      let take_equal n lst = take first lst ( = ) in
      quick_sort (take_less first rest)
      @ take_equal first lst
      @ quick_sort (take_greater first rest)

(* テスト *)
let test1 = quick_sort [] = []
let test2 = quick_sort [ 1 ] = [ 1 ]
let test3 = quick_sort [ 1; 2 ] = [ 1; 2 ]
let test4 = quick_sort [ 2; 1 ] = [ 1; 2 ]
let test5 = quick_sort [ 5; 4; 9; 8; 2; 3 ] = [ 2; 3; 4; 5; 8; 9 ]
let test6 = quick_sort [ 5; 4; 9; 4; 2; 3; 2; 8 ] = [ 2; 2; 3; 4; 4; 5; 8; 9 ]
