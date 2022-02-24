(* 赤か黒かを示す型 *)
type color_t = Red | Black

(* 赤黒木を表す型 *)
type ('a, 'b) rb_tree_t =
  | Empty
  | Node of ('a, 'b) rb_tree_t * 'a * 'b * color_t * ('a, 'b) rb_tree_t

let empty = Empty

(* 目的：赤黒木を受け取ると、必要に応じて木を再構成する。 *)
(* balance : ('a, 'b) rb_tree_t -> ('a, 'b) rb_tree_t *)
let balance tree =
  match tree with
  | Node (Node (Node (a, xk, xv, Red, b), yk, yv, Red, c), zk, zv, Black, d)
  | Node (Node (a, xk, xv, Red, Node (b, yk, yv, Red, c)), zk, zv, Black, d)
  | Node (a, xk, xv, Black, Node (Node (b, yk, yv, Red, c), zk, zv, Red, d))
  | Node (a, xk, xv, Black, Node (b, yk, yv, Red, Node (c, zk, zv, Red, d))) ->
      Node (Node (a, xk, xv, Black, b), yk, yv, Red, Node (c, zk, zv, Black, d))
  | _ -> tree

(* 目的：赤黒木とキーと値を受け取ると、それを挿入した赤黒木を返す。 *)
(* insert : ('a, 'b) rb_tree_t -> 'a -> 'b -> ('a, 'b) rb_tree_t *)
let insert tree key value =
  let rec ins tree =
    match tree with
    | Empty -> Node (Empty, key, value, Red, Empty)
    | Node (t1, k, v, c, t2) ->
        if k = key then Node (t1, key, value, c, t2)
        else if k > key then balance (Node (ins t1, k, v, c, t2))
        else balance (Node (t1, k, v, c, ins t2))
  in
  match ins tree with
  | Empty -> assert false (* 絶対に空ではない *)
  | Node (t1, k, v, c, t2) -> Node (t1, k, v, Black, t2)

(* テスト *)
let rb_tree0 = Empty
let rb_tree1 = insert rb_tree0 10 "x"
let rb_tree2 = insert rb_tree1 13 "y"
let rb_tree3 = insert rb_tree2 15 "z"
let test1 = rb_tree1 = Node (Empty, 10, "x", Black, Empty)

let test2 =
  rb_tree2 = Node (Empty, 10, "x", Black, Node (Empty, 13, "y", Red, Empty))

let test3 =
  rb_tree3
  = Node
      ( Node (Empty, 10, "x", Black, Empty),
        13,
        "y",
        Black,
        Node (Empty, 15, "z", Black, Empty) )

(* 目的：赤黒木とキーを受け取ると、そのキーの値を返す。 *)
(* search : ('a, 'b) rb_tree -> 'a -> 'b *)
let rec search tree key =
  match tree with
  | Empty -> raise Not_found
  | Node (t1, k, v, _, t2) ->
      if k = key then v else if k > key then search t1 key else search t2 key

(* テスト *)
let rb_tree =
  Node
    ( Node (Empty, 10, "x", Black, Empty),
      13,
      "y",
      Red,
      Node (Empty, 15, "z", Black, Empty) )

let test1 = search rb_tree 10 = "x"
let test2 = search rb_tree 13 = "y"
let test3 = search rb_tree 15 = "z"
(* let test4 = search rb_tree 17 *)
(* Not_found を起こす *)
