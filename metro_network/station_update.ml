open Station
open Station_connection_tree
open Station_distance
open Redblack
open Heap

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
let updates p heap heap_tree conn_tree =
  let lst = search conn_tree p.name in
  List.fold_right
    (fun (name, distance) result ->
      let idx = search heap_tree name in
      try
        let _, q = get heap idx in
        if p.shortest_distance +. distance < q.shortest_distance then
          let d =
            Float.round ((p.shortest_distance +. distance) *. 10.) /. 10.
          in
          let heap =
            set result idx d
              {
                name = q.name;
                shortest_distance = d;
                station_names = q.name :: p.station_names;
              }
          in
          heap
        else result
      with Not_found -> result)
    lst heap
