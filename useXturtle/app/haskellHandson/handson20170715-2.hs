import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	whatsRecursion, sumN, listVsRecursion, amount
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

listVsRecursion :: Page
listVsRecursion = pageTitle "単純な「くりかえし」でない例" :| [
	text "単純な「くりかえし」には、リストが使える",
	text "直接、再帰を使うよりも、リストのほうがわかりやすい",
	text "単純な「くりかえし」ではないような例を考える",
	text "1円玉から100円玉を使って200円をはらう、はらいかたの数",
	text "どう考えるか?",
	text "200円のはらいかたを分類すると、つぎのふたつ",
	itext 4 "1. 100円玉を1枚以上使う",
	itext 4 "2. 100円玉を使わない",
	text "1は、1円玉から100円玉を使って100をはらう",
	itext 4 "はらいかたの数に等しい",
	text "わかりますか?"
	]

amount :: Page
amount = pageTitle "お金のはらいかた" :| [
	text "1円玉から100円玉を使って200円をはらうとは",
	itext 4 "1円玉から100円玉を使って100円をはらう、と",
	itext 4 "1円玉から50円玉を使って200円はらう",
	text "ということ",
	text "それぞれについて、さらに分類していくことができる",
	text "コードにしてみましょう"
	]
