import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude, map1, funLit1, filter1, replicate1, takeDrop1, reverse1,
	concatenate1, epilogue
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

filter1 :: Page
filter1 = pageTitle "関数filter" :| [
	text "リストから条件を満たす値だけ取り出す関数",
	text "リストから奇数だけを取り出してみる",
	itext 4 "> filter odd [1, 2, 3, 4, 5]",
	itext 4 "[1,3,5]",
	text "第1引数である関数oddによって奇数かどうかを判定"
	]

replicate1 :: Page
replicate1 = pageTitle "関数replicate" :| [
	text "おなじ値をくりかえしたリストを作成する",
	itext 4 "> replicate 10 123",
	itext 4 "[123,123,123,123,123,123,123,123,123,123]",
	text "整数値123を10回くりかえしたリストだ"
	]

takeDrop1 :: Page
takeDrop1 = pageTitle "関数take, drop" :| [
	text "リストの前のほうのいくつかを取り出す",
	itext 4 "> take 3 [1, 2, 3, 4, 5]",
	itext 4 "[1,2,3]",
	text "リストの前のほうのいくつかを落とす",
	itext 4 "> drop 3 [1, 2, 3, 4, 5]",
	itext 4 "[4,5]",
	text "それぞれ",
	itext 4 "前のほうの3つの要素",
	itext 4 "前のほうの3つ以外の要素",
	itext 2 "が取り出されている"
	]

reverse1 :: Page
reverse1 = pageTitle "関数reverse" :| [
	text "リストを逆順にする関数",
	itext 4 "> reverse [1, 2, 3, 4, 5]",
	itext 4 "[5,4,3,2,1]",
	text "リストが逆順になった"
	]

concatenate1 :: Page
concatenate1 = pageTitle "演算子(++)" :| [
	text "ふたつのリストを結合する",
	itext 4 "> [1, 2, 3] ++ [4, 5]",
	itext 4 "[1,2,3,4,5]",
	text "リストが結合された",
	text "Haskellでのデフォルトの文字列は文字のリスト",
	text "なので文字列は演算子(++)で結合できる",
	itext 4 "> \"Hello\" ++ \"World\"",
	itext 4 "\"HelloWorld\""
	]

epilogue :: Page
epilogue = pageTitle "再帰的に定義できる" :| [
	text "ここまで紹介してきた関数(mapから演算子(++)まで)は",
	itext 4 "どれも自分で定義することができる",
	text "定義は再帰的になる",
	text "時間の関係で、ここでは説明しない",
	text "これらの関数を使いこなせるようになろう",
	text "ここで学んだ関数は以下のとおり",
	itext 4 "map, filter, replicate",
	itext 4 "take, drop, reverse, (++)"
	]
