(* 時間を受け取ったら、それが午前か午後かを返す *)
(* int -> string *)
let jikan time = if time < 12 then "午前" else "午後"

(* テスト *)
let test1 = jikan 0 = "午前"
let test1 = jikan 5 = "午前"
let test1 = jikan 12 = "午後"
let test1 = jikan 17 = "午後"
