(* 整数のリストを受け取ると、それまでの数の合計からなるリストを返す *)
(* ここで sum0 は これまでの数の合計 *)
(* sum_list : int list -> int list *)
let rec sum_list lst =
  let rec helper lst sum0 =
    match lst with
    | [] -> []
    | first :: rest ->
        let sum = first + sum0 in
        sum :: helper rest sum
  in
  helper lst 0

(* テスト *)
let test1 = sum_list [] = []
let test2 = sum_list [ 1 ] = [ 1 ]
let test3 = sum_list [ 3; 2; 1; 4 ] = [ 3; 5; 6; 10 ]
