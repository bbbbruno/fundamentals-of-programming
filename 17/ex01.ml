type era_t = Meiji of int | Taisho of int | Showa of int | Heisei of int

(* 目的：年号を受け取ったら対応する西暦年を返す。 *)
(* to_year : era_t -> int *)
let to_year era =
  match era with
  | Meiji n -> n + 1867
  | Taisho n -> n + 1911
  | Showa n -> n + 1925
  | Heisei n -> n + 1988

(* テスト *)
let test1 = to_year (Showa 42) = 1967
let test2 = to_year (Heisei 11) = 1999
let test3 = to_year (Meiji 41) = 1908

(* 目的：誕生年と現在の年をera_t型を与えると現在の年齢を返す。 *)
(* age : era_t -> era_t -> int *)
let age era1 era2 = to_year era2 - to_year era1

(* テスト *)
let test4 = age (Showa 42) (Heisei 18) = 39
let test5 = age (Heisei 11) (Heisei 18) = 7
let test6 = age (Meiji 41) (Heisei 17) = 97
