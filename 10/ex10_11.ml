(* 目的：漢字の駅名二つと駅間リストを与えると、その２駅間の距離を返す *)
(* get_station_distance : string -> string -> station_connection_t list -> int *)
let rec get_station_distance k1 k2 station_connection_list =
  match station_connection_list with
  | [] -> infinity
  | {
      start_station = ss;
      last_station = ls;
      change_line = cl;
      distance = d;
      time = t;
    }
    :: rest ->
      if (ss = k1 && ls = k2) || (ss = k2 && ls = k1) then d
      else get_station_distance k1 k2 rest

(* テスト *)
let test1 =
  get_station_distance "茗荷谷" "新大塚" global_station_connection_list = 1.2

let test2 =
  get_station_distance "茗荷谷" "池袋" global_station_connection_list = infinity

let test3 = get_station_distance "東京" "大手町" global_station_connection_list = 0.6
