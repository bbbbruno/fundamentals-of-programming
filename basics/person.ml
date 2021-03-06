(* 一人分の情報を表す型 *)
type person_t = {
  name : string; (* 名前 *)
  height : float; (* 身長（m） *)
  weight : float; (* 体重（kg） *)
  birth_month : int; (* 誕生月 *)
  birth_day : int; (* 誕生日 *)
  blood_type : string; (* 血液型 *)
}

(* personのデータの例 *)
let person1 =
  {
    name = "浅井里奈";
    height = 1.62;
    weight = 57.7;
    birth_month = 3;
    birth_day = 13;
    blood_type = "B";
  }

let person2 =
  {
    name = "吉田誠";
    height = 1.76;
    weight = 68.1;
    birth_month = 9;
    birth_day = 2;
    blood_type = "A";
  }

let person3 =
  {
    name = "金子健";
    height = 1.73;
    weight = 65.8;
    birth_month = 12;
    birth_day = 24;
    blood_type = "A";
  }

(* person_t list 型のデータの例 *)
let lst1 = []
let lst2 = [ person1 ]
let lst3 = [ person1; person2 ]
let lst4 = [ person2; person1 ]
let lst5 = [ person3; person1; person2 ]

(* 目的：person_t型のリストを受け取ったら、血液型がA型の人の数を返す *)
(* count_blood_type_A : person_t list -> int *)
let rec count_blood_type_A lst =
  match lst with
  | [] -> 0
  | {
      name = n;
      height = h;
      weight = w;
      birth_month = bm;
      birth_day = bd;
      blood_type = bt;
    }
    :: rest ->
      if bt = "A" then 1 + count_blood_type_A rest else count_blood_type_A rest

(* テスト *)
let test1 = count_blood_type_A lst1 = 0
let test2 = count_blood_type_A lst2 = 0
let test3 = count_blood_type_A lst3 = 1
let test4 = count_blood_type_A lst4 = 1
let test4 = count_blood_type_A lst5 = 2

(* 誕生日（月と日）を受け取ったら、星座を返す *)
(* int -> int -> string *)
let seiza month day =
  if (month = 3 && day >= 21) || (month = 4 && day <= 19) then "牡羊座"
  else if (month = 4 && day >= 20) || (month = 5 && day <= 20) then "牡牛座"
  else if (month = 5 && day >= 21) || (month = 6 && day <= 21) then "双子座"
  else if (month = 6 && day >= 22) || (month = 7 && day <= 22) then "蟹座"
  else if (month = 7 && day >= 23) || (month = 8 && day <= 22) then "獅子座"
  else if (month = 8 && day >= 23) || (month = 9 && day <= 22) then "乙女座"
  else if (month = 9 && day >= 23) || (month = 10 && day <= 23) then "天秤座"
  else if (month = 10 && day >= 24) || (month = 11 && day <= 22) then "蠍座"
  else if (month = 11 && day >= 23) || (month = 12 && day <= 21) then "射手座"
  else if (month = 12 && day >= 22) || (month = 1 && day <= 19) then "山羊座"
  else if (month = 1 && day >= 20) || (month = 2 && day <= 18) then "水瓶座"
  else if (month = 2 && day >= 19) || (month = 3 && day <= 20) then "魚座"
  else ""

(* テスト *)
let test1 = seiza 4 13 = "牡羊座"
let test2 = seiza 4 20 = "牡牛座"
let test3 = seiza 6 18 = "双子座"
let test4 = seiza 6 30 = "蟹座"
let test5 = seiza 7 25 = "獅子座"
let test6 = seiza 9 22 = "乙女座"
let test7 = seiza 10 1 = "天秤座"
let test8 = seiza 11 12 = "蠍座"
let test9 = seiza 12 8 = "射手座"
let test10 = seiza 12 25 = "山羊座"
let test11 = seiza 2 14 = "水瓶座"
let test12 = seiza 2 20 = "魚座"

(* 目的：person_t型のリストを受け取ったら、乙女座の人の名前のみからなるリストを返す *)
(* collect_virgo : person_t list -> string list *)
let rec collect_virgo lst =
  match lst with
  | [] -> []
  | {
      name = n;
      height = h;
      weight = w;
      birth_month = bm;
      birth_day = bd;
      blood_type = bt;
    }
    :: rest ->
      if seiza bm bd = "乙女座" then n :: collect_virgo rest
      else collect_virgo rest

(* テスト *)
let test1 = collect_virgo lst1 = []
let test2 = collect_virgo lst2 = []
let test3 = collect_virgo lst3 = [ "吉田誠" ]
let test4 = collect_virgo lst4 = [ "吉田誠" ]
let test4 = collect_virgo lst5 = [ "吉田誠" ]

(* 目的：昇順に並んでいるperson_t型のリストの正しい位置にpersonを挿入する *)
(* person_insert : person_t list -> person_t -> person_t list *)
let rec person_insert lst person0 =
  match lst with
  | [] -> [ person0 ]
  | ({
       name = n;
       height = h;
       weight = w;
       birth_month = bm;
       birth_day = bd;
       blood_type = bt;
     } as person)
    :: rest -> (
      match person0 with
      | {
       name = n0;
       height = h0;
       weight = w0;
       birth_month = bm0;
       birth_day = bd0;
       blood_type = bt0;
      } ->
          if n0 <= n then person0 :: person :: rest
          else person :: person_insert rest person0)

(* テスト *)
let test1 = person_insert [] person1 = [ person1 ]
let test2 = person_insert [ person2 ] person1 = [ person2; person1 ]
let test3 = person_insert [ person1 ] person2 = [ person2; person1 ]

let test4 =
  person_insert [ person1; person2 ] person3 = [ person1; person2; person3 ]

(* 目的：person_tのリストを受け取ると、それをnameフィールドの順に整列したリストを返す *)
(* person_ins_sort : person_t list -> person_t list *)
let rec person_ins_sort lst =
  match lst with
  | [] -> []
  | first :: rest -> person_insert (person_ins_sort rest) first

(* テスト *)
let test5 = person_ins_sort lst1 = []
let test6 = person_ins_sort lst2 = [ person1 ]
let test7 = person_ins_sort lst3 = [ person2; person1 ]
let test8 = person_ins_sort lst4 = [ person2; person1 ]
let test9 = person_ins_sort lst5 = [ person2; person1; person3 ]
