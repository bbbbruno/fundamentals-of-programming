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

(* 目的：昇順に並んでいるlstの正しい位置にstudentを挿入する *)
(* student_insert : student_t list -> student_t -> student_t list *)
let rec student_insert lst student0 =
  match lst with
  | [] -> [ student0 ]
  | ({ name = n; score = s; grade = g } as student) :: rest -> (
      match student0 with
      | { name = n0; score = s0; grade = g0 } ->
          if s0 <= s then student0 :: student :: rest
          else student :: student_insert rest student0)

(* テスト *)
let test1 = student_insert [] student2 = [ student2 ]
let test2 = student_insert [ student4 ] student3 = [ student4; student3 ]
let test3 = student_insert [ student3 ] student4 = [ student4; student3 ]

let test4 =
  student_insert [ student6; student5; student3; student2; student1 ] student4
  = [ student6; student5; student4; student3; student2; student1 ]

(* student_tのリストを受け取ると、それをscoreフィールドの順に整列したリストを返す *)
(* student_sort : student_t list -> student_t list *)
let rec student_ins_sort lst =
  match lst with
  | [] -> []
  | first :: rest -> student_insert (student_ins_sort rest) first

(* テスト *)
let test5 = student_ins_sort lst1 = []
let test6 = student_ins_sort lst2 = [ student2 ]
let test7 = student_ins_sort lst3 = [ student4; student3 ]
let test8 = student_ins_sort lst4 = [ student4; student3 ]

let test9 =
  student_ins_sort lst5
  = [ student6; student5; student4; student3; student2; student1 ]
