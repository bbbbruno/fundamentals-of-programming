(* ヒープの添字の型 *)
type index_t = int ref

(* 最小値を求める値が'aで、その他の付加情報が'b型であるヒープの型 *)
type ('a, 'b) t = int ref * (int ref * 'a * 'b) array

(* split_top したときにヒープが空だと raise される例外 *)
exception Empty

(* 目的：ヒープのサイズと'a型と'b型のダミーの値を受け取ったら、空のヒープを返す *)
(* create : int -> 'a -> 'b -> ('a, 'b) t *)
let create size key value = (ref 0, Array.make size (ref (-1), key, value))

let test1 =
  create 5 0 ""
  = ( ref 0,
      [|
        (ref (-1), 0, "");
        (ref (-1), 0, "");
        (ref (-1), 0, "");
        (ref (-1), 0, "");
        (ref (-1), 0, "");
      |] )

(* 目的：与えられた配列内の二つの場所を入れ替える。 *)
(* swap : ('a 'b) array -> int -> int -> unit *)
let swap array index parent_index =
  let ((idx, _, _) as entry) = array.(index) in
  let ((p_idx, _, _) as parent_entry) = array.(parent_index) in
  array.(index) <- parent_entry;
  array.(parent_index) <- entry;
  idx := parent_index;
  p_idx := index;
  ()

(* 目的：ヒープの条件を満たすまで上方向へ入れ替え操作を行い、入れ替え後のインデックス番号を返す。 *)
(* adjust_up : ('a, 'b) array -> int ref -> unit *)
let rec adjust_up array index_ref =
  let index = !index_ref in
  if index = 0 then ()
  else
    let parent_index = (index - 1) / 2 in
    let _, k, _ = array.(index) in
    let _, pk, _ = array.(parent_index) in
    if pk <= k then ()
    else (
      swap array index parent_index;
      index_ref := parent_index;
      adjust_up array index_ref)

(* 目的：ヒープの条件を満たすまで下方向へ入れ替え操作を行う。 *)
(* adjust_down : int -> ('a, 'b) array -> int ref -> unit *)
let rec adjust_down len array index_ref =
  let index = !index_ref in
  if index > len - 1 then ()
  else
    let _, k, _ = array.(index) in
    let child_index1 = (2 * index) + 1 in
    if child_index1 > len - 1 then ()
    else
      let _, ck1, _ = array.(child_index1) in
      let child_index2 = child_index1 + 1 in
      if child_index2 > len - 1 then
        if k <= ck1 then ()
        else (
          swap array child_index1 index;
          index_ref := child_index1;
          adjust_down len array index_ref)
      else
        let _, ck2, _ = array.(child_index2) in
        if k <= ck1 && k <= ck2 then ()
        else
          let child_index = if ck1 <= ck2 then child_index1 else child_index2 in
          swap array child_index index;
          index_ref := child_index;
          adjust_down len array index_ref

(* 目的：ヒープにキーと値を挿入して、挿入した要素のインデックス番号とヒープを返す *)
(* insert : ('a, 'b) t -> 'a -> 'b -> index_t * ('a, 'b) t *)
let insert (len_ref, array) key value =
  let index_ref = ref !len_ref in
  array.(!index_ref) <- (index_ref, key, value);
  len_ref := !len_ref + 1;
  adjust_up array index_ref;
  (index_ref, (len_ref, array))

(* テスト *)
let init = create 5 0 ""

let heap1 =
  ( ref 1,
    [|
      (ref 0, 7, "test1");
      (ref (-1), 0, "");
      (ref (-1), 0, "");
      (ref (-1), 0, "");
      (ref (-1), 0, "");
    |] )

let test2 = insert init 7 "test1" = (ref 0, heap1)

let heap2 =
  ( ref 2,
    [|
      (ref 0, 2, "test2");
      (ref 1, 7, "test1");
      (ref (-1), 0, "");
      (ref (-1), 0, "");
      (ref (-1), 0, "");
    |] )

let test3 = insert heap1 2 "test2" = (ref 0, heap2)

let heap3 =
  ( ref 3,
    [|
      (ref 0, 2, "test2");
      (ref 1, 7, "test1");
      (ref 2, 5, "test3");
      (ref (-1), 0, "");
      (ref (-1), 0, "");
    |] )

let test4 = insert heap2 5 "test3" = (ref 2, heap3)

let heap4 =
  ( ref 4,
    [|
      (ref 0, 2, "test2");
      (ref 1, 3, "test4");
      (ref 2, 5, "test3");
      (ref 3, 7, "test1");
      (ref (-1), 0, "");
    |] )

let test5 = insert heap3 3 "test4" = (ref 1, heap4)

(* 目的：ヒープのindex番目の要素を返す *)
(* get : ('a, 'b) t -> index_t -> int ref * 'a * 'b *)
let get (len_ref, array) index_ref =
  if !index_ref < 0 || !index_ref > !len_ref - 1 then raise Not_found
  else
    let _, k, v = array.(!index_ref) in
    (k, v)

(* テスト *)
let test6 = get heap4 (ref 2) = (5, "test3")

(* 目的：ヒープのindex番目の値を更新したヒープを返す *)
(* set : ('a, 'b) t -> index_t -> 'a -> 'b -> ('a, 'b) t *)
let set (len_ref, array) index_ref key value =
  let _, k, _ = array.(!index_ref) in
  array.(!index_ref) <- (index_ref, key, value);
  if key > k then adjust_down !len_ref array index_ref
  else adjust_up array index_ref;
  (len_ref, array)

(* テスト *)
let heap5 =
  ( ref 4,
    [|
      (ref 0, 1, "test5");
      (ref 1, 3, "test4");
      (ref 2, 2, "test2");
      (ref 3, 7, "test1");
      (ref (-1), 0, "");
    |] )

let test7 = set heap4 (ref 2) 1 "test5" = heap5

let heap6 =
  ( ref 4,
    [|
      (ref 0, 1, "test5");
      (ref 1, 3, "test4");
      (ref 2, 2, "test2");
      (ref 3, 7, "test1");
      (ref 4, 4, "test6");
    |] )

let test8 = set heap5 (ref 4) 4 "test6" = heap6

(* 最小の値を持つものとそれを取り除いたヒープの組を返す *)
(* split_top : ('a, 'b) t -> ('a * 'b) * ('a, 'b) t *)
let split_top (len_ref, array) =
  if !len_ref = 0 then raise Empty
  else
    let idx, k, v = array.(0) in
    len_ref := !len_ref - 1;
    array.(0) <- array.(!len_ref);
    adjust_down !len_ref array (ref 0);
    idx := -1;
    ((k, v), (len_ref, array))

(* テスト *)
let _, heap7 = insert heap6 4 "test7"

let heap8 =
  ( ref 4,
    [|
      (ref 0, 2, "test2");
      (ref 1, 3, "test4");
      (ref 2, 4, "test7");
      (ref 3, 7, "test1");
      (ref 2, 4, "test7");
    |] )

let test9 = split_top heap7 = ((1, "test5"), heap8)

let heap9 =
  ( ref 3,
    [|
      (ref 0, 3, "test4");
      (ref 1, 7, "test1");
      (ref 2, 4, "test7");
      (ref 1, 7, "test1");
      (ref 2, 4, "test7");
    |] )

let test10 = split_top heap8 = ((2, "test2"), heap9)
