(* 目的：鶴の数を与えられたら、鶴の足の本数を返す *)
(* tsuru_no_ashi : int -> int *)
let tsuru_no_ashi x = x * 2
let test1 = tsuru_no_ashi 2 = 4
let test1 = tsuru_no_ashi 10 = 20
let test1 = tsuru_no_ashi 34 = 68

(* 目的：亀の数を与えられたら、亀の足の本数を返す *)
(* kame_no_ashi : int -> int *)
let kame_no_ashi x = x * 4
let test1 = kame_no_ashi 2 = 8
let test1 = kame_no_ashi 10 = 40
let test1 = kame_no_ashi 34 = 136

(* 目的：鶴の数と亀の数を与えられたら、足の数の合計を返す *)
(* tsurukame_no_ashi : int -> int -> int *)
let tsurukame_no_ashi x y = tsuru_no_ashi x + kame_no_ashi y
let test1 = tsurukame_no_ashi 5 2 = 18
let test1 = tsurukame_no_ashi 10 17 = 88
let test1 = tsurukame_no_ashi 42 34 = 220

(* 目的：鶴と亀の数の合計と足の数の合計を与えられたら、鶴の数を返す *)
(* tsurukame : int -> int -> int *)
let tsurukame x y = (x * 2) - (y / 2)
let test1 = tsurukame 7 18 = 5
let test1 = tsurukame 27 88 = 10
let test1 = tsurukame 76 220 = 42
