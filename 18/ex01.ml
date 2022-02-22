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

(* 目的：person_t型のリストを受け取ると、その中から最初のA型の人を返す *)
(* first_A : person_t list -> person_t *)
let rec first_A lst =
  match lst with
  | [] -> None
  | first :: rest -> if first.blood_type = "A" then Some first else first_A rest

(* テスト *)
let test1 = first_A lst1 = None
let test2 = first_A lst2 = None
let test3 = first_A lst3 = Some person2
let test4 = first_A lst4 = Some person2
let test5 = first_A lst5 = Some person3
