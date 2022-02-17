(* 目的：ふたつの駅の間の距離を文字列で表現する *)
(* display_station_distance : string -> string -> string *)
let display_station_distance a1 a2 =
  let k1 = alphabet_to_kangi a1 global_station_list in
  if k1 = "" then a1 ^ " という駅は存在しません"
  else
    let k2 = alphabet_to_kangi a2 global_station_list in
    if k2 = "" then a2 ^ " という駅は存在しません"
    else
      let d = get_station_distance k1 k2 global_station_connection_list in
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
