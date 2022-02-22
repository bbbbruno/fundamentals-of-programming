(* 八百屋においてある野菜と値段のリストの例 *)
let vegetable_shop =
  [ ("トマト", 300); ("たまねぎ", 200); ("にんじん", 150); ("ほうれん草", 200) ]

(* 目的：itemの値段を調べる *)
(* price : string -> (string * int) list -> int *)
let rec get_price item0 lst =
  match lst with
  | [] -> None
  | (item, price) :: rest ->
      if item = item0 then Some price else get_price item0 rest

(* 目的：野菜のリストと八百屋のリストを受け取ると、八百屋にはおいていない野菜の数を返す。 *)
(* count_sold_vegetable : string list -> (string * int) list -> int *)
let count_soldout_vegetables lst shop =
  List.fold_left
    (fun count item -> if get_price item shop = None then count + 1 else count)
    0 lst

(* テスト *)

let test1 = count_soldout_vegetables [ "たまねぎ"; "にんじん" ] vegetable_shop = 0

let test2 =
  count_soldout_vegetables [ "たまねぎ"; "じゃがいも"; "にんじん" ] vegetable_shop = 1

let test3 = count_soldout_vegetables [ "しいたけ"; "なす"; "にんじん" ] vegetable_shop = 2
