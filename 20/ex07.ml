module Set : sig
  type 'a t (* 要素の型が'aの集合の型 *)

  val empty : 'a t (* 空集合 *)

  val singleton : 'a -> 'a t (* 要素ひとつからなる集合 *)

  val union : 'a t -> 'a t -> 'a t (* 和集合 *)

  val inter : 'a t -> 'a t -> 'a t (* 共通部分 *)

  val diff : 'a t -> 'a t -> 'a t (* 差集合 *)

  val mem : 'a -> 'a t -> bool (* 要素が集合に入っているか *)
end = struct
  type 'a t = 'a list

  let empty = []
  let singleton elm = [ elm ]

  let union set1 set2 =
    List.fold_left
      (fun result elm -> if List.mem elm result then result else elm :: result)
      set2 set1

  let inter set1 set2 =
    List.fold_left
      (fun result elm -> if List.mem elm set2 then elm :: result else result)
      [] set1

  let diff set1 set2 =
    List.fold_left
      (fun result elm -> if List.mem elm set2 then result else elm :: result)
      set2 set1

  let mem elm set = List.mem elm set
end
