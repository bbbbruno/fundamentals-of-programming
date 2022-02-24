open Station
open Dijkstra

(* 目的：station_t型を受け取ると、綺麗に表示する *)
(* print_station : station_t -> () *)
let print_station station =
  match station with
  | { station_names = lst; shortest_distance = d } -> (
      match lst with
      | [] -> assert false (* この場合は起こり得ない *)
      | [ st ] -> print_string (st ^ "（" ^ string_of_float d ^ "km）")
      | st :: rest ->
          List.fold_right (fun st () -> print_string (st ^ "、")) rest ();
          print_string (st ^ "（" ^ string_of_float d ^ "km）");
          print_newline ())

(* メイン関数 *)
(* main : string -> string -> unit *)
let main start last =
  let station = dijkstra start last in
  print_station station

(* テスト *)
(* let test1 = main "shibuya" "gokokuji" = () *)
(* 渋谷、表参道、青山一丁目、永田町、麹町、市ヶ谷、飯田橋、江戸川橋、
   護国寺（9.8km）と表示される *)

(* let test2 = main "myogadani" "meguro" = () *)
(* 茗荷谷、後楽園、飯田橋、市ヶ谷、麹町、永田町、溜池山王、六本木一丁目、
   麻布十番、白金高輪、白金台、目黒（12.7km）と表示される *)

let _ = main Sys.argv.(1) Sys.argv.(2)
