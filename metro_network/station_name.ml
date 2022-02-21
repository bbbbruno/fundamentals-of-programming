(* 駅名ひとつ分のデータを表す型 *)
type station_name_t = {
  kanji : string; (* 駅名 *)
  hiragana : string; (* ひらがなの駅名 *)
  alphabet : string; (* ローマ字の駅名 *)
  line : string; (* その駅が所属する路線名 *)
}

let global_station_name_list =
  [
    {
      kanji = "代々木上原";
      hiragana = "よよぎうえはら";
      alphabet = "yoyogiuehara";
      line = "千代田線";
    };
    {
      kanji = "代々木公園";
      hiragana = "よよぎこうえん";
      alphabet = "yoyogikouen";
      line = "千代田線";
    };
    {
      kanji = "明治神宮前";
      hiragana = "めいじじんぐうまえ";
      alphabet = "meijijinguumae";
      line = "千代田線";
    };
    {
      kanji = "表参道";
      hiragana = "おもてさんどう";
      alphabet = "omotesandou";
      line = "千代田線";
    };
    { kanji = "乃木坂"; hiragana = "のぎざか"; alphabet = "nogizaka"; line = "千代田線" };
    { kanji = "赤坂"; hiragana = "あかさか"; alphabet = "akasaka"; line = "千代田線" };
    {
      kanji = "国会議事堂前";
      hiragana = "こっかいぎじどうまえ";
      alphabet = "kokkaigijidoumae";
      line = "千代田線";
    };
    {
      kanji = "霞ヶ関";
      hiragana = "かすみがせき";
      alphabet = "kasumigaseki";
      line = "千代田線";
    };
    { kanji = "日比谷"; hiragana = "ひびや"; alphabet = "hibiya"; line = "千代田線" };
    {
      kanji = "二重橋前";
      hiragana = "にじゅうばしまえ";
      alphabet = "nijuubasimae";
      line = "千代田線";
    };
    { kanji = "大手町"; hiragana = "おおてまち"; alphabet = "otemachi"; line = "千代田線" };
    {
      kanji = "新御茶ノ水";
      hiragana = "しんおちゃのみず";
      alphabet = "shin-ochanomizu";
      line = "千代田線";
    };
    { kanji = "湯島"; hiragana = "ゆしま"; alphabet = "yushima"; line = "千代田線" };
    { kanji = "根津"; hiragana = "ねづ"; alphabet = "nedu"; line = "千代田線" };
    { kanji = "千駄木"; hiragana = "せんだぎ"; alphabet = "sendagi"; line = "千代田線" };
    {
      kanji = "西日暮里";
      hiragana = "にしにっぽり";
      alphabet = "nishinippori";
      line = "千代田線";
    };
    { kanji = "町屋"; hiragana = "まちや"; alphabet = "machiya"; line = "千代田線" };
    {
      kanji = "北千住";
      hiragana = "きたせんじゅ";
      alphabet = "kitasenjyu";
      line = "千代田線";
    };
    { kanji = "綾瀬"; hiragana = "あやせ"; alphabet = "ayase"; line = "千代田線" };
    { kanji = "北綾瀬"; hiragana = "きたあやせ"; alphabet = "kitaayase"; line = "千代田線" };
    { kanji = "浅草"; hiragana = "あさくさ"; alphabet = "asakusa"; line = "銀座線" };
    {
      kanji = "田原町";
      hiragana = "たわらまち";
      alphabet = "tawaramachi";
      line = "銀座線";
    };
    { kanji = "稲荷町"; hiragana = "いなりちょう"; alphabet = "inaricho"; line = "銀座線" };
    { kanji = "上野"; hiragana = "うえの"; alphabet = "ueno"; line = "銀座線" };
    {
      kanji = "上野広小路";
      hiragana = "うえのひろこうじ";
      alphabet = "uenohirokoji";
      line = "銀座線";
    };
    {
      kanji = "末広町";
      hiragana = "すえひろちょう";
      alphabet = "suehirocho";
      line = "銀座線";
    };
    { kanji = "神田"; hiragana = "かんだ"; alphabet = "kanda"; line = "銀座線" };
    {
      kanji = "三越前";
      hiragana = "みつこしまえ";
      alphabet = "mitsukoshimae";
      line = "銀座線";
    };
    { kanji = "日本橋"; hiragana = "にほんばし"; alphabet = "nihonbashi"; line = "銀座線" };
    { kanji = "京橋"; hiragana = "きょうばし"; alphabet = "kyobashi"; line = "銀座線" };
    { kanji = "銀座"; hiragana = "ぎんざ"; alphabet = "ginza"; line = "銀座線" };
    { kanji = "新橋"; hiragana = "しんばし"; alphabet = "shinbashi"; line = "銀座線" };
    { kanji = "虎ノ門"; hiragana = "とらのもん"; alphabet = "toranomon"; line = "銀座線" };
    {
      kanji = "溜池山王";
      hiragana = "ためいけさんのう";
      alphabet = "tameikesannou";
      line = "銀座線";
    };
    {
      kanji = "赤坂見附";
      hiragana = "あかさかみつけ";
      alphabet = "akasakamitsuke";
      line = "銀座線";
    };
    {
      kanji = "青山一丁目";
      hiragana = "あおやまいっちょうめ";
      alphabet = "aoyamaicchome";
      line = "銀座線";
    };
    { kanji = "外苑前"; hiragana = "がいえんまえ"; alphabet = "gaienmae"; line = "銀座線" };
    {
      kanji = "表参道";
      hiragana = "おもてさんどう";
      alphabet = "omotesando";
      line = "銀座線";
    };
    { kanji = "渋谷"; hiragana = "しぶや"; alphabet = "shibuya"; line = "銀座線" };
    { kanji = "渋谷"; hiragana = "しぶや"; alphabet = "shibuya"; line = "半蔵門線" };
    {
      kanji = "表参道";
      hiragana = "おもてさんどう";
      alphabet = "omotesandou";
      line = "半蔵門線";
    };
    {
      kanji = "青山一丁目";
      hiragana = "あおやまいっちょうめ";
      alphabet = "aoyama-itchome";
      line = "半蔵門線";
    };
    {
      kanji = "永田町";
      hiragana = "ながたちょう";
      alphabet = "nagatacho";
      line = "半蔵門線";
    };
    { kanji = "半蔵門"; hiragana = "はんぞうもん"; alphabet = "hanzomon"; line = "半蔵門線" };
    {
      kanji = "九段下";
      hiragana = "くだんした";
      alphabet = "kudanshita";
      line = "半蔵門線";
    };
    {
      kanji = "神保町";
      hiragana = "じんぼうちょう";
      alphabet = "jinbocho";
      line = "半蔵門線";
    };
    { kanji = "大手町"; hiragana = "おおてまち"; alphabet = "otemachi"; line = "半蔵門線" };
    {
      kanji = "三越前";
      hiragana = "みつこしまえ";
      alphabet = "mitsukoshimae";
      line = "半蔵門線";
    };
    {
      kanji = "水天宮前";
      hiragana = "すいてんぐうまえ";
      alphabet = "suitengumae";
      line = "半蔵門線";
    };
    {
      kanji = "清澄白河";
      hiragana = "きよすみしらかわ";
      alphabet = "kiyosumi-shirakawa";
      line = "半蔵門線";
    };
    { kanji = "住吉"; hiragana = "すみよし"; alphabet = "sumiyoshi"; line = "半蔵門線" };
    {
      kanji = "錦糸町";
      hiragana = "きんしちょう";
      alphabet = "kinshicho";
      line = "半蔵門線";
    };
    { kanji = "押上"; hiragana = "おしあげ"; alphabet = "oshiage"; line = "半蔵門線" };
    {
      kanji = "中目黒";
      hiragana = "なかめぐろ";
      alphabet = "nakameguro";
      line = "日比谷線";
    };
    { kanji = "恵比寿"; hiragana = "えびす"; alphabet = "ebisu"; line = "日比谷線" };
    { kanji = "広尾"; hiragana = "ひろお"; alphabet = "hiro"; line = "日比谷線" };
    { kanji = "六本木"; hiragana = "ろっぽんぎ"; alphabet = "roppongi"; line = "日比谷線" };
    {
      kanji = "神谷町";
      hiragana = "かみやちょう";
      alphabet = "kamiyacho";
      line = "日比谷線";
    };
    {
      kanji = "霞ヶ関";
      hiragana = "かすみがせき";
      alphabet = "kasumigaseki";
      line = "日比谷線";
    };
    { kanji = "日比谷"; hiragana = "ひびや"; alphabet = "hibiya"; line = "日比谷線" };
    { kanji = "銀座"; hiragana = "ぎんざ"; alphabet = "ginza"; line = "日比谷線" };
    {
      kanji = "東銀座";
      hiragana = "ひがしぎんざ";
      alphabet = "higashiginza";
      line = "日比谷線";
    };
    { kanji = "築地"; hiragana = "つきじ"; alphabet = "tsukiji"; line = "日比谷線" };
    {
      kanji = "八丁堀";
      hiragana = "はっちょうぼり";
      alphabet = "hacchobori";
      line = "日比谷線";
    };
    {
      kanji = "茅場町";
      hiragana = "かやばちょう";
      alphabet = "kayabacho";
      line = "日比谷線";
    };
    {
      kanji = "人形町";
      hiragana = "にんぎょうちょう";
      alphabet = "ningyomachi";
      line = "日比谷線";
    };
    {
      kanji = "小伝馬町";
      hiragana = "こでんまちょう";
      alphabet = "kodemmacho";
      line = "日比谷線";
    };
    { kanji = "秋葉原"; hiragana = "あきはばら"; alphabet = "akihabara"; line = "日比谷線" };
    {
      kanji = "仲御徒町";
      hiragana = "なかおかちまち";
      alphabet = "nakaokachimachi";
      line = "日比谷線";
    };
    { kanji = "上野"; hiragana = "うえの"; alphabet = "ueno"; line = "日比谷線" };
    { kanji = "入谷"; hiragana = "いりや"; alphabet = "iriya"; line = "日比谷線" };
    { kanji = "三ノ輪"; hiragana = "みのわ"; alphabet = "minowa"; line = "日比谷線" };
    {
      kanji = "南千住";
      hiragana = "みなみせんじゅ";
      alphabet = "minamisenju";
      line = "日比谷線";
    };
    {
      kanji = "北千住";
      hiragana = "きたせんじゅ";
      alphabet = "kitasenju";
      line = "日比谷線";
    };
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
    { kanji = "淡路町"; hiragana = "あわじちょう"; alphabet = "awajicho"; line = "丸ノ内線" };
    { kanji = "大手町"; hiragana = "おおてまち"; alphabet = "otemachi"; line = "丸ノ内線" };
    { kanji = "東京"; hiragana = "とうきょう"; alphabet = "tokyo"; line = "丸ノ内線" };
    { kanji = "銀座"; hiragana = "ぎんざ"; alphabet = "ginza"; line = "丸ノ内線" };
    {
      kanji = "霞ヶ関";
      hiragana = "かすみがせき";
      alphabet = "kasumigaseki";
      line = "丸ノ内線";
    };
    {
      kanji = "国会議事堂前";
      hiragana = "こっかいぎじどうまえ";
      alphabet = "kokkaigijidomae";
      line = "丸ノ内線";
    };
    {
      kanji = "赤坂見附";
      hiragana = "あかさかみつけ";
      alphabet = "akasakamitsuke";
      line = "丸ノ内線";
    };
    { kanji = "四ツ谷"; hiragana = "よつや"; alphabet = "yotsuya"; line = "丸ノ内線" };
    {
      kanji = "四谷三丁目";
      hiragana = "よつやさんちょうめ";
      alphabet = "yotsuyasanchome";
      line = "丸ノ内線";
    };
    {
      kanji = "新宿御苑前";
      hiragana = "しんじゅくぎょえんまえ";
      alphabet = "shinjuku-gyoemmae";
      line = "丸ノ内線";
    };
    {
      kanji = "新宿三丁目";
      hiragana = "しんじゅくさんちょうめ";
      alphabet = "shinjuku-sanchome";
      line = "丸ノ内線";
    };
    { kanji = "新宿"; hiragana = "しんじゅく"; alphabet = "shinjuku"; line = "丸ノ内線" };
    {
      kanji = "西新宿";
      hiragana = "にししんじゅく";
      alphabet = "nishi-shinjuku";
      line = "丸ノ内線";
    };
    {
      kanji = "中野坂上";
      hiragana = "なかのさかうえ";
      alphabet = "nakano-sakaue";
      line = "丸ノ内線";
    };
    {
      kanji = "新中野";
      hiragana = "しんなかの";
      alphabet = "shin-nakano";
      line = "丸ノ内線";
    };
    {
      kanji = "東高円寺";
      hiragana = "ひがしこうえんじ";
      alphabet = "higashi-koenji";
      line = "丸ノ内線";
    };
    {
      kanji = "新高円寺";
      hiragana = "しんこうえんじ";
      alphabet = "shin-koenji";
      line = "丸ノ内線";
    };
    {
      kanji = "南阿佐ヶ谷";
      hiragana = "みなみあさがや";
      alphabet = "minami-asagaya";
      line = "丸ノ内線";
    };
    { kanji = "荻窪"; hiragana = "おぎくぼ"; alphabet = "ogikubo"; line = "丸ノ内線" };
    {
      kanji = "中野新橋";
      hiragana = "なかのしんばし";
      alphabet = "nakano-shimbashi";
      line = "丸ノ内線";
    };
    {
      kanji = "中野富士見町";
      hiragana = "なかのふじみちょう";
      alphabet = "nakano-fujimicho";
      line = "丸ノ内線";
    };
    {
      kanji = "方南町";
      hiragana = "ほうなんちょう";
      alphabet = "honancho";
      line = "丸ノ内線";
    };
    { kanji = "四ツ谷"; hiragana = "よつや"; alphabet = "yotsuya"; line = "南北線" };
    { kanji = "永田町"; hiragana = "ながたちょう"; alphabet = "nagatacho"; line = "南北線" };
    {
      kanji = "溜池山王";
      hiragana = "ためいけさんのう";
      alphabet = "tameikesanno";
      line = "南北線";
    };
    {
      kanji = "六本木一丁目";
      hiragana = "ろっぽんぎいっちょうめ";
      alphabet = "roppongiitchome";
      line = "南北線";
    };
    {
      kanji = "麻布十番";
      hiragana = "あざぶじゅうばん";
      alphabet = "azabujuban";
      line = "南北線";
    };
    {
      kanji = "白金高輪";
      hiragana = "しろかねたかなわ";
      alphabet = "shirokanetahiraganawa";
      line = "南北線";
    };
    {
      kanji = "白金台";
      hiragana = "しろかねだい";
      alphabet = "shirokanedai";
      line = "南北線";
    };
    { kanji = "目黒"; hiragana = "めぐろ"; alphabet = "meguro"; line = "南北線" };
    { kanji = "市ヶ谷"; hiragana = "いちがや"; alphabet = "ichigaya"; line = "南北線" };
    { kanji = "飯田橋"; hiragana = "いいだばし"; alphabet = "idabashi"; line = "南北線" };
    { kanji = "後楽園"; hiragana = "こうらくえん"; alphabet = "korakuen"; line = "南北線" };
    { kanji = "東大前"; hiragana = "とうだいまえ"; alphabet = "todaimae"; line = "南北線" };
    {
      kanji = "本駒込";
      hiragana = "ほんこまごめ";
      alphabet = "honkomagome";
      line = "南北線";
    };
    { kanji = "駒込"; hiragana = "こまごめ"; alphabet = "komagome"; line = "南北線" };
    {
      kanji = "西ヶ原";
      hiragana = "にしがはら";
      alphabet = "nishigahara";
      line = "南北線";
    };
    { kanji = "王子"; hiragana = "おうじ"; alphabet = "oji"; line = "南北線" };
    {
      kanji = "王子神谷";
      hiragana = "おうじかみや";
      alphabet = "ojikamiya";
      line = "南北線";
    };
    { kanji = "志茂"; hiragana = "しも"; alphabet = "shimo"; line = "南北線" };
    {
      kanji = "赤羽岩淵";
      hiragana = "あかばねいわぶち";
      alphabet = "akabaneiwabuchi";
      line = "南北線";
    };
    {
      kanji = "西船橋";
      hiragana = "にしふなばし";
      alphabet = "nishi-funabashi";
      line = "東西線";
    };
    {
      kanji = "原木中山";
      hiragana = "ばらきなかやま";
      alphabet = "baraki-nakayama";
      line = "東西線";
    };
    { kanji = "妙典"; hiragana = "みょうでん"; alphabet = "myoden"; line = "東西線" };
    { kanji = "行徳"; hiragana = "ぎょうとく"; alphabet = "gyotoku"; line = "東西線" };
    {
      kanji = "南行徳";
      hiragana = "みなみぎょうとく";
      alphabet = "minami-gyotoku";
      line = "東西線";
    };
    { kanji = "浦安"; hiragana = "うらやす"; alphabet = "urayasu"; line = "東西線" };
    { kanji = "葛西"; hiragana = "かさい"; alphabet = "kasai"; line = "東西線" };
    {
      kanji = "西葛西";
      hiragana = "にしかさい";
      alphabet = "nishi-kasai";
      line = "東西線";
    };
    {
      kanji = "南砂町";
      hiragana = "みなみすなまち";
      alphabet = "minami-sunamachi";
      line = "東西線";
    };
    {
      kanji = "東陽町";
      hiragana = "とうようちょう";
      alphabet = "touyoucho";
      line = "東西線";
    };
    { kanji = "木場"; hiragana = "きば"; alphabet = "kiba"; line = "東西線" };
    {
      kanji = "門前仲町";
      hiragana = "もんぜんなかちょう";
      alphabet = "monzen-nakacho";
      line = "東西線";
    };
    { kanji = "茅場町"; hiragana = "かやばちょう"; alphabet = "kayabacho"; line = "東西線" };
    { kanji = "日本橋"; hiragana = "にほんばし"; alphabet = "nihonbashi"; line = "東西線" };
    { kanji = "大手町"; hiragana = "おおてまち"; alphabet = "otemachi"; line = "東西線" };
    { kanji = "竹橋"; hiragana = "たけばし"; alphabet = "takebashi"; line = "東西線" };
    { kanji = "九段下"; hiragana = "くだんした"; alphabet = "kudanshita"; line = "東西線" };
    { kanji = "飯田橋"; hiragana = "いいだばし"; alphabet = "iidabashi"; line = "東西線" };
    { kanji = "神楽坂"; hiragana = "かぐらざか"; alphabet = "kagurazaka"; line = "東西線" };
    { kanji = "早稲田"; hiragana = "わせだ"; alphabet = "waseda"; line = "東西線" };
    {
      kanji = "高田馬場";
      hiragana = "たかだのばば";
      alphabet = "takadanobaba";
      line = "東西線";
    };
    { kanji = "落合"; hiragana = "おちあい"; alphabet = "ochiai"; line = "東西線" };
    { kanji = "中野"; hiragana = "なかの"; alphabet = "nakano"; line = "東西線" };
    { alphabet = "shinkiba"; hiragana = "しんきば"; kanji = "新木場"; line = "有楽町線" };
    { alphabet = "tatsumi"; hiragana = "たつみ"; kanji = "辰巳"; line = "有楽町線" };
    { alphabet = "toyosu"; hiragana = "とよす"; kanji = "豊洲"; line = "有楽町線" };
    { alphabet = "tsukishima"; hiragana = "つきしま"; kanji = "月島"; line = "有楽町線" };
    {
      alphabet = "shintomityou";
      hiragana = "しんとみちょう";
      kanji = "新富町";
      line = "有楽町線";
    };
    {
      alphabet = "ginzaittyoume";
      hiragana = "ぎんざいっちょうめ";
      kanji = "銀座一丁目";
      line = "有楽町線";
    };
    {
      alphabet = "yuurakutyou";
      hiragana = "ゆうらくちょう";
      kanji = "有楽町";
      line = "有楽町線";
    };
    {
      alphabet = "sakuradamon";
      hiragana = "さくらだもん";
      kanji = "桜田門";
      line = "有楽町線";
    };
    {
      alphabet = "nagatacho";
      hiragana = "ながたちょう";
      kanji = "永田町";
      line = "有楽町線";
    };
    { alphabet = "koujimachi"; hiragana = "こうじまち"; kanji = "麹町"; line = "有楽町線" };
    { alphabet = "ichigaya"; hiragana = "いちがや"; kanji = "市ヶ谷"; line = "有楽町線" };
    { alphabet = "iidabashi"; hiragana = "いいだばし"; kanji = "飯田橋"; line = "有楽町線" };
    {
      kanji = "江戸川橋";
      hiragana = "えどがわばし";
      alphabet = "edogawabasi";
      line = "有楽町線";
    };
    { kanji = "護国寺"; hiragana = "ごこくじ"; alphabet = "gokokuji"; line = "有楽町線" };
    {
      kanji = "東池袋";
      hiragana = "ひがしいけぶくろ";
      alphabet = "higasiikebukuro";
      line = "有楽町線";
    };
    { kanji = "池袋"; hiragana = "いけぶくろ"; alphabet = "ikebukuro"; line = "有楽町線" };
    {
      kanji = "要町";
      hiragana = "かなめちょう";
      alphabet = "hiragakanjityou";
      line = "有楽町線";
    };
    { kanji = "千川"; hiragana = "せんかわ"; alphabet = "senkawa"; line = "有楽町線" };
    {
      kanji = "小竹向原";
      hiragana = "こたけむかいはら";
      alphabet = "kotakemukaihara";
      line = "有楽町線";
    };
    { kanji = "氷川台"; hiragana = "ひかわだい"; alphabet = "hikawadai"; line = "有楽町線" };
    { kanji = "平和台"; hiragana = "へいわだい"; alphabet = "heiwadai"; line = "有楽町線" };
    {
      kanji = "営団赤塚";
      hiragana = "えいだんあかつか";
      alphabet = "eidanakakuka";
      line = "有楽町線";
    };
    {
      kanji = "営団成増";
      hiragana = "えいだんなります";
      alphabet = "eidannarimasu";
      line = "有楽町線";
    };
    { kanji = "和光市"; hiragana = "わこうし"; alphabet = "wakousi"; line = "有楽町線" };
  ]
