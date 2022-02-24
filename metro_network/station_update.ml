open Station
open Station_connection_tree
open Station_distance

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
(* updates : station_t -> station_t list -> Redblack.t -> station_t list *)
let updates p v tree =
  List.map
    (fun q ->
      try
        let d = get_station_distance p.name q.name tree in
        if p.shortest_distance +. d < q.shortest_distance then
          {
            name = q.name;
            shortest_distance =
              Float.round ((p.shortest_distance +. d) *. 10.) /. 10.;
            station_names = q.name :: p.station_names;
          }
        else q
      with Not_found -> q)
    v

(* テスト *)
let test1 = updates station2 [] global_station_connection_tree = []

let test2 =
  updates station2
    [ station1; station4; station5; station6 ]
    global_station_connection_tree
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
