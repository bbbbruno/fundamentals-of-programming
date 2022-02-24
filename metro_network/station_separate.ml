open Station

(* 駅の例 *)
let station1 = { name = "池袋"; shortest_distance = infinity; station_names = [] }

let station2 =
  { name = "新大塚"; shortest_distance = 1.2; station_names = [ "新大塚"; "茗荷谷" ] }

let station3 =
  { name = "後楽園"; shortest_distance = 1.8; station_names = [ "後楽園"; "茗荷谷" ] }

let station4 =
  { name = "本郷三丁目"; shortest_distance = infinity; station_names = [] }

let station5 =
  { name = "御茶ノ水"; shortest_distance = infinity; station_names = [] }

(* 最短距離最小の駅の候補とその駅以外からなるリストを受け取ると、「最短距離最小の駅」と「最短距離最小の駅以外からなるリスト」の組を返す *)
(* separate_shortest : station_t list -> station_t * station_t list *)
let rec separate_shortest p lst =
  List.fold_right
    (fun st (p, v) ->
      if st.shortest_distance < p.shortest_distance then (st, p :: v)
      else (p, st :: v))
    lst (p, [])

(* 駅リストの例 *)
let station_list = [ station2; station3; station4; station5 ]

(* テスト *)
let test1 =
  separate_shortest station1 station_list
  = (station2, [ station3; station1; station4; station5 ])
