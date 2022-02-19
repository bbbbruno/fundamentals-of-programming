(* 目的：整数のリストを受け取ったら、その中の偶数の要素のみを含むリストを返す *)
(* even : int list -> int list *)
let rec even lst = List.filter (fun n -> n mod 2 = 0) lst

(* テスト *)
let test1 = even [] = []
let test2 = even [ 1 ] = []
let test3 = even [ 1; 3; 5; 7 ] = []
let test4 = even [ 2; 3; 6; 7; 9; 14; 15 ] = [ 2; 6; 14 ]
let test5 = even [ 2; 4; 16; 24; 30 ] = [ 2; 4; 16; 24; 30 ]

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
  List.length (List.filter (fun p -> p.blood_type = "A") lst)

(* テスト *)
let test6 = count_blood_type_A lst1 = 0
let test7 = count_blood_type_A lst2 = 0
let test8 = count_blood_type_A lst3 = 1
let test9 = count_blood_type_A lst4 = 1
let test10 = count_blood_type_A lst5 = 2

(* 目的：文字列のリストを受け取ったら、その中の要素を前から順に全部くっつけた文字列を返す *)
(* concat : string list -> string *)
let rec concat lst = List.fold_right (fun x y -> x ^ y) lst ""

(* テスト *)
let test11 = concat [] = ""
let test12 = concat [ "本" ] = "本"
let test13 = concat [ "春"; "夏"; "秋"; "冬" ] = "春夏秋冬"

(* 学生一人分のデーターを表す型 *)
type student_t = {
  name : string; (* 名前 *)
  score : int; (* 点数 *)
  grade : string; (* 成績 *)
}

(* 学生のデータの例 *)
let student1 = { name = "nakamura"; score = 90; grade = "A" }
let student2 = { name = "miyahara"; score = 80; grade = "A" }
let student3 = { name = "sato"; score = 75; grade = "B" }
let student4 = { name = "idehara"; score = 70; grade = "B" }
let student5 = { name = "tsubata"; score = 65; grade = "C" }
let student6 = { name = "asai"; score = 60; grade = "C" }

(* 学生のリストの例 *)
let lst1 = []
let lst2 = [ student2 ]
let lst3 = [ student3; student4 ]
let lst4 = [ student4; student3 ]
let lst5 = [ student4; student1; student6; student5; student2; student3 ]

(* 目的：student_t型のリストを受け取ると、全員の得点の合計を求める *)
(* student_sum : student_t list -> int *)
let student_sum lst = List.fold_right (fun s m -> s.score + m) lst 0

(* テスト *)
let test14 = student_sum lst1 = 0
let test15 = student_sum lst2 = 80
let test16 = student_sum lst3 = 145
let test17 = student_sum lst4 = 145
let test18 = student_sum lst5 = 440
