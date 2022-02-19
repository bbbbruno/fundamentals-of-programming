(* 目的：文字列のリストを受け取ったら、その中の要素を前から順に全部くっつけた文字列を返す *)
(* concat : string list -> string *)
let rec concat lst = List.fold_right ( ^ ) lst ""

(* テスト *)
let test1 = concat [] = ""
let test2 = concat [ "本" ] = "本"
let test3 = concat [ "春"; "夏"; "秋"; "冬" ] = "春夏秋冬"
