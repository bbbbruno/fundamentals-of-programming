(* 駅ひとつ分のデータを表す型 *)
type station_t = {
  name : string; (* 駅名 *)
  hiragana : string; (* ひらがなの駅名 *)
  alphabet : string; (* ローマ字の駅名 *)
  line : string; (* その駅が所属する路線名 *)
}

(* 目的：駅のデータを受け取ると、その駅の情報を「路線名, 駅名（かな）」の形式の文字列で返す *)
(* display_station_name : station_t -> string *)
let display_station_name station =
  match station with
  | { name = n; hiragana = h; alphabet = a; line = l } ->
      l ^ ", " ^ n ^ "（" ^ h ^ "）"

(* テスト *)
let test1 =
  display_station_name
    { name = "茗荷谷"; hiragana = "みょうがだに"; alphabet = "myogadani"; line = "丸の内線" }
  = "丸の内線, 茗荷谷（みょうがだに）"

let test2 =
  display_station_name
    { name = "渋谷"; hiragana = "しぶや"; alphabet = "shibuya"; line = "山手線" }
  = "山手線, 渋谷（しぶや）"

let test3 =
  display_station_name
    {
      name = "武蔵浦和";
      hiragana = "むさしうらわ";
      alphabet = "musashiurawa";
      line = "埼京線";
    }
  = "埼京線, 武蔵浦和（むさしうらわ）"
