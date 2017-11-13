import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude, map1, funLit1
	]

titlePage :: Page
titlePage = writeTitle
	"Haskell入門ハンズオン! #2" "5. いくつかの関数を学ぶ(1)" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "Haskellで、はじめから定義されている関数のうちの",
	itext 4 "いくつかを紹介する",
	text "紹介するのは、つぎの、11個の関数(演算子)",
	itext 4 "いくつかの関数を学ぶ(1)",
	itext 8 "関数map, filter, take, drop",
	itext 8 "関数replicate, reverse",
	itext 8 "演算子(++)",
	itext 4 "いくつかの関数を学ぶ(2)",
	itext 8 "関数randoms, mkStdGen",
	itext 8 "関数unlines",
	itext 8 "関数read",
	text "ざっくりと、使いかたのみを紹介する"
	]

map1 :: Page
map1 = pageTitle "関数map" :| [
	text "関数mapは、リストのすべてについて、おなじ変換をする",
	text "「変換」をあらわす関数を第1引数とする",
	itext 4 "> double x = x * 2",
	itext 4 "> map double [1, 2, 3, 4, 5]",
	itext 4 "[2,4,6,8,10]",
	text "第1引数に「引数を2倍にする関数」をとり",
	itext 4 "リストのすべての要素に、それを適用している"
	]

funLit1 :: Page
funLit1 = pageTitle "関数リテラル" :| [
	text "ところで、関数mapの第1引数とするために",
	itext 4 "つぎのような関数を定義した",
	itext 4 "double x = x * 2",
	text "この関数doubleを、これ以降、使う予定がないとする",
	text "それなのに、いちいち名前をつけるのは、めんどうだ",
	text "このようなとき関数リテラル(無名関数)を使う",
	itext 4 "> map (\\x -> x * 2) [1, 2, 3, 4, 5]",
	itext 4 "[2,4,6,8,10]",
	text "関数リテラルの記法は、つぎのようになる",
	itext 4 "\\[仮引数1] [仮引数2] ... -> [式]"
	]
