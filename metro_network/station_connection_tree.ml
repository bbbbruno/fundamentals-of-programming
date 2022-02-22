(* 駅間の情報を表す木の型
   （漢字の）駅名と、その駅に直接つながっている駅名（駅名）とその駅までの距離の組のリスト、を格納する *)
type station_connection_tree_t =
  | Empty
  | Node of
      station_connection_tree_t
      * string
      * (string * float) list
      * station_connection_tree_t

(* 目的：駅名と、駅名と距離の組のリスト、を受け取ると、その駅までの距離を返す。 *)
(* assoc : string -> (string * float) list -> int *)
let rec assoc k lst =
  match lst with
  | [] -> raise Not_found
  | (name, distance) :: rest -> if name = k then distance else assoc k rest

(* テスト *)
(* let test1 = assoc "後楽園" [] *)
(* Not_foundを起こす *)
let test2 = assoc "後楽園" [ ("新大塚", 1.2); ("後楽園", 1.8) ] = 1.8

(* let test3 = assoc "池袋" [ ("新大塚", 1.2); ("後楽園", 1.8) ] *)
(* Not_foundを起こす *)

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

(* 駅間の例 *)
let station_connection1 =
  {
    start_station = "池袋";
    last_station = "新大塚";
    change_line = "丸ノ内線";
    distance = 1.8;
    time = 3;
  }

let station_connection2 =
  {
    start_station = "新大塚";
    last_station = "茗荷谷";
    change_line = "丸ノ内線";
    distance = 1.2;
    time = 2;
  }

let station_connection3 =
  {
    start_station = "茗荷谷";
    last_station = "後楽園";
    change_line = "丸ノ内線";
    distance = 1.8;
    time = 2;
  }

(* テスト *)
let tree1 = insert_station_connection Empty station_connection1

let test4 =
  tree1
  = Node
      ( Empty,
        "新大塚",
        [ ("池袋", 1.8) ],
        Node (Empty, "池袋", [ ("新大塚", 1.8) ], Empty) )

let tree2 = insert_station_connection tree1 station_connection2

let test5 =
  tree2
  = Node
      ( Empty,
        "新大塚",
        [ ("茗荷谷", 1.2); ("池袋", 1.8) ],
        Node
          ( Empty,
            "池袋",
            [ ("新大塚", 1.8) ],
            Node (Empty, "茗荷谷", [ ("新大塚", 1.2) ], Empty) ) )

let tree3 = insert_station_connection tree2 station_connection3

let test6 =
  tree3
  = Node
      ( Node (Empty, "後楽園", [ ("茗荷谷", 1.8) ], Empty),
        "新大塚",
        [ ("茗荷谷", 1.2); ("池袋", 1.8) ],
        Node
          ( Empty,
            "池袋",
            [ ("新大塚", 1.8) ],
            Node (Empty, "茗荷谷", [ ("後楽園", 1.8); ("新大塚", 1.2) ], Empty) ) )

(* 目的：駅間型の木と駅間リストを受け取ると、リストの中の全ての駅間を挿入した木を返す。 *)
(* inserts_station_connection : station_connection_tree_t -> station_connection list -> station_connection_tree_t *)
let rec inserts_station_connection tree lst =
  List.fold_left
    (fun result item -> insert_station_connection result item)
    Empty lst

(* テスト *)
let test1 =
  inserts_station_connection Empty
    [ station_connection1; station_connection2; station_connection3 ]
  = Node
      ( Node (Empty, "後楽園", [ ("茗荷谷", 1.8) ], Empty),
        "新大塚",
        [ ("茗荷谷", 1.2); ("池袋", 1.8) ],
        Node
          ( Empty,
            "池袋",
            [ ("新大塚", 1.8) ],
            Node (Empty, "茗荷谷", [ ("後楽園", 1.8); ("新大塚", 1.2) ], Empty) ) )

let global_station_connection_tree =
  inserts_station_connection Empty global_station_connection_list
