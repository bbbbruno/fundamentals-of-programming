open Heap

(* 目的：ヒープソートを行う *)
(* heap_sort : 'a list -> 'a list *)
let heap_sort lst =
  let len = List.length lst in
  let heap =
    List.fold_right
      (fun item result ->
        let _, heap = insert result item "" in
        heap)
      lst (create len 0 "")
  in
  List.fold_right
    (fun _ result ->
      let (k, _), _ = split_top heap in
      k :: result)
    lst []

(* テスト *)
let heap = heap_sort [ 5; 4; 9; 4; 2; 3; 2; 8 ] = [ 9; 8; 5; 4; 4; 3; 2; 2 ]
