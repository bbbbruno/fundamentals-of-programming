(* 駅名ひとつ分のデータを表す型 *)
type station_name_t = {
  name : string; (* 駅名 *)
  hiragana : string; (* ひらがなの駅名 *)
  alphabet : string; (* ローマ字の駅名 *)
  line : string; (* その駅が所属する路線名 *)
}

(* 駅名のデータの例 *)
let station1 =
  { name = "池袋"; hiragana = "いけぶくろ"; alphabet = "ikebukuro"; line = "丸ノ内線" }

let station2 =
  { name = "池袋"; hiragana = "いけぶくろ"; alphabet = "ikebukuro"; line = "有楽町線" }

let station3 =
  { name = "御茶ノ水"; hiragana = "おちゃのみず"; alphabet = "ochanomizu"; line = "丸ノ内線" }

let station4 =
  { name = "後楽園"; hiragana = "こうらくえん"; alphabet = "korakuen"; line = "丸ノ内線" }

let station5 =
  { name = "後楽園"; hiragana = "こうらくえん"; alphabet = "korakuen"; line = "南北線" }

let station6 =
  { name = "新大塚"; hiragana = "しんおおつか"; alphabet = "shinotsuka"; line = "丸ノ内線" }

let station7 =
  {
    name = "本郷三丁目";
    hiragana = "ほんごうさんちょうめ";
    alphabet = "hongosanchome";
    line = "丸ノ内線";
  }

let station8 =
  { name = "茗荷谷"; hiragana = "みょうがだに"; alphabet = "myogadani"; line = "丸ノ内線" }

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

(* 目的：昇順に並んでいるlstの正しい位置にstationを挿入する *)
(* station_insert : station_t list -> station_t -> station_t list *)
let rec station_insert lst station0 =
  match lst with
  | [] -> [ station0 ]
  | ({ name = n; hiragana = h; alphabet = a; line = l } as station) :: rest -> (
      match station0 with
      | { name = n0; hiragana = h0; alphabet = a0; line = l0 } ->
          if h = h0 then station_insert rest station0
          else if h < h0 then station :: station_insert rest station0
          else station0 :: lst)

(* テスト *)
let test1 = station_insert [] station2 = [ station2 ]
let test2 = station_insert [ station4 ] station3 = [ station3; station4 ]
let test3 = station_insert [ station3 ] station4 = [ station3; station4 ]

let test4 =
  station_insert
    [ station1; station2; station3; station5; station6; station7; station8 ]
    station4
  = [
      station1;
      station2;
      station3;
      station4;
      station5;
      station6;
      station7;
      station8;
    ]

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
