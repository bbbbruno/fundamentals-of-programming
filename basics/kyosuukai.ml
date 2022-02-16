(* 2次方程式（ax^2 + bx + c = 0）の係数 a, b, c が与えられたら、その判別式の値を返す *)
(* float -> float -> float -> float *)
let hanbetsushiki a b c = (b ** 2.) -. (4. *. a *. c)

(* テスト *)
let test1 = hanbetsushiki 4. 4. 1. = 0.
let test1 = hanbetsushiki 5. 15. 10. = 25.
let test1 = hanbetsushiki 4. 17. 33. = -239.

(* 2次方程式（ax^2 + bx + c = 0）の係数 a, b, c が与えられたら、その解の個数を返す *)
(* float -> float -> float -> int *)
let kai_no_kosuu a b c =
  if hanbetsushiki a b c > 0. then 2
  else if hanbetsushiki a b c = 0. then 1
  else 0

(* テスト *)
let test1 = kai_no_kosuu 4. 4. 1. = 1
let test1 = kai_no_kosuu 5. 15. 10. = 2
let test1 = kai_no_kosuu 4. 17. 33. = 0

(* 2次方程式（ax^2 + bx + c = 0）の係数 a, b, c が与えられたら、虚数解を持つかどうかを判定する *)
(* float -> float -> float -> bool *)
let kyosuukai a b c = if kai_no_kosuu a b c = 0 then true else false

(* テスト *)
let test1 = kyosuukai 4. 4. 1. = false
let test1 = kyosuukai 5. 15. 10. = false
let test1 = kyosuukai 4. 17. 33. = true
