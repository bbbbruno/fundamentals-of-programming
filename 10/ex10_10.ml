(* ローマ字の駅名と駅リスト（station_t型）を与えると、その駅の漢字表記を返す *)
(* alphabet_to_kangi : string -> station_t list -> string *)
let rec alphabet_to_kangi alph lst =
  match lst with
  | [] -> ""
  | { name = n; hiragana = h; alphabet = a; line = l } :: rest ->
      if alph = a then n else alphabet_to_kangi alph rest

(* テスト *)
let test1 = alphabet_to_kangi "myogadani" global_station_list = "茗荷谷"
let test2 = alphabet_to_kangi "shibuya" global_station_list = "渋谷"
let test3 = alphabet_to_kangi "otemachi" global_station_list = "大手町"
