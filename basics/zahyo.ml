(* 平面座標の組（x, y）を受け取ったら、x軸について対象な点の座標の組を返す *)
(* taisho_x : int * int -> int * int *)
let taisho_x zahyo = match zahyo with a, b -> (-a, b)

(* テスト *)
let test1 = taisho_x (3, 4) = (-3, 4)
let test2 = taisho_x (-2, 6) = (2, 6)
let test2 = taisho_x (-5, -10) = (5, -10)

(* 平面座標の組（x, y）をふたつ受け取ったら、その中点の座標の組を返す *)
(* taisho_x : float * float -> float * float -> float * float *)
let chuten zahyo1 zahyo2 =
  match zahyo1 with
  | a, b -> ( match zahyo2 with c, d -> ((a +. c) /. 2., (b +. d) /. 2.))

(* テスト *)
let test1 = chuten (3., 4.) (5., 8.) = (4., 6.)
let test2 = chuten (-2., 6.) (7., -2.) = (2.5, 2.)
let test2 = chuten (-5., -10.) (-9., -1.) = (-7., -5.5)
