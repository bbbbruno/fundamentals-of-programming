open Station_name

(* 駅名のデータの例 *)
let station1 =
  { kanji = "池袋"; hiragana = "いけぶくろ"; alphabet = "ikebukuro"; line = "丸ノ内線" }

let station2 =
  { kanji = "池袋"; hiragana = "いけぶくろ"; alphabet = "ikebukuro"; line = "有楽町線" }

let station3 =
  {
    kanji = "御茶ノ水";
    hiragana = "おちゃのみず";
    alphabet = "ochanomizu";
    line = "丸ノ内線";
  }

let station4 =
  { kanji = "後楽園"; hiragana = "こうらくえん"; alphabet = "korakuen"; line = "丸ノ内線" }

let station5 =
  { kanji = "後楽園"; hiragana = "こうらくえん"; alphabet = "korakuen"; line = "南北線" }

let station6 =
  { kanji = "新大塚"; hiragana = "しんおおつか"; alphabet = "shinotsuka"; line = "丸ノ内線" }

let station7 =
  {
    kanji = "本郷三丁目";
    hiragana = "ほんごうさんちょうめ";
    alphabet = "hongosanchome";
    line = "丸ノ内線";
  }

let station8 =
  { kanji = "茗荷谷"; hiragana = "みょうがだに"; alphabet = "myogadani"; line = "丸ノ内線" }

(* 駅名のリストの例 *)
let lst1 = []
let lst2 = [ station2 ]
let lst3 = [ station4; station5 ]
let lst4 = [ station4; station3 ]

let lst5 =
  [
    station4;
    station1;
    station6;
    station5;
    station3;
    station7;
    station2;
    station8;
  ]

(* 目的：昇順に並んでいるlstの正しい位置にstationを挿入する。重複しているものは挿入しない。 *)
(* station_insert : station_t list -> station_t -> station_t list *)
let rec station_insert lst station =
  match lst with
  | [] -> [ station ]
  | first :: rest ->
      if first.hiragana > station.hiragana then station :: lst
      else if first.hiragana = station.hiragana then station_insert rest station
      else first :: station_insert rest station

(* テスト *)
let test1 = station_insert [] station2 = [ station2 ]
let test2 = station_insert [ station4 ] station3 = [ station3; station4 ]
let test3 = station_insert [ station3 ] station4 = [ station3; station4 ]

let test4 =
  station_insert
    [ station1; station2; station3; station5; station6; station7; station8 ]
    station4
  = [ station1; station2; station3; station4; station6; station7; station8 ]

(* station_tのリストを受け取ると、それをhiraganaフィールドの順に整列しかつ重複を省いたリストを返す *)
(* station_sort : station_t list -> station_t list *)
let rec station_ins_sort lst =
  match lst with
  | [] -> []
  | first :: rest -> station_insert (station_ins_sort rest) first

(* テスト *)
let test5 = station_ins_sort lst1 = []
let test6 = station_ins_sort lst2 = [ station2 ]
let test7 = station_ins_sort lst3 = [ station4 ]
let test8 = station_ins_sort lst4 = [ station3; station4 ]

let test9 =
  station_ins_sort lst5
  = [ station1; station3; station4; station6; station7; station8 ]
