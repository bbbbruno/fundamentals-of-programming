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
    blood_type = "A";
  }

let person2 =
  {
    name = "吉田誠";
    height = 1.76;
    weight = 68.1;
    birth_month = 9;
    birth_day = 2;
    blood_type = "B";
  }

let person3 =
  {
    name = "金子健";
    height = 1.73;
    weight = 65.8;
    birth_month = 12;
    birth_day = 24;
    blood_type = "O";
  }

(* person_t list 型のデータの例 *)
let lst1 = []
let lst2 = [ person1 ]
let lst3 = [ person2 ]
let lst4 = [ person1; person2; person3 ]
let lst5 = [ person2; person1; person1 ]

(* 目的：人のリスト lst のうち各血液型の人が何人いるのかを集計する *)
(* aggregate_blood_type : person_t list -> int * int * int * int *)
let rec aggregate_blood_type lst =
  match lst with
  | [] -> (0, 0, 0, 0)
  | { name = n; height = h; birth_month = bm; birth_day = bd; blood_type = bt }
    :: rest ->
      let a, o, b, ab = aggregate_blood_type rest in
      if bt = "A" then (a + 1, o, b, ab)
      else if bt = "O" then (a, o + 1, b, ab)
      else if bt = "B" then (a, o, b + 1, ab)
      else (a, o, b, ab + 1)

(* テスト *)
let test1 = aggregate_blood_type lst1 = (0, 0, 0, 0)
let test2 = aggregate_blood_type lst2 = (1, 0, 0, 0)
let test3 = aggregate_blood_type lst3 = (0, 0, 1, 0)
let test4 = aggregate_blood_type lst4 = (1, 1, 1, 0)
let test5 = aggregate_blood_type lst5 = (2, 0, 1, 0)
