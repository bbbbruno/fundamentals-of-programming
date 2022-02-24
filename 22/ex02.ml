(* 目的：配列を与えると、そこにフィボナッチ数を順に入れた配列を返す *)
(* fib_array : int array -> int array *)
let fib_array arr =
  let len = Array.length arr in
  let rec loop i =
    if i < len then (
      if i = 0 then arr.(i) <- 0
      else if i = 1 then arr.(i) <- 1
      else arr.(i) <- arr.(i - 1) + arr.(i - 2);
      loop (i + 1))
    else ()
  in
  loop 0;
  arr

(* テスト *)
let test1 =
  fib_array [| 0; 0; 0; 0; 0; 0; 0; 0; 0; 0 |]
  = [| 0; 1; 1; 2; 3; 5; 8; 13; 21; 34 |]
