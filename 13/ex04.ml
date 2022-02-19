let compose f g =
  let h x = f (g x) in
  h

let time2 n = n * 2
let add3 n = n + 3
let test = (compose time2 add3) 4 = 14
