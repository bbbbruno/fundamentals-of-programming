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
let lst = [ person1; person2; person3 ]

(* 目的：person_t型から名前を取り出す *)
(* take_name person_t -> string *)
let take_name p =
  match p with
  | {
   name = n;
   height = h;
   weight = w;
   birth_month = bm;
   birth_day = bd;
   blood_type = bt;
  } ->
      n

(* テスト *)
let test1 = take_name person1 = "浅井里奈"
let test2 = take_name person2 = "吉田誠"
let test3 = take_name person3 = "金子健"

(* 目的：person_t型をリストを受け取ると、その中の人の名前のリストを返す *)
(* person_names : person_t list -> string list *)
let person_names lst = List.map take_name lst

(* テスト *)
let test4 = person_names [] = []
let test7 = person_names lst = [ "浅井里奈"; "吉田誠"; "金子健" ]
