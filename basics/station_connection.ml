(* 駅と駅の接続情報を表す型 *)
type station_connection_t = {
  start_station : string; (* 起点 *)
  last_station : string; (* 終点 *)
  change_line : string; (* 経由する路線名 *)
  distance : float; (* ２駅間の距離 *)
  time : int; (* 所要時間 *)
}
