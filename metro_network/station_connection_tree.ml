open Redblack
open Station_connection

(* 木と駅間を受け取ると、その片方のデータを挿入した木を返す。 *)
(* insert : Redblack.t -> string -> string -> int -> Redblack.t *)
let insert tree start last distance =
  let lst = try search tree start with Not_found -> [] in
  insert tree start ((last, distance) :: lst)

(* 木と駅間を受け取ると、その両方向のデータを挿入した木を返す。 *)
(* insert_station_connection : Redblack.t -> station_connection_t -> Redblack.t *)
let insert_station_connection tree conn =
  match conn with
  | { start_station = s; last_station = l; distance = d } ->
      insert (insert tree l s d) s l d

(* 目的：木と駅間リストを受け取ると、リストの中の全ての駅間を挿入した木を返す。 *)
(* inserts_station_connection : Redblack.t -> station_connection_t list -> Redblack.t *)
let inserts_station_connection tree lst =
  List.fold_left
    (fun result item -> insert_station_connection result item)
    tree lst

let global_station_connection_tree =
  inserts_station_connection empty global_station_connection_list
