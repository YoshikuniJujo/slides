import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	whatsFunction, circleArea,
	recursion, recursion2
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン! #2" "2. 関数、再帰、リスト" :| []

whatsFunction :: Page
whatsFunction = pageTitle "関数とは" :| [
	text "関数とは「値を値に関連づけるもの」",
	text "たとえば、たし算なら整数値3と4を整数値7に関連づける",
	itext 4 "> 3 + 4",
	itext 4 "7",
	text "演算子(+)による、たし算の例だ",
	text "演算子は中置記法により、ふたつの引数をとる関数だ",
	text "丸括弧でかこむことで、前置記法とすることもできる",
	itext 4 "> (+) 3 4",
	itext 4 "7",
	text "整数値3と4とが、それぞれ、第1引数、第2引数になる"
	]

circleArea :: Page
circleArea = pageTitle "円の面積" :| [
	text "円の面積をもとめる関数を作る",
	text "つぎのように、ファイルcircleArea.hsを作成する",
	itext 4 "% vim circleArea.hs",
	itext 4 "circleArea r = r ^ 2 * pi",
	text "対話環境に読み込んで試してみよう",
	itext 4 "> :load circleArea.hs",
	itext 4 "> circleArea 3",
	itext 4 "28.274333882308138",
	text "値piは定義ずみの変数であり、円周率を示す",
	text "関数の定義は、つぎのようになる",
	itext 4 "[関数名] [引数1] [引数2] ... = [式]"
	]

recursion :: Page
recursion = pageTitle "再帰" :| [
	text "ほかの言語では「くりかえし」が重要な役割を持つ",
	text "Haskellでは「くりかえし」をあらわす構文はない",
	text "「くりかえし」ではなく、より強力な「再帰」を使う",
	text "「再帰」とはなにか?",
	itext 4 "あるものについて記述するとき",
	itext 4 "記述しているものそれ自身への参照が",
	itext 4 "その記述中にあらわれること",
	text "1からnまでの総和を計算する関数は、つぎのようになる",
	itext 4 "sumN 1 = 1",
	itext 4 "sumN n = sumN (n - 1) + n",
	text "1から1までの総和は1であり",
	text "1からnまでの総和は",
	itext 4 "1からn - 1までの総和にnを足したもの"
	]

recursion2 :: Page
recursion2 = pageTitle "再帰" :| [
	text "これは対話環境で試すことができる",
	itext 4 "> sumN 1 = 1; sumN n = sumN (n - 1) + n",
	itext 4 "> sumN 10",
	itext 4 "55"
	]
