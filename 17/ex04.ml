(* 日付を表す型 *)
type year_t =
  | January of int
  | February of int
  | March of int
  | April of int
  | May of int
  | June of int
  | July of int
  | August of int
  | September of int
  | October of int
  | November of int
  | December of int

(* 12星座を表す型 *)
type zodiac_t =
  | Capricorn
  | Aquarius
  | Pisces
  | Aries
  | Taurus
  | Gemini
  | Cancer
  | Leo
  | Virgo
  | Libra
  | Scorpio
  | Sagittarius

(* 目的：year_t型をzodiac型に変換する *)
(* to_zodiac : year_t -> zodiac_t *)
let to_zodiac year =
  match year with
  | January n -> if n <= 19 then Capricorn else Aquarius
  | February n -> if n <= 18 then Aquarius else Pisces
  | March n -> if n <= 20 then Pisces else Aries
  | April n -> if n <= 19 then Aries else Taurus
  | May n -> if n <= 20 then Taurus else Gemini
  | June n -> if n <= 21 then Gemini else Cancer
  | July n -> if n <= 22 then Cancer else Leo
  | August n -> if n <= 22 then Leo else Virgo
  | September n -> if n <= 22 then Virgo else Libra
  | October n -> if n <= 23 then Libra else Scorpio
  | November n -> if n <= 22 then Scorpio else Sagittarius
  | December n -> if n <= 21 then Sagittarius else Capricorn

(* テスト *)
let test1 = to_zodiac (June 11) = Gemini
let test2 = to_zodiac (June 30) = Cancer
let test3 = to_zodiac (September 17) = Virgo
let test4 = to_zodiac (October 7) = Libra
