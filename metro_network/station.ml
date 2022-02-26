open Station_name

(* 駅名リストの例 *)

let station_name_list =
  [
    { kanji = "池袋"; hiragana = "いけぶくろ"; alphabet = "ikebukuro"; line = "丸ノ内線" };
    {
      kanji = "新大塚";
      hiragana = "しんおおつか";
      alphabet = "shinotsuka";
      line = "丸ノ内線";
    };
    {
      kanji = "茗荷谷";
      hiragana = "みょうがだに";
      alphabet = "myogadani";
      line = "丸ノ内線";
    };
    { kanji = "後楽園"; hiragana = "こうらくえん"; alphabet = "korakuen"; line = "丸ノ内線" };
    {
      kanji = "本郷三丁目";
      hiragana = "ほんごうさんちょうめ";
      alphabet = "hongosanchome";
      line = "丸ノ内線";
    };
    {
      kanji = "御茶ノ水";
      hiragana = "おちゃのみず";
      alphabet = "ochanomizu";
      line = "丸ノ内線";
    };
  ]

(* 最短経路における頂点である駅ひとつ分の情報を表す型 *)
type station_t = {
  name : string; (* 駅名（漢字） *)
  shortest_distance : float; (* 最短距離 *)
  station_names : string list; (* 手間の駅名のリスト *)
}

(* 目的：station_name_t型のリストを受け取ると、その駅名を使ってキーが最短距離、値がstation_t型のヒープを作成する *)
(* make_station_list -> station_name_t list -> Heap.t *)
let rec make_station_heap_and_initialize lst start =
  List.fold_right
    (fun st (t, h) ->
      let d = if st.kanji = start then 0. else infinity in
      let station_names = if st.kanji = start then [ st.kanji ] else [] in
      let index, heap =
        Heap.insert h d
          { name = st.kanji; shortest_distance = d; station_names }
      in
      let tree = Redblack.insert t st.kanji index in
      (tree, heap))
    lst
    ( Redblack.empty,
      Heap.create (List.length lst) 0.
        { name = ""; shortest_distance = infinity; station_names = [] } )
