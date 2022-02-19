let twice f x = f (f x)
let g = twice twice
let h = g (fun x -> x + 1)
let test = h 3 = 7
let g x = (twice twice) x
let h = g (fun x -> x + 1)
let test = h 3 = 7
