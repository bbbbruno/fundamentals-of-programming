(* 身長（m）と体重（kg）を与えられたら、BMI指数を返す *)
(* float -> float -> float *)
let bmi m kg = kg /. (m ** 2.)

(* テスト *)
let test1 = bmi 1.6 40. = 15.6249999999999964
let test1 = bmi 1.86 75. = 21.6788067984738078
let test1 = bmi 1.75 90. = 29.387755102040817

(* 身長（m）と体重（kg）を与えられたら、BMI指数を計算し、その数値によって体型を返す *)
(* float -> float -> string *)
let taikei m kg =
  if bmi m kg < 18.5 then "痩せ"
  else if 18.5 <= bmi m kg && bmi m kg < 25. then "標準"
  else if 25. <= bmi m kg && bmi m kg < 30. then "肥満"
  else "高度肥満"

let test1 = taikei 1.6 40. = "痩せ"
let test1 = taikei 1.86 75. = "標準"
let test1 = taikei 1.75 90. = "肥満"
let test1 = taikei 1.68 120. = "高度肥満"
