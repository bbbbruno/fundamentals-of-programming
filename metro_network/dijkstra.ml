open Redblack
open Heap
open Station_name
open Station_connection
open Station
open Station_name_sort
open Station_distance
open Station_connection_tree
open Station_update

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

(* station_t型の（未確定の）駅のリストとstation_connection_t型の駅間のリストを受け取ると、
   ダイクストラのアルゴリズムに従って各駅についての最短距離と最短経路が正しく入ったstation_t型のリストを返す *)
(* ここで v0 はまだ残っている未確定の駅のリスト *)
(* dijkstra_main : station_t list -> Redblack.t -> station_t list *)
let rec dijkstra_main heap_tree heap conn_tree =
  try
    let (_, p), rest_heap = split_top heap in
    p
    :: dijkstra_main heap_tree
         (updates p rest_heap heap_tree conn_tree)
         conn_tree
  with Empty -> []

(* 目的：station_t型のリストから与えられた名前の駅を探し出す。 *)
(* find_station : station_t list -> string -> station_t *)
let rec find_station lst name =
  match lst with
  | [] -> { name = ""; shortest_distance = infinity; station_names = [] }
  | first :: rest -> if first.name = name then first else find_station rest name

let test3 =
  find_station station_list "池袋"
  = { name = "池袋"; shortest_distance = infinity; station_names = [] }

(* 目的：始点の駅名（ローマ字の文字列）と終点の駅名（ローマ字の文字列）を受け取ると、その最短経路を求めて終点の駅を返す。 *)
(* dijkstra : string -> string -> station_t *)
let dijkstra start last =
  let station_name_list = station_ins_sort global_station_name_list in
  let start_station_kanji = alphabet_to_kangi start station_name_list in
  let last_station_kanji = alphabet_to_kangi last station_name_list in
  let heap_tree, heap =
    make_station_heap_and_initialize station_name_list start_station_kanji
  in
  let result =
    dijkstra_main heap_tree heap
      (inserts_station_connection empty global_station_connection_list)
  in
  find_station result last_station_kanji

let test4 =
  dijkstra "myogadani" "ikebukuro"
  = {
      name = "池袋";
      shortest_distance = 3.0;
      station_names = [ "池袋"; "新大塚"; "茗荷谷" ];
    }
