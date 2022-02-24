(* 赤か黒かを示す型 *)
type color_t = Red | Black

(* 赤黒木を表す型 *)
type ('a, 'b) rb_tree_t =
  | Empty
  | Node of ('a, 'b) rb_tree_t * 'a * 'b * color_t * ('a, 'b) rb_tree_t

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

(* テスト *)
let rb_tree1 =
  Node
    ( Node (Node (Empty, 10, "x", Red, Empty), 13, "y", Red, Empty),
      15,
      "z",
      Black,
      Empty )

let rb_tree2 =
  Node
    ( Node (Empty, 10, "x", Red, Node (Empty, 13, "y", Red, Empty)),
      15,
      "z",
      Black,
      Empty )

let rb_tree3 =
  Node
    ( Empty,
      10,
      "x",
      Black,
      Node (Node (Empty, 13, "y", Red, Empty), 15, "z", Red, Empty) )

let rb_tree4 =
  Node
    ( Empty,
      10,
      "x",
      Black,
      Node (Empty, 13, "y", Red, Node (Empty, 15, "z", Red, Empty)) )

let rb_tree5 =
  Node
    ( Node (Empty, 10, "x", Black, Empty),
      13,
      "y",
      Red,
      Node (Empty, 15, "z", Black, Empty) )

let rb_tree6 = Empty
let test1 = balance rb_tree1 = rb_tree5
let test2 = balance rb_tree2 = rb_tree5
let test3 = balance rb_tree3 = rb_tree5
let test4 = balance rb_tree4 = rb_tree5
let test5 = balance rb_tree6 = rb_tree6
