(* 最短経路における頂点である駅ひとつ分の情報を表す型 *)
type station_t = {
  name : string; (* 駅名（漢字） *)
  shortest_distance : float; (* 最短距離 *)
  station_names : string list; (* 手間の駅名のリスト *)
}

(* 駅間の情報を表す木の型
   （漢字の）駅名と、その駅に直接つながっている駅名（駅名）とその駅までの距離の組のリスト、を格納する *)
type station_connection_tree_t =
  | Empty
  | Node of
      station_connection_tree_t
      * string
      * (string * float) list
      * station_connection_tree_t

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

(* 駅間型の木と駅間を受け取ると、その片方のデータを挿入した木を返す。 *)
(* insert : station_connection_tree_t -> string * int -> station_connection_tree_t *)
let rec insert tree start last distance =
  match tree with
  | Empty -> Node (Empty, start, [ (last, distance) ], Empty)
  | Node (t1, name, lst, t2) ->
      if start = name then Node (t1, name, (last, distance) :: lst, t2)
      else if start < name then
        Node (insert t1 start last distance, name, lst, t2)
      else Node (t1, name, lst, insert t2 start last distance)

(* 駅間型の木と駅間を受け取ると、その両方向のデータを挿入した木を返す。 *)
(* insert_station_connection : station_connection_tree_t -> station_connection_t -> station_connection_tree_t *)
let insert_station_connection tree conn =
  match conn with
  | { start_station = s; last_station = l; distance = d } ->
      insert (insert tree l s d) s l d

(* 目的：駅間型の木と駅間リストを受け取ると、リストの中の全ての駅間を挿入した木を返す。 *)
(* inserts_station_connection : station_connection_tree_t -> station_connection list -> station_connection_tree_t *)
let rec inserts_station_connection tree lst =
  List.fold_left
    (fun result item -> insert_station_connection result item)
    Empty lst

(* 最短距離最小の駅の候補とその駅以外からなるリストを受け取ると、「最短距離最小の駅」と「最短距離最小の駅以外からなるリスト」の組を返す *)
(* separate_shortest : station_t list -> station_t * station_t list *)
let rec separate_shortest p lst =
  List.fold_right
    (fun st (p, v) ->
      if st.shortest_distance < p.shortest_distance then (st, p :: v)
      else (p, st :: v))
    lst (p, [])

(* 目的：漢字の駅名二つと駅間の木を与えると、その２駅間の距離を返す *)
(* get_station_distance : string -> string -> station_connection_tree_t -> int *)
let rec get_station_distance k1 k2 tree =
  match tree with
  | Empty -> infinity
  | Node (t1, name, lst, t2) ->
      if k1 < name then get_station_distance k1 k2 t1
      else if k1 > name then get_station_distance k1 k2 t2
      else assoc k2 lst

(* 目的：直前に確定した駅pと未確定の駅のリストvを受け取ると、必要な更新処理を行なった後の未確定の駅のリストを返す *)
(* updates : station_t -> station_t list -> station_connection_t list -> station_t list *)
let updates p v lst =
  List.map
    (fun q ->
      let d = get_station_distance p.name q.name lst in
      if d = infinity then q
      else if p.shortest_distance +. Float.round d < q.shortest_distance then
        {
          name = q.name;
          shortest_distance =
            Float.round ((p.shortest_distance +. d) *. 10.) /. 10.;
          station_names = q.name :: p.station_names;
        }
      else q)
    v

(* station_t型の（未確定の）駅のリストとstation_connection_t型の駅間のリストを受け取ると、
   ダイクストラのアルゴリズムに従って各駅についての最短距離と最短経路が正しく入ったstation_t型のリストを返す *)
(* ここで v0 はまだ残っている未確定の駅のリスト *)
(* dijkstra_main : station_t list -> station_connection_t list -> station_t list *)
let rec dijkstra_main lst1 lst2 =
  match lst1 with
  | [] -> []
  | first :: rest ->
      let p, v = separate_shortest first rest in
      p :: dijkstra_main (updates p v lst2) lst2

(* 再帰のたびに v が短くなっていくので、いずれ [] になり停止する *)

(* テスト *)
let test1 =
  dijkstra_main []
    (inserts_station_connection Empty global_station_connection_list)
  = []

let test2 =
  dijkstra_main station_list
    (inserts_station_connection Empty global_station_connection_list)
  = [
      { name = "茗荷谷"; shortest_distance = 0.; station_names = [ "茗荷谷" ] };
      {
        name = "新大塚";
        shortest_distance = 1.2;
        station_names = [ "新大塚"; "茗荷谷" ];
      };
      {
        name = "後楽園";
        shortest_distance = 1.8;
        station_names = [ "後楽園"; "茗荷谷" ];
      };
      {
        name = "本郷三丁目";
        shortest_distance = 2.6;
        station_names = [ "本郷三丁目"; "後楽園"; "茗荷谷" ];
      };
      {
        name = "池袋";
        shortest_distance = 3.0;
        station_names = [ "池袋"; "新大塚"; "茗荷谷" ];
      };
      {
        name = "御茶ノ水";
        shortest_distance = 3.4;
        station_names = [ "御茶ノ水"; "本郷三丁目"; "後楽園"; "茗荷谷" ];
      };
    ]

(* 目的：昇順に並んでいるlstの正しい位置にstationを挿入する *)
(* station_insert : station_t list -> station_t -> station_t list *)
let rec station_insert lst station0 =
  match lst with
  | [] -> [ station0 ]
  | first :: rest ->
      if first.hiragana = station0.hiragana then station_insert rest station0
      else if first.hiragana < station0.hiragana then
        first :: station_insert rest station0
      else station0 :: lst

(* station_tのリストを受け取ると、それをhiraganaフィールドの順に整列しかつ重複を省いたリストを返す *)
(* station_sort : station_t list -> station_t list *)
let rec station_ins_sort lst =
  match lst with
  | [] -> []
  | first :: rest -> station_insert (station_ins_sort rest) first

(* ローマ字の駅名と駅リスト（station_name_t型）を与えると、その駅の漢字表記を返す *)
(* alphabet_to_kangi : string -> station_name_t list -> string *)
let rec alphabet_to_kangi alph lst =
  match lst with
  | [] -> ""
  | first :: rest ->
      if alph = first.alphabet then first.kanji else alphabet_to_kangi alph rest

(* 目的：station_name_t型のリストを受け取ると、その駅名を使ってstation_t型のリストを作成する *)
(* make_station_list -> station_name_t list -> station_t list *)
let rec make_station_list_and_initialize lst start =
  List.map
    (fun st ->
      if st.kanji = start then
        {
          name = st.kanji;
          shortest_distance = 0.;
          station_names = [ st.kanji ];
        }
      else { name = st.kanji; shortest_distance = infinity; station_names = [] })
    lst

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
  let station_list =
    make_station_list_and_initialize station_name_list start_station_kanji
  in
  let result =
    dijkstra_main station_list
      (inserts_station_connection Empty global_station_connection_list)
  in
  find_station result last_station_kanji

let test4 =
  dijkstra "myogadani" "ikebukuro"
  = {
      name = "池袋";
      shortest_distance = 3.0;
      station_names = [ "池袋"; "新大塚"; "茗荷谷" ];
    }
