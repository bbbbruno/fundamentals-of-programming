open RedBlack

exception No_such_station of string

(* ローマ字の駅名と駅リスト（station_t型）を与えると、その駅の漢字表記を返す *)
(* alphabet_to_kangi : string -> station_name_t list -> string *)
let rec alphabet_to_kangi alph lst =
  match lst with
  | [] -> raise (No_such_station alph)
  | first :: rest ->
      if alph = first.alphabet then first.kanji else alphabet_to_kangi alph rest

(* テスト *)
let test1 = alphabet_to_kangi "myogadani" global_station_name_list = "茗荷谷"
let test2 = alphabet_to_kangi "shibuya" global_station_name_list = "渋谷"
let test3 = alphabet_to_kangi "otemachi" global_station_name_list = "大手町"

(* let test4 = alphabet_to_kangi "osaka" global_station_name_list *)
(* No_such_station "osaka" を起こす *)

(* 目的：漢字の駅名二つと駅間の木を与えると、その２駅間の距離を返す *)
(* 見つからなかったら例外Not_foundを起こす *)
(* get_station_distance : string -> string -> RedBlack.t -> int *)
let get_station_distance k1 k2 tree = List.assoc k2 (search tree k1)

(* テスト *)

let test1 =
  get_station_distance "茗荷谷" "新大塚" global_station_connection_tree = 1.2

(* let test2 = get_station_distance "茗荷谷" "池袋" global_global_station_connection_tree *)
(* Not_foundを起こす *)

let test3 = get_station_distance "東京" "大手町" global_station_connection_tree = 0.6

(* 目的：ふたつの駅の間の距離を文字列で表現する *)
(* display_station_distance : string -> string -> string *)
let display_station_distance a1 a2 =
  try
    let k1 = alphabet_to_kangi a1 global_station_name_list in
    let k2 = alphabet_to_kangi a2 global_station_name_list in
    try
      let d = get_station_distance k1 k2 global_station_connection_tree in
      k1 ^ "から" ^ k2 ^ "までは " ^ string_of_float d ^ " キロです"
    with Not_found -> k1 ^ "と" ^ k2 ^ "はつながっていません"
  with No_such_station a -> a ^ " という駅は存在しません"

(* テスト *)
let test1 =
  display_station_distance "myougadani" "shinotsuka" = "myougadani という駅は存在しません"

let test1 =
  display_station_distance "myogadani" "shinotsuka" = "茗荷谷から新大塚までは 1.2 キロです"

let test1 =
  display_station_distance "myogadani" "ikebukuro" = "茗荷谷と池袋はつながっていません"

let test1 =
  display_station_distance "tokyo" "ootemachi" = "ootemachi という駅は存在しません"

let test1 = display_station_distance "tokyo" "otemachi" = "東京から大手町までは 0.6 キロです"
