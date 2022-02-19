(* 駅名ひとつ分のデータを表す型 *)
type station_name_t = {
  name : string; (* 駅名 *)
  hiragana : string; (* ひらがなの駅名 *)
  alphabet : string; (* ローマ字の駅名 *)
  line : string; (* その駅が所属する路線名 *)
}

(* 駅名リストの例 *)

let station_name_list =
  [
    { name = "池袋"; hiragana = "いけぶくろ"; alphabet = "ikebukuro"; line = "丸ノ内線" };
    {
      name = "新大塚";
      hiragana = "しんおおつか";
      alphabet = "shinotsuka";
      line = "丸ノ内線";
    };
    { name = "茗荷谷"; hiragana = "みょうがだに"; alphabet = "myogadani"; line = "丸ノ内線" };
    { name = "後楽園"; hiragana = "こうらくえん"; alphabet = "korakuen"; line = "丸ノ内線" };
    {
      name = "本郷三丁目";
      hiragana = "ほんごうさんちょうめ";
      alphabet = "hongosanchome";
      line = "丸ノ内線";
    };
    {
      name = "御茶ノ水";
      hiragana = "おちゃのみず";
      alphabet = "ochanomizu";
      line = "丸ノ内線";
    };
  ]

(* 最短経路における頂点である駅ひとつ分の情報を表す型 *)
type station_t = {
  name : string; (* 駅名（漢字） *)
  shortest_distance : float; (* 最短距離 *)
  station_names : string list; (* 手間の駅名のリスト *)
}

(* 駅リストの例 *)

let station_list =
  [
    { name = "池袋"; shortest_distance = infinity; station_names = [] };
    { name = "新大塚"; shortest_distance = infinity; station_names = [] };
    { name = "茗荷谷"; shortest_distance = infinity; station_names = [] };
    { name = "後楽園"; shortest_distance = infinity; station_names = [] };
    { name = "本郷三丁目"; shortest_distance = infinity; station_names = [] };
    { name = "御茶ノ水"; shortest_distance = infinity; station_names = [] };
  ]

(* 目的：station_name_t型のリストを受け取ると、その駅名を使ってstation_t型のリストを作成する *)
(* make_station_list -> station_name_t list -> station_t list *)
let rec make_station_list lst =
  match lst with
  | [] -> []
  | { name = n; hiragana = h; alphabet = a; line = l } :: rest ->
      { name = n; shortest_distance = infinity; station_names = [] }
      :: make_station_list rest

(* テスト *)
let test1 = make_station_list [] = []
let test2 = make_station_list station_name_list = station_list

(* 目的：station_t型のリストに対して始点のみ初期化を行う *)
(* initialize_start_station : station_t list -> string -> station_t list *)
let rec initialize_start_station lst start =
  match lst with
  | [] -> []
  | ({ name = n; shortest_distance = sd; station_names = sn } as station)
    :: rest ->
      if n = start then
        { name = n; shortest_distance = 0.; station_names = [ n ] } :: rest
      else station :: initialize_start_station rest start

(* テスト *)
let test1 = initialize_start_station [] "茗荷谷" = []

let test2 =
  initialize_start_station station_list "茗荷谷"
  = [
      { name = "池袋"; shortest_distance = infinity; station_names = [] };
      { name = "新大塚"; shortest_distance = infinity; station_names = [] };
      { name = "茗荷谷"; shortest_distance = 0.; station_names = [ "茗荷谷" ] };
      { name = "後楽園"; shortest_distance = infinity; station_names = [] };
      { name = "本郷三丁目"; shortest_distance = infinity; station_names = [] };
      { name = "御茶ノ水"; shortest_distance = infinity; station_names = [] };
    ]
