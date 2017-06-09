import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	whatsRecursion, sumN
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン!" "2. 再帰" :| []

whatsRecursion :: Page
whatsRecursion = pageTitle "再帰とは" :| [
	text "関数の定義のなかに、その関数自体が出てくる",
	text "「くりかえし」は再帰で表現できる",
	text "単純な「くりかえし」以上のことも表現できる"
	]

sumN :: Page
sumN = pageTitle "1からNまでの和" :| [
	text "1からNまでの和を、再帰で定義すると",
	itext 4 "1. 1から1までの和は1",
	itext 4 "2. 1からNまでの和は",
	itext 8 "1からN - 1までの和に、Nを足したもの",
	text "コードを書く",
	itext 4 "% vim recursion.hs",
	itext 4 "sumN 1 = 1",
	itext 4 "sumN n = sumN (n - 1) + n",
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load recursion.hs",
	itext 4 "*Main> sumN 10",
	itext 4 "55"
	]
