(* 目的：文字列を受け取ると、その文字列に呼ばれるごとに異なる数字をつけた文字列を返す *)
(* gensym : string -> string *)
let count = ref (-1)

let gensym s =
  count := !count + 1;
  s ^ string_of_int !count

(* テスト *)
let test1 = gensym "a" = "a0"
let test2 = gensym "a" = "a1"
let test3 = gensym "x" = "x2"
