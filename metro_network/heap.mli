type index_t
(* ヒープの添字の型 *)

type ('a, 'b) t
(* 最小値を求める値が'a型で、そのほかの付加情報が'b型であるヒープの型 *)

exception Empty
(* split_top したときにヒープが空だと raise される例外 *)

val create : int -> 'a -> 'b -> ('a, 'b) t
(* 使い方：create size key value *)
(* ヒープのサイズと'a型と'b型のダミーの値を受け取ったら、空のヒープを返す *)

val insert : ('a, 'b) t -> 'a -> 'b -> index_t * ('a, 'b) t
(* 使い方： insert heap key value *)
(* ヒープは（破壊的に）書き変わる *)

val get : ('a, 'b) t -> index_t -> 'a * 'b
(* 使い方：get heap index *)
(* ヒープのindex番目の要素を返す *)

val set : ('a, 'b) t -> index_t -> 'a -> 'b -> ('a, 'b) t
(* 使い方：set heap index key value *)
(* ヒープのindex番目の値を更新したヒープを返す *)
(* ヒープは（破壊的に）書き変わる *)

val split_top : ('a, 'b) t -> ('a * 'b) * ('a, 'b) t
(* 使い方：split top heap *)
(* 最小の値を持つものとそれを取り除いたヒープの組を返す *)
(* ヒープは（破壊的に）書き変わる *)
