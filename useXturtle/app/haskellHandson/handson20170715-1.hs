import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	repetition, repetitionProcedure,
	repetitionList, repetitionList2, repetitionList3,
	wakugumi
	]

titlePage :: Page
titlePage = writeTitle
	"Haskell入門ハンズオン!"
	"1. リストを使った「くりかえし」" :| []

repetition :: Page
repetition = pageTitle "くりかえし" :| [
	text "プログラミングにおける重要な要素「くりかえし」",
	text "「くりかえし」をHaskellでは、どのように実現するか",
	text "その答えのひとつ、「リストを使う」",
	text "単純な例で、みていこう",
	text "1からNまでの総和をかえす、関数sumNを考える"
	]

repetitionProcedure :: Page
repetitionProcedure = pageTitle "手続き的な、くりかえし" :| [
	text "1からNまでの総和は、手続き的には、つぎのようになる",
	itext 4 "1. 変数i, sを用意し、iを1に、sを0に初期化する",
	itext 4 "2. 変数iの値をsに加算する",
	itext 4 "3. 変数iに1を加算する",
	itext 4 "4. 変数iがN以下なら2へ",
	itext 4 "5. 変数sが、もとめる値となる",
	text "とくに、4のところが、ややこしい",
	text "「N未満?N以下?それとも、N + 1以下?」"
	]

repetitionList :: Page
repetitionList = pageTitle "リストによる、くりかえし" :| [
	text "リストによる、くりかえしはかんたん",
	itext 4 "1. 1からNまでの整数のリストを作成",
	itext 4 "2. リストの総和を計算する",
	text "コードを書く",
	itext 4 "% vim repetition.hs",
	itext 4 "sumN :: Integer -> Integer",
	itext 4 "sumN n = sum [1 .. n]",
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load repetition.hs",
	itext 4 "*Main> sumN 10",
	itext 4 "55"
	]

repetitionList2 :: Page
repetitionList2 = pageTitle "リストによる、くりかえし" :| [
	text "3の倍数以外のものの総和だったら?",
	text "関数filterが使える",
	itext 4 "filter :: (a -> Bool) -> [a] -> [a]",
	text "コードを書く",
	itext 4 "% vim repetition.hs",
	itext 4 "sumNot3N :: Integer -> Integer",
	itext 4 "sumNot3N n = sum",
	itext 8 "$ filter ((/= 0) . (`mod` 3)) [1 .. n]",
	text "試してみる",
	itext 4 "*Main> sumNot3N 10",
	itext 4 "37"
	]

repetitionList3 :: Page
repetitionList3 = pageTitle "リストによる、くりかえし" :| [
	text "1からNまでの整数を、5で割ったあまりの総和は?",
	text "関数mapが使える",
	itext 4 "map :: (a -> b) -> [a] -> [b]",
	text "コードを書く",
	itext 4 "% vim repetition.hs",
	itext 4 "sumMod5N :: Integer -> Integer",
	itext 4 "sumMod5N n = sum $ map (`mod` 5) [1 .. n]",
	text "試してみる",
	itext 4 "*Main> sumMod5N 10",
	itext 4 "20"
	]

wakugumi :: Page
wakugumi = pageTitle "わくぐみ" :| [
	text "それぞれの段階は、つぎのように呼ぶ",
	itext 4 "列挙: 要素を数え上げてリストにする([1 .. n])",
	itext 4 "ろ過: 条件を満たすものだけを残す(filter)",
	itext 4 "写像: 関数で、すべての要素を変換する(map)",
	itext 4 "集計: 全要素からひとつの値をつくる(sum)",
	text "単純な「くりかえし」は、だいたい",
	itext 4 "この「わくぐみ」で表現できる"
	]
