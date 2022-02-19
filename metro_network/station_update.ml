(* 最短経路における頂点である駅ひとつ分の情報を表す型 *)
type station_t = {
  name : string; (* 駅名（漢字） *)
  shortest_distance : float; (* 最短距離 *)
  station_names : string list; (* 手間の駅名のリスト *)
}

(* 駅の例 *)
let station1 = { name = "池袋"; shortest_distance = infinity; station_names = [] }

let station2 =
  { name = "新大塚"; shortest_distance = 1.2; station_names = [ "新大塚"; "茗荷谷" ] }

let station3 =
  { name = "茗荷谷"; shortest_distance = 0.; station_names = [ "茗荷谷" ] }

let station4 =
  { name = "後楽園"; shortest_distance = 1.8; station_names = [ "後楽園"; "茗荷谷" ] }

let station5 =
  { name = "本郷三丁目"; shortest_distance = infinity; station_names = [] }

let station6 =
  { name = "御茶ノ水"; shortest_distance = infinity; station_names = [] }

(* 駅リストの例 *)
let station_list =
  [ station1; station2; station3; station4; station5; station6 ]

(* 目的：直前に確定した駅pと未確定の駅のリストvを受け取ると、必要な更新処理を行なった後の未確定の駅のリストを返す *)
(* updates : station_t -> station_t list -> station_t list *)
let updates p v =
  List.map
    (fun q ->
      let d =
        get_station_distance p.name q.name global_station_connection_list
      in
      if d = infinity then q
      else if p.shortest_distance +. d < q.shortest_distance then
        {
          name = q.name;
          shortest_distance = p.shortest_distance +. d;
          station_names = q.name :: p.station_names;
        }
      else q)
    v

(* テスト *)
let test1 = updates station2 [] = []

let test2 =
  updates station2 [ station1; station4; station5; station6 ]
  = [
      {
        name = "池袋";
        shortest_distance = 3.0;
        station_names = [ "池袋"; "新大塚"; "茗荷谷" ];
      };
      station4;
      station5;
      station6;
    ]
