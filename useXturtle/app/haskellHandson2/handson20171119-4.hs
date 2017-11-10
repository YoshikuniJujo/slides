import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
--	prelude,
	application1, application2, application3,
	composition1, composition2,
	appToComp1, appToComp2, appToComp3, appToComp4
	]

titlePage :: Page
titlePage = writeTitle
	"Haskell入門ハンズオン! #2" "4. 関数適用演算子と関数合成演算子" :| []

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

composition1 :: Page
composition1 = pageTitle "関数合成演算子" :| [
	text "関数合成演算子を紹介する",
	text "小文字にして文字コードをもとめる関数",
	itext 4 "> :module Data.Char",
	itext 4 "> fun c = ord (toLower c)",
	itext 4 "> fun 'Y'",
	itext 4 "121",
	text "この関数funは関数ordとtoLowerとを、くっつけたもの",
	text "このように「くっつける」ことを「関数合成」と呼ぶ",
	text "関数合成演算子(.)を使った関数fun2はつぎのようになる",
	itext 4 "> fun2 = ord . toLower",
	itext 4 "> fun2 'Y'",
	itext 4 "121"
	]

composition2 :: Page
composition2 = pageTitle "関数合成演算子" :| [
	text "関数funとfun2の定義を再掲する",
	itext 4 "fun c = ord (toLower c)",
	itext 4 "fun2 = ord . toLower",
	text "関数funの定義よりもfun2の定義のほうが",
	itext 4 "より直接的に、つぎの意味を表せている",
	text "「小文字化して、文字コードをもとめる」"
	]

appToComp1 :: Page
appToComp1 = pageTitle "関数適用演算子を関数合成演算子に置き換える" :| [
	text "つぎのように関数適用を2回以上使う例をみる",
	itext 4 "> abs $ logBase 2 $ recip 8",
	itext 4 "3.0",
	text "これを、つぎのように書き換えることができる",
	itext 4 "> abs . logBase 2 $ recip 8",
	itext 4 "3.0",
	text "結合力が演算子(.)のほうが($)よりも強いことに注意する",
	text "また、演算子($)は右結合である、つまり",
	itext 4 "それぞれ、丸括弧を明示すると、つぎのようになる",
	itext 4 "abs $ (logBase 2 $ recip 8)",
	itext 4 "(abs . logBase 2) $ recip 8",
	text "(丸括弧を明示した定義は、つぎのスライドで再掲する)"
	]

appToComp2 :: Page
appToComp2 = pageTitle "関数適用演算子を関数合成演算子に置き換える" :| [
	text "丸括弧を明示した定義を再掲する",
	itext 4 "abs $ (logBase 2 $ recip 8)",
	itext 4 "(abs . logBase 2) $ recip 8",
	text "「8の逆数の対数をもとめて、絶対値をもとめる」のと",
	text "「8の逆数に、",
	itext 4 "絶対値関数と対数関数を合成したものを適用する」",
	itext 4 "のふたつは、おなじ意味になる"
	]

appToComp3 :: Page
appToComp3 = pageTitle "関数適用演算子を関数合成演算子に置き換える" :| [
	text "演算子($)が連続したとき、一番右の($)以外は",
	itext 4 "すべて、演算子(.)に置き換えられる",
	text "逆に、演算子($)が一番右にあるとき",
	itext 4 "その左の(.)の連続は",
	itext 4 "すべて、演算子($)に置き換えて、解釈できる",
	text "これまで、みてきた「理屈」は理解しなくても",
	itext 4 "ここでは、このような「置き換え」ができることを",
	itext 4 "知っておけばいい",
	text "つぎのような置き換えができる",
	itext 4 "f $ g $ h $ i $ j $ ... $ z x",
	itext 4 "f . g . h . i . j . ... $ z x"
	]

appToComp4 :: Page
appToComp4 = pageTitle "関数適用演算子を関数合成演算子に置き換える" :| [
	text "演算子($)を(.)に置き換えたい、その理由は何か?",
	text "そのほうが「見ため」がきれいだから",
	itext 4 "foo $ bar $ baz $ qux $ quux $ corge arg",
	itext 4 "foo . bar . baz . qux . quux $ corge arg",
	text "したのほうが「すっきり」している感じがある"
	]
