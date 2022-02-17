(* 駅と駅の接続情報を表す型 *)
type station_connection_t = {
  start_station : string; (* 起点 *)
  last_station : string; (* 終点 *)
  change_line : string; (* 経由する路線名 *)
  distance : float; (* ２駅間の距離 *)
  time : int; (* 所要時間 *)
}

let global_station_connection_list =
  [
    {
      start_station = "代々木上原";
      last_station = "代々木公園";
      change_line = "千代田線";
      distance = 1.0;
      time = 2;
    };
    {
      start_station = "代々木公園";
      last_station = "明治神宮前";
      change_line = "千代田線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "明治神宮前";
      last_station = "表参道";
      change_line = "千代田線";
      distance = 0.9;
      time = 2;
    };
    {
      start_station = "表参道";
      last_station = "乃木坂";
      change_line = "千代田線";
      distance = 1.4;
      time = 3;
    };
    {
      start_station = "乃木坂";
      last_station = "赤坂";
      change_line = "千代田線";
      distance = 1.1;
      time = 2;
    };
    {
      start_station = "赤坂";
      last_station = "国会議事堂前";
      change_line = "千代田線";
      distance = 0.8;
      time = 1;
    };
    {
      start_station = "国会議事堂前";
      last_station = "霞ヶ関";
      change_line = "千代田線";
      distance = 0.7;
      time = 1;
    };
    {
      start_station = "霞ヶ関";
      last_station = "日比谷";
      change_line = "千代田線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "日比谷";
      last_station = "二重橋前";
      change_line = "千代田線";
      distance = 0.7;
      time = 1;
    };
    {
      start_station = "二重橋前";
      last_station = "大手町";
      change_line = "千代田線";
      distance = 0.7;
      time = 1;
    };
    {
      start_station = "大手町";
      last_station = "新御茶ノ水";
      change_line = "千代田線";
      distance = 1.3;
      time = 2;
    };
    {
      start_station = "新御茶ノ水";
      last_station = "湯島";
      change_line = "千代田線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "湯島";
      last_station = "根津";
      change_line = "千代田線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "根津";
      last_station = "千駄木";
      change_line = "千代田線";
      distance = 1.0;
      time = 2;
    };
    {
      start_station = "千駄木";
      last_station = "西日暮里";
      change_line = "千代田線";
      distance = 0.9;
      time = 1;
    };
    {
      start_station = "西日暮里";
      last_station = "町屋";
      change_line = "千代田線";
      distance = 1.7;
      time = 2;
    };
    {
      start_station = "町屋";
      last_station = "北千住";
      change_line = "千代田線";
      distance = 2.6;
      time = 3;
    };
    {
      start_station = "北千住";
      last_station = "綾瀬";
      change_line = "千代田線";
      distance = 2.5;
      time = 3;
    };
    {
      start_station = "綾瀬";
      last_station = "北綾瀬";
      change_line = "千代田線";
      distance = 2.1;
      time = 4;
    };
    {
      start_station = "浅草";
      last_station = "田原町";
      change_line = "銀座線";
      distance = 0.8;
      time = 2;
    };
    {
      start_station = "田原町";
      last_station = "稲荷町";
      change_line = "銀座線";
      distance = 0.7;
      time = 1;
    };
    {
      start_station = "稲荷町";
      last_station = "上野";
      change_line = "銀座線";
      distance = 0.7;
      time = 2;
    };
    {
      start_station = "上野";
      last_station = "上野広小路";
      change_line = "銀座線";
      distance = 0.5;
      time = 2;
    };
    {
      start_station = "上野広小路";
      last_station = "末広町";
      change_line = "銀座線";
      distance = 0.6;
      time = 1;
    };
    {
      start_station = "末広町";
      last_station = "神田";
      change_line = "銀座線";
      distance = 1.1;
      time = 2;
    };
    {
      start_station = "神田";
      last_station = "三越前";
      change_line = "銀座線";
      distance = 0.7;
      time = 1;
    };
    {
      start_station = "三越前";
      last_station = "日本橋";
      change_line = "銀座線";
      distance = 0.6;
      time = 2;
    };
    {
      start_station = "日本橋";
      last_station = "京橋";
      change_line = "銀座線";
      distance = 0.7;
      time = 2;
    };
    {
      start_station = "京橋";
      last_station = "銀座";
      change_line = "銀座線";
      distance = 0.7;
      time = 1;
    };
    {
      start_station = "銀座";
      last_station = "新橋";
      change_line = "銀座線";
      distance = 0.9;
      time = 2;
    };
    {
      start_station = "新橋";
      last_station = "虎ノ門";
      change_line = "銀座線";
      distance = 0.8;
      time = 2;
    };
    {
      start_station = "虎ノ門";
      last_station = "溜池山王";
      change_line = "銀座線";
      distance = 0.6;
      time = 2;
    };
    {
      start_station = "溜池山王";
      last_station = "赤坂見附";
      change_line = "銀座線";
      distance = 0.9;
      time = 2;
    };
    {
      start_station = "赤坂見附";
      last_station = "青山一丁目";
      change_line = "銀座線";
      distance = 1.3;
      time = 2;
    };
    {
      start_station = "青山一丁目";
      last_station = "外苑前";
      change_line = "銀座線";
      distance = 0.7;
      time = 2;
    };
    {
      start_station = "外苑前";
      last_station = "表参道";
      change_line = "銀座線";
      distance = 0.7;
      time = 1;
    };
    {
      start_station = "表参道";
      last_station = "渋谷";
      change_line = "銀座線";
      distance = 1.3;
      time = 1;
    };
    {
      start_station = "渋谷";
      last_station = "表参道";
      change_line = "半蔵門線";
      distance = 1.3;
      time = 2;
    };
    {
      start_station = "表参道";
      last_station = "青山一丁目";
      change_line = "半蔵門線";
      distance = 1.4;
      time = 2;
    };
    {
      start_station = "青山一丁目";
      last_station = "永田町";
      change_line = "半蔵門線";
      distance = 1.3;
      time = 2;
    };
    {
      start_station = "永田町";
      last_station = "半蔵門";
      change_line = "半蔵門線";
      distance = 1.0;
      time = 2;
    };
    {
      start_station = "半蔵門";
      last_station = "九段下";
      change_line = "半蔵門線";
      distance = 1.6;
      time = 2;
    };
    {
      start_station = "九段下";
      last_station = "神保町";
      change_line = "半蔵門線";
      distance = 0.4;
      time = 1;
    };
    {
      start_station = "神保町";
      last_station = "大手町";
      change_line = "半蔵門線";
      distance = 1.7;
      time = 3;
    };
    {
      start_station = "大手町";
      last_station = "三越前";
      change_line = "半蔵門線";
      distance = 0.7;
      time = 1;
    };
    {
      start_station = "三越前";
      last_station = "水天宮前";
      change_line = "半蔵門線";
      distance = 1.3;
      time = 2;
    };
    {
      start_station = "水天宮前";
      last_station = "清澄白河";
      change_line = "半蔵門線";
      distance = 1.7;
      time = 3;
    };
    {
      start_station = "清澄白河";
      last_station = "住吉";
      change_line = "半蔵門線";
      distance = 1.9;
      time = 3;
    };
    {
      start_station = "住吉";
      last_station = "錦糸町";
      change_line = "半蔵門線";
      distance = 1.;
      time = 2;
    };
    {
      start_station = "錦糸町";
      last_station = "押上";
      change_line = "半蔵門線";
      distance = 1.4;
      time = 2;
    };
    {
      start_station = "中目黒";
      last_station = "恵比寿";
      change_line = "日比谷線";
      distance = 1.;
      time = 2;
    };
    {
      start_station = "恵比寿";
      last_station = "広尾";
      change_line = "日比谷線";
      distance = 1.5;
      time = 3;
    };
    {
      start_station = "広尾";
      last_station = "六本木";
      change_line = "日比谷線";
      distance = 1.7;
      time = 3;
    };
    {
      start_station = "六本木";
      last_station = "神谷町";
      change_line = "日比谷線";
      distance = 1.5;
      time = 3;
    };
    {
      start_station = "神谷町";
      last_station = "霞ヶ関";
      change_line = "日比谷線";
      distance = 1.3;
      time = 2;
    };
    {
      start_station = "霞ヶ関";
      last_station = "日比谷";
      change_line = "日比谷線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "日比谷";
      last_station = "銀座";
      change_line = "日比谷線";
      distance = 0.4;
      time = 1;
    };
    {
      start_station = "銀座";
      last_station = "東銀座";
      change_line = "日比谷線";
      distance = 0.4;
      time = 1;
    };
    {
      start_station = "東銀座";
      last_station = "築地";
      change_line = "日比谷線";
      distance = 0.6;
      time = 2;
    };
    {
      start_station = "築地";
      last_station = "八丁堀";
      change_line = "日比谷線";
      distance = 1.;
      time = 2;
    };
    {
      start_station = "八丁堀";
      last_station = "茅場町";
      change_line = "日比谷線";
      distance = 0.5;
      time = 1;
    };
    {
      start_station = "茅場町";
      last_station = "人形町";
      change_line = "日比谷線";
      distance = 0.9;
      time = 2;
    };
    {
      start_station = "人形町";
      last_station = "小伝馬町";
      change_line = "日比谷線";
      distance = 0.6;
      time = 1;
    };
    {
      start_station = "小伝馬町";
      last_station = "秋葉原";
      change_line = "日比谷線";
      distance = 0.9;
      time = 2;
    };
    {
      start_station = "秋葉原";
      last_station = "仲御徒町";
      change_line = "日比谷線";
      distance = 1.;
      time = 1;
    };
    {
      start_station = "仲御徒町";
      last_station = "上野";
      change_line = "日比谷線";
      distance = 0.5;
      time = 1;
    };
    {
      start_station = "上野";
      last_station = "入谷";
      change_line = "日比谷線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "入谷";
      last_station = "三ノ輪";
      change_line = "日比谷線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "三ノ輪";
      last_station = "南千住";
      change_line = "日比谷線";
      distance = 0.8;
      time = 2;
    };
    {
      start_station = "南千住";
      last_station = "北千住";
      change_line = "日比谷線";
      distance = 1.8;
      time = 3;
    };
    {
      start_station = "池袋";
      last_station = "新大塚";
      change_line = "丸ノ内線";
      distance = 1.8;
      time = 3;
    };
    {
      start_station = "新大塚";
      last_station = "茗荷谷";
      change_line = "丸ノ内線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "茗荷谷";
      last_station = "後楽園";
      change_line = "丸ノ内線";
      distance = 1.8;
      time = 2;
    };
    {
      start_station = "後楽園";
      last_station = "本郷三丁目";
      change_line = "丸ノ内線";
      distance = 0.8;
      time = 1;
    };
    {
      start_station = "本郷三丁目";
      last_station = "御茶ノ水";
      change_line = "丸ノ内線";
      distance = 0.8;
      time = 1;
    };
    {
      start_station = "御茶ノ水";
      last_station = "淡路町";
      change_line = "丸ノ内線";
      distance = 0.8;
      time = 1;
    };
    {
      start_station = "淡路町";
      last_station = "大手町";
      change_line = "丸ノ内線";
      distance = 0.9;
      time = 2;
    };
    {
      start_station = "大手町";
      last_station = "東京";
      change_line = "丸ノ内線";
      distance = 0.6;
      time = 1;
    };
    {
      start_station = "東京";
      last_station = "銀座";
      change_line = "丸ノ内線";
      distance = 1.1;
      time = 2;
    };
    {
      start_station = "銀座";
      last_station = "霞ヶ関";
      change_line = "丸ノ内線";
      distance = 1.0;
      time = 2;
    };
    {
      start_station = "霞ヶ関";
      last_station = "国会議事堂前";
      change_line = "丸ノ内線";
      distance = 0.7;
      time = 1;
    };
    {
      start_station = "国会議事堂前";
      last_station = "赤坂見附";
      change_line = "丸ノ内線";
      distance = 0.9;
      time = 2;
    };
    {
      start_station = "赤坂見附";
      last_station = "四ツ谷";
      change_line = "丸ノ内線";
      distance = 1.3;
      time = 2;
    };
    {
      start_station = "四ツ谷";
      last_station = "四谷三丁目";
      change_line = "丸ノ内線";
      distance = 1.0;
      time = 2;
    };
    {
      start_station = "四谷三丁目";
      last_station = "新宿御苑前";
      change_line = "丸ノ内線";
      distance = 0.9;
      time = 1;
    };
    {
      start_station = "新宿御苑前";
      last_station = "新宿三丁目";
      change_line = "丸ノ内線";
      distance = 0.7;
      time = 1;
    };
    {
      start_station = "新宿三丁目";
      last_station = "新宿";
      change_line = "丸ノ内線";
      distance = 0.3;
      time = 1;
    };
    {
      start_station = "新宿";
      last_station = "西新宿";
      change_line = "丸ノ内線";
      distance = 0.8;
      time = 1;
    };
    {
      start_station = "西新宿";
      last_station = "中野坂上";
      change_line = "丸ノ内線";
      distance = 1.1;
      time = 2;
    };
    {
      start_station = "中野坂上";
      last_station = "新中野";
      change_line = "丸ノ内線";
      distance = 1.1;
      time = 2;
    };
    {
      start_station = "新中野";
      last_station = "東高円寺";
      change_line = "丸ノ内線";
      distance = 1.0;
      time = 1;
    };
    {
      start_station = "東高円寺";
      last_station = "新高円寺";
      change_line = "丸ノ内線";
      distance = 0.9;
      time = 1;
    };
    {
      start_station = "新高円寺";
      last_station = "南阿佐ヶ谷";
      change_line = "丸ノ内線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "南阿佐ヶ谷";
      last_station = "荻窪";
      change_line = "丸ノ内線";
      distance = 1.5;
      time = 2;
    };
    {
      start_station = "中野坂上";
      last_station = "中野新橋";
      change_line = "丸ノ内線";
      distance = 1.3;
      time = 2;
    };
    {
      start_station = "中野新橋";
      last_station = "中野富士見町";
      change_line = "丸ノ内線";
      distance = 0.6;
      time = 1;
    };
    {
      start_station = "中野富士見町";
      last_station = "方南町";
      change_line = "丸ノ内線";
      distance = 1.3;
      time = 2;
    };
    {
      start_station = "市ヶ谷";
      last_station = "四ツ谷";
      change_line = "南北線";
      distance = 1.0;
      time = 2;
    };
    {
      start_station = "四ツ谷";
      last_station = "永田町";
      change_line = "南北線";
      distance = 1.3;
      time = 3;
    };
    {
      start_station = "永田町";
      last_station = "溜池山王";
      change_line = "南北線";
      distance = 0.9;
      time = 1;
    };
    {
      start_station = "溜池山王";
      last_station = "六本木一丁目";
      change_line = "南北線";
      distance = 0.9;
      time = 2;
    };
    {
      start_station = "六本木一丁目";
      last_station = "麻布十番";
      change_line = "南北線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "麻布十番";
      last_station = "白金高輪";
      change_line = "南北線";
      distance = 1.3;
      time = 2;
    };
    {
      start_station = "白金高輪";
      last_station = "白金台";
      change_line = "南北線";
      distance = 1.0;
      time = 2;
    };
    {
      start_station = "白金台";
      last_station = "目黒";
      change_line = "南北線";
      distance = 1.3;
      time = 2;
    };
    {
      start_station = "市ヶ谷";
      last_station = "飯田橋";
      change_line = "南北線";
      distance = 1.1;
      time = 2;
    };
    {
      start_station = "飯田橋";
      last_station = "後楽園";
      change_line = "南北線";
      distance = 1.4;
      time = 2;
    };
    {
      start_station = "後楽園";
      last_station = "東大前";
      change_line = "南北線";
      distance = 1.3;
      time = 3;
    };
    {
      start_station = "東大前";
      last_station = "本駒込";
      change_line = "南北線";
      distance = 0.9;
      time = 2;
    };
    {
      start_station = "本駒込";
      last_station = "駒込";
      change_line = "南北線";
      distance = 1.4;
      time = 2;
    };
    {
      start_station = "駒込";
      last_station = "西ヶ原";
      change_line = "南北線";
      distance = 1.4;
      time = 2;
    };
    {
      start_station = "西ヶ原";
      last_station = "王子";
      change_line = "南北線";
      distance = 1.0;
      time = 2;
    };
    {
      start_station = "王子";
      last_station = "王子神谷";
      change_line = "南北線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "王子神谷";
      last_station = "志茂";
      change_line = "南北線";
      distance = 1.6;
      time = 3;
    };
    {
      start_station = "志茂";
      last_station = "赤羽岩淵";
      change_line = "南北線";
      distance = 1.1;
      time = 2;
    };
    {
      start_station = "西船橋";
      last_station = "原木中山";
      change_line = "東西線";
      distance = 1.9;
      time = 3;
    };
    {
      start_station = "原木中山";
      last_station = "妙典";
      change_line = "東西線";
      distance = 2.1;
      time = 2;
    };
    {
      start_station = "妙典";
      last_station = "行徳";
      change_line = "東西線";
      distance = 1.3;
      time = 2;
    };
    {
      start_station = "行徳";
      last_station = "南行徳";
      change_line = "東西線";
      distance = 1.5;
      time = 2;
    };
    {
      start_station = "南行徳";
      last_station = "浦安";
      change_line = "東西線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "浦安";
      last_station = "葛西";
      change_line = "東西線";
      distance = 1.9;
      time = 2;
    };
    {
      start_station = "葛西";
      last_station = "西葛西";
      change_line = "東西線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "西葛西";
      last_station = "南砂町";
      change_line = "東西線";
      distance = 2.7;
      time = 2;
    };
    {
      start_station = "南砂町";
      last_station = "東陽町";
      change_line = "東西線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "東陽町";
      last_station = "木場";
      change_line = "東西線";
      distance = 0.9;
      time = 1;
    };
    {
      start_station = "木場";
      last_station = "門前仲町";
      change_line = "東西線";
      distance = 1.1;
      time = 1;
    };
    {
      start_station = "門前仲町";
      last_station = "茅場町";
      change_line = "東西線";
      distance = 1.8;
      time = 2;
    };
    {
      start_station = "茅場町";
      last_station = "日本橋";
      change_line = "東西線";
      distance = 0.5;
      time = 1;
    };
    {
      start_station = "日本橋";
      last_station = "大手町";
      change_line = "東西線";
      distance = 0.8;
      time = 1;
    };
    {
      start_station = "大手町";
      last_station = "竹橋";
      change_line = "東西線";
      distance = 1.0;
      time = 2;
    };
    {
      start_station = "竹橋";
      last_station = "九段下";
      change_line = "東西線";
      distance = 1.0;
      time = 1;
    };
    {
      start_station = "九段下";
      last_station = "飯田橋";
      change_line = "東西線";
      distance = 0.7;
      time = 1;
    };
    {
      start_station = "飯田橋";
      last_station = "神楽坂";
      change_line = "東西線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "神楽坂";
      last_station = "早稲田";
      change_line = "東西線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "早稲田";
      last_station = "高田馬場";
      change_line = "東西線";
      distance = 1.7;
      time = 3;
    };
    {
      start_station = "高田馬場";
      last_station = "落合";
      change_line = "東西線";
      distance = 1.9;
      time = 3;
    };
    {
      start_station = "落合";
      last_station = "中野";
      change_line = "東西線";
      distance = 2.0;
      time = 3;
    };
    {
      start_station = "新木場";
      last_station = "辰巳";
      change_line = "有楽町線";
      distance = 1.5;
      time = 2;
    };
    {
      start_station = "辰巳";
      last_station = "豊洲";
      change_line = "有楽町線";
      distance = 1.7;
      time = 2;
    };
    {
      start_station = "豊洲";
      last_station = "月島";
      change_line = "有楽町線";
      distance = 1.4;
      time = 2;
    };
    {
      start_station = "月島";
      last_station = "新富町";
      change_line = "有楽町線";
      distance = 1.3;
      time = 2;
    };
    {
      start_station = "新富町";
      last_station = "銀座一丁目";
      change_line = "有楽町線";
      distance = 0.7;
      time = 1;
    };
    {
      start_station = "銀座一丁目";
      last_station = "有楽町";
      change_line = "有楽町線";
      distance = 0.5;
      time = 1;
    };
    {
      start_station = "有楽町";
      last_station = "桜田門";
      change_line = "有楽町線";
      distance = 1.0;
      time = 1;
    };
    {
      start_station = "桜田門";
      last_station = "永田町";
      change_line = "有楽町線";
      distance = 0.9;
      time = 2;
    };
    {
      start_station = "永田町";
      last_station = "麹町";
      change_line = "有楽町線";
      distance = 0.9;
      time = 1;
    };
    {
      start_station = "麹町";
      last_station = "市ヶ谷";
      change_line = "有楽町線";
      distance = 0.9;
      time = 1;
    };
    {
      start_station = "市ヶ谷";
      last_station = "飯田橋";
      change_line = "有楽町線";
      distance = 1.1;
      time = 2;
    };
    {
      start_station = "飯田橋";
      last_station = "江戸川橋";
      change_line = "有楽町線";
      distance = 1.6;
      time = 3;
    };
    {
      start_station = "江戸川橋";
      last_station = "護国寺";
      change_line = "有楽町線";
      distance = 1.3;
      time = 2;
    };
    {
      start_station = "護国寺";
      last_station = "東池袋";
      change_line = "有楽町線";
      distance = 1.1;
      time = 2;
    };
    {
      start_station = "東池袋";
      last_station = "池袋";
      change_line = "有楽町線";
      distance = 2.0;
      time = 2;
    };
    {
      start_station = "池袋";
      last_station = "要町";
      change_line = "有楽町線";
      distance = 1.2;
      time = 2;
    };
    {
      start_station = "要町";
      last_station = "千川";
      change_line = "有楽町線";
      distance = 1.0;
      time = 1;
    };
    {
      start_station = "千川";
      last_station = "小竹向原";
      change_line = "有楽町線";
      distance = 1.0;
      time = 2;
    };
    {
      start_station = "小竹向原";
      last_station = "氷川台";
      change_line = "有楽町線";
      distance = 1.5;
      time = 2;
    };
    {
      start_station = "氷川台";
      last_station = "平和台";
      change_line = "有楽町線";
      distance = 1.4;
      time = 2;
    };
    {
      start_station = "平和台";
      last_station = "営団赤塚";
      change_line = "有楽町線";
      distance = 1.8;
      time = 2;
    };
    {
      start_station = "営団赤塚";
      last_station = "営団成増";
      change_line = "有楽町線";
      distance = 1.5;
      time = 2;
    };
    {
      start_station = "営団成増";
      last_station = "和光市";
      change_line = "有楽町線";
      distance = 2.1;
      time = 3;
    };
  ]
