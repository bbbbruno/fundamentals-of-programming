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

(* 目的：二つの得点の合計を求める *)
(* sum : int -> int -> int *)
let add_score first rest_result =
  match first with { name = n; score = s; grade = g } -> s + rest_result

(* 目的：student_t型のリストを受け取ると、全員の得点の合計を求める *)
(* student_sum : student_t list -> int *)
let student_sum lst = List.fold_right add_score lst 0

(* テスト *)
let test1 = student_sum lst1 = 0
let test2 = student_sum lst2 = 80
let test3 = student_sum lst3 = 145
let test4 = student_sum lst4 = 145
let test5 = student_sum lst5 = 440
