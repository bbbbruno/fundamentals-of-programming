(* 一人分の情報を表す型 *)
type person_t = {
  name : string; (* 名前 *)
  height : float; (* 身長（m） *)
  weight : float; (* 体重（kg） *)
  birth_month : int; (* 誕生月 *)
  birth_day : int; (* 誕生日 *)
  blood_type : string; (* 血液型 *)
}

let test =
  (fun p -> p.name)
    {
      name = "浅井里奈";
      height = 1.62;
      weight = 57.7;
      birth_month = 3;
      birth_day = 13;
      blood_type = "B";
    }
  = "浅井里奈"
