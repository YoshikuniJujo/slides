import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude,
	application1, application2, application3
	]

titlePage :: Page
titlePage = writeTitle
	"Haskell入門ハンズオン! #2" "4. いくつかの関数を学ぶ(1)" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "Haskellで、はじめから定義されている関数のうちの",
	itext 4 "いくつかを紹介する",
	text "紹介するのは、つぎの、3個の演算子と10個の関数",
	itext 4 "演算子($), (.)",
	itext 4 "map, filter, replicate, take, drop, reverse",
	itext 4 "演算子(++)",
	itext 4 "randoms, mkStdGen",
	itext 4 "unlines",
	itext 4 "read",
	text "ざっくりと、使いかたのみを紹介する"
	]

application1 :: Page
application1 = pageTitle "関数適用演算子" :| [
	text "関数適用演算子($)を紹介する",
	text "ここで、逆数をもとめる関数recipについて考える",
	itext 4 "> recip 8",
	itext 4 "0.125",
	text "これは、「関数recipを数値8に適用した」ということ",
	text "演算子($)は、第1引数の関数を第2引数の値に適用する",
	itext 4 "> recip $ 8",
	itext 4 "0.125",
	text "「なぜ、こんな演算子が定義されているのだろう?」",
	text "「必要ないのでは?」"
	]

application2 :: Page
application2 = pageTitle "関数適用演算子" :| [
	text "関数適用演算子($)のレーゾンデートル(存在意義)は?",
	text "つぎの例をみてみよう",
	itext 4 "> logBase 2 (recip (3 + 5))",
	itext 4 "-3.0",
	text "3 + 5の逆数が2の何乗であるかをもとめている",
	text "このくらいならいいが、「逆数の対数の絶対値の...」",
	itext 4 "のように、長々と続いていくことを考えよう",
	itext 4 "abs (logBase 2 (recip (...)))",
	text "最後に閉じ括弧が...)))))))のように続くことになる",
	text "つぎの例をみてみよう",
	itext 4 "> logBase 2 $ recip $ 3 + 5",
	itext 4 "-3.0"
	]

application3 :: Page
application3 = pageTitle "関数適用演算子" :| [
	text "関数適用演算子($)なら...))))))のようにはならない",
	text "関数の適用の連鎖が長々と続いたする",
	itext 4 "abs $ logBase 2 $ recip $ ...",
	text "丸括弧が入れ子になるよりスマートに書ける",
	text "Lisperの人はいますか?",
	text "けっして、Lispをディスっているわけではありません"
	]
