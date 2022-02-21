(* 関数 f と初期値 init, そしてリスト lst を受け取ると、init からはじめてリストの要素に左から順に f を施し込む。 *)
(* ここで result はここまでの f を施していった結果 *)
(* fold_left : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a *)
let rec fold_left f init lst =
  match lst with [] -> init | first :: rest -> fold_left f (f init first) rest

(* テスト *)
let test1 = fold_left ( - ) 0 [] = 0
let test2 = fold_left ( - ) 10 [ 4; 1; 3 ] = 2
let test3 = fold_left (fun lst a -> a :: lst) [] [ 1; 2; 3; 4 ] = [ 4; 3; 2; 1 ]
