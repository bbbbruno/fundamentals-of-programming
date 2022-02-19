(* 最短経路における頂点である駅ひとつ分の情報を表す型 *)
type station_t = {
  name : string; (* 駅名（漢字） *)
  shortest_distance : float; (* 最短距離 *)
  station_names : string list; (* 手間の駅名のリスト *)
}

(* 駅の例 *)
let station1 = { name = "池袋"; shortest_distance = infinity; station_names = [] }

let station2 =
  { name = "新大塚"; shortest_distance = infinity; station_names = [] }

let station3 =
  { name = "茗荷谷"; shortest_distance = 0.; station_names = [ "茗荷谷" ] }

let station4 =
  { name = "後楽園"; shortest_distance = infinity; station_names = [] }

let station5 =
  { name = "本郷三丁目"; shortest_distance = infinity; station_names = [] }

let station6 =
  { name = "御茶ノ水"; shortest_distance = infinity; station_names = [] }

(* 駅リストの例 *)
let station_list =
  [ station1; station2; station3; station4; station5; station6 ]

(* 目的：p と q の二つの駅を受け取り、直接つながっている場合必要に応じてqの最短距離と手前リストを更新する *)
(* update : station_t -> station_t -> station_t *)
let update p q =
  match (p, q) with
  | ( { name = pn; shortest_distance = psd; station_names = psn },
      { name = qn; shortest_distance = qsd; station_names = qsn } ) ->
      let d = get_station_distance pn qn global_station_connection_list in
      if d = infinity then q
      else if psd +. d < qsd then
        { name = qn; shortest_distance = psd +. d; station_names = qn :: psn }
      else q

(* テスト *)
let test1 = update station3 station1 = station1

let test2 =
  update station3 station2
  = { name = "新大塚"; shortest_distance = 1.2; station_names = [ "新大塚"; "茗荷谷" ] }

let test3 =
  update station3 station4
  = { name = "後楽園"; shortest_distance = 1.8; station_names = [ "後楽園"; "茗荷谷" ] }

let test4 = update station3 station5 = station5
let test5 = update station3 station6 = station6

let station2 =
  { name = "新大塚"; shortest_distance = 1.2; station_names = [ "新大塚"; "茗荷谷" ] }

let station4 =
  { name = "後楽園"; shortest_distance = 1.8; station_names = [ "後楽園"; "茗荷谷" ] }

let test6 =
  update station2 station1
  = {
      name = "池袋";
      shortest_distance = 3.0;
      station_names = [ "池袋"; "新大塚"; "茗荷谷" ];
    }

let test7 = update station2 station4 = station4
let test8 = update station2 station5 = station5
let test9 = update station2 station6 = station6

(* 目的：直前に確定した駅pと未確定の駅のリストvを受け取ると、必要な更新処理を行なった後の未確定の駅のリストを返す *)
(* updates : station_t -> station_t list -> station_t list *)
let updates p v = List.map (update p) v

(* テスト *)
let test10 = updates station2 [] = []

let test11 =
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
