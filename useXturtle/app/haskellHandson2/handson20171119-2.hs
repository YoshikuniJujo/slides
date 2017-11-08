import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	whatsFunction, circleArea,
	recursion, recursion2,
	maybe1, maybe2, maybe3, maybe4,
	patternMatch1, patternMatch2
	]

titlePage :: Page
titlePage = writeTitle
	"Haskell入門ハンズオン! #2" "2. 関数、再帰、パターンマッチ" :| []

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

maybe1 :: Page
maybe1 = pageTitle "Maybe値" :| [
	text "値を持たないかもしれない値としてMaybe値がある",
	text "Maybe値はNothing値とJust値とからなる",
	itext 4 "> Just 8",
	itext 4 "Just 8",
	itext 4 "> Nothing",
	itext 4 "Nothing"
	]

maybe2 :: Page
maybe2 = pageTitle "Maybe値" :| [
	text "わる数が0のときに値をもたないわり算を示す",
	itext 4 "> :{",
	itext 4 "| divide _ 0 = Nothing",
	itext 4 "| divide a b = Just (a `div` b)",
	itext 4 "> :}",
	itext 4 "> divide 13 3",
	itext 4 "Just 4",
	itext 4 "> divide 8 0",
	itext 4 "Nothing",
	text ":{と:}とを使うと、対話環境で複数行での定義ができる",
	text "_(アンダースコア)は、仮引数のかわりに置くことができる",
	text "これを使うと、不要な変数を定義せずにすむ",
	text "関数divは整数どうしのわり算をあらわす"
	]

maybe3 :: Page
maybe3 = pageTitle "Maybe値" :| [
	text "Just値になってしまった値をどう使おうか",
	itext 4 "> :{",
	itext 4 "> maybeMul (Just a) b = Just (a * b)",
	itext 4 "> maybeMul Nothing _ = Nothing",
	itext 4 "> :}",
	itext 4 "> maybeMul (divide 13 3) 5",
	itext 4 "Just 20",
	text "関数maybeMulの、ひとつめの仮引数は、つぎのふたつ",
	itext 4 "Just a",
	itext 4 "Nothing",
	text "これらは適用された引数と比較される",
	text "Just aとJust 4とが比較されると、変数aは4に束縛される",
	text "これをパターンマッチと呼ぶ"
	]

maybe4 :: Page
maybe4 = pageTitle "Maybe値" :| [
	text "関数maybeMulの第1引数にNothingがあたえられたとする",
	text "まず、Just aと比較される",
	itext 4 "しかし、これとNothingとは形がちがう",
	text "よって、NothingはJust aとはマッチしない",
	text "つぎに、仮引数のところのNothingと比較される",
	text "これは形がおなじなのでマッチする"
	]

patternMatch1 :: Page
patternMatch1 = pageTitle "パターンマッチ" :| [
	text "仮引数のところにはパターンが置ける",
	text "実引数はパターンと比較される",
	itext 4 "形がおなじなら、なかの値を取り出せる",
	itext 4 "形がちがければ、つぎの定義へと。くりかえす"
	]

patternMatch2 :: Page
patternMatch2 = pageTitle "パターンマッチ" :| [
	text "関数定義の仮引数にはパターンが置ける",
	text "ここまでで見てきたパターンは、つぎの3種類",
	itext 4 "1. 変数(x, y, z, ...)",
	itext 4 "2. ワイルドカード(_)",
	itext 4 "3. 値構築子が0個以上の引数をとったもの",
	itext 8 "(Just x, Nothing, ...)",
	text "仮引数である変数もパターンのひとつである"
	]

{-
list1 :: Page
list1 = pageTitle "リスト" :| [
	text "Haskellで、よく使われるデータ構造はリスト",
	text "対話環境でみてみよう",
	itext 4 "> [2, 8, 3, 5]",
	itext 4 "[2,8,3,5]",
	text "おなじタイプの値を、複数まとめることができる"
	]
	-}
