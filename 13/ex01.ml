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

(* 目的：person_t型のリストを受け取ったら、指定された血液型の人の数を返す *)
(* count_blood_type : person_t list -> string -> int *)
let rec count_blood_type lst bldtype =
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
      if bt = bldtype then 1 + count_blood_type rest bldtype
      else count_blood_type rest bldtype

(* テスト *)
let test1 = count_blood_type lst1 "A" = 0
let test2 = count_blood_type lst2 "A" = 0
let test3 = count_blood_type lst4 "A" = 1
let test4 = count_blood_type lst4 "B" = 1
let test5 = count_blood_type lst5 "A" = 2
let test6 = count_blood_type lst5 "B" = 1
let test7 = count_blood_type lst5 "O" = 0

(* 目的：person_t型のリストを受け取ったら、血液型がA型の人の数を返す *)
(* count_blood_type_A : person_t list -> int *)
let rec count_blood_type_A lst = count_blood_type lst "A"

(* テスト *)
let test8 = count_blood_type_A lst1 = 0
let test9 = count_blood_type_A lst2 = 0
let test10 = count_blood_type_A lst3 = 1
let test11 = count_blood_type_A lst4 = 1
let test12 = count_blood_type_A lst5 = 2
