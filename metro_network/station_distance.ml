(* ローマ字の駅名と駅リスト（station_t型）を与えると、その駅の漢字表記を返す *)
(* alphabet_to_kangi : string -> station_name_t list -> string *)
let rec alphabet_to_kangi alph lst =
  match lst with
  | [] -> ""
  | { kanji = n; hiragana = h; alphabet = a; line = l } :: rest ->
      if alph = a then n else alphabet_to_kangi alph rest

(* テスト *)
let test1 = alphabet_to_kangi "myogadani" global_station_name_list = "茗荷谷"
let test2 = alphabet_to_kangi "shibuya" global_station_name_list = "渋谷"
let test3 = alphabet_to_kangi "otemachi" global_station_name_list = "大手町"

(* 目的：漢字の駅名二つと駅間の木を与えると、その２駅間の距離を返す *)
(* get_station_distance : string -> string -> station_connection_tree_t -> int *)
let rec get_station_distance k1 k2 tree =
  match tree with
  | Empty -> infinity
  | Node (t1, name, lst, t2) ->
      if k1 < name then get_station_distance k1 k2 t1
      else if k1 > name then get_station_distance k1 k2 t2
      else assoc k2 lst

(* テスト *)
let test1 =
  get_station_distance "茗荷谷" "新大塚" global_station_connection_tree = 1.2

let test2 =
  get_station_distance "茗荷谷" "池袋" global_station_connection_tree = infinity

let test3 = get_station_distance "東京" "大手町" global_station_connection_tree = 0.6

(* 目的：ふたつの駅の間の距離を文字列で表現する *)
(* display_station_distance : string -> string -> string *)
let display_station_distance a1 a2 =
  let k1 = alphabet_to_kangi a1 global_station_name_list in
  if k1 = "" then a1 ^ " という駅は存在しません"
  else
    let k2 = alphabet_to_kangi a2 global_station_name_list in
    if k2 = "" then a2 ^ " という駅は存在しません"
    else
      let d = get_station_distance k1 k2 global_station_connection_tree in
      if d = infinity then k1 ^ "と" ^ k2 ^ "はつながっていません"
      else k1 ^ "から" ^ k2 ^ "までは " ^ string_of_float d ^ " キロです"

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
