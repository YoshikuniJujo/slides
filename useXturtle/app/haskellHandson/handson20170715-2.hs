import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	repetition, repetitionProcedure,
	repetitionList, repetitionList2, repetitionList3,
	wakugumi, montecarlo, montecarlo2,
	infiniteList, infiniteList2, infiniteList3,
	consUncons, consUncons2, consUncons3,
	concatFunction
	]

titlePage :: Page
titlePage = writeTitle
	"Haskell入門ハンズオン!"
	"2. リストを使った「くりかえし」" :| []

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

montecarlo :: Page
montecarlo = pageTitle "モンテカルロ法" :| [
	text "ここでは、くわしくは、あつかわないが",
	itext 4 "モンテカルロ法というアルゴリズムがある",
	text "たとえば、(効率的ではないが)モンテカルロ法で",
	itext 4 "円の面積の近似値をもとめるアルゴリズムがある",
	text "それは、つぎのようなものだ",
	itext 4 "1. 正方形のなかに円を描く",
	itext 4 "2. ランダムな点を打つ",
	itext 4 "3. 正方形のなかの点と円のなかの点を数える",
	itext 4 "4. その数の比が、面積の比にだいたい等しい",
	itext 4 "5. 正方形の面積を計算すれば",
	itext 8 "円の面積の近似値がもとまる"
	]

montecarlo2 :: Page
montecarlo2 = pageTitle "モンテカルロ法" :| [
	text "これを、さっきの「わくぐみ」にあてはめると",
	itext 4 "正方形のなかのランダムな点のリストを作る(列挙)",
	itext 4 "点のうち円のなかの点だけを取り出す(ろ過)",
	itext 4 "点の数を数える(集計)",
	text "のようになり、これで円内の点の数がもとまる",
	text "それと、はじめの点のすべての数との比をとればいい"
	]

infiniteList :: Page
infiniteList = pageTitle "無限リスト" :| [
	text "Haskellのリストは遅延リストである",
	text "つまり、リストの要素は必要になるまで作られない",
	itext 4 "と、いうことは?",
	text "要素が無限個あってもいい!",
	text "たとえば、平方数のうち5の倍数であるもの",
	text "それを、はじめから10個取り出すことを考える"
	]

infiniteList2 :: Page
infiniteList2 = pageTitle "無限リスト" :| [
	text "まず、条件を満たす値のリストを定義する",
	itext 4 "% vim repetition.hs",
	itext 4 "nums :: [Integer]",
	itext 4 "nums = filter ((== 0) . (`mopd` 5))",
	itext 8 "$ map (^ 2) [1 ..]",
	text "[1 ..]は1, 2, 3, ...と続く無限リスト",
	text "リストnumsも、無限リストになる",
	text "このリストから先頭の10個を取り出せばいい",
	itext 4 "*Main> take 10 nums",
	itext 4 "[25,100,225,400,625,900,1225,2600,2025,2500]"
	]

infiniteList3 :: Page
infiniteList3 = pageTitle "無限リスト" :| [
	text "「無限リストが使える」ということは",
	itext 4 "「本質的な処理と、終了条件とが分離できる」こと",
	text "たとえば「小さいほうかは100個の素数をもとめる」",
	text "この問題は、無限リストが使えなければ",
	itext 4 "素数を生成する",
	itext 4 "100個で終わりにする",
	text "のような、ふたつの処理は、からみ合い、わけられない",
	text "無限リストが使えれば",
	itext 4 "すべての素数のリストを生成",
	itext 4 "そこから100個、取り出す",
	text "のように、書くことができる"
	]

consUncons :: Page
consUncons = pageTitle "リストの先頭と残り" :| [
	text "リストの先頭に値を追加するには、つぎのようにする",
	itext 4 "*Main> 5 : [3, 2, 9]",
	itext 4 "[5,3,2,9]",
	text "空リストは[]で表される",
	itext 4 "*Main> []",
	itext 4 "[]",
	itext 4 "*Main> 2 : it",
	itext 4 "[2]",
	itext 4 "*Main> 8 : it",
	itext 4 "[8,2]",
	itext 4 "*Main> 3 : it",
	itext 4 "[3,8,2]"
	]

consUncons2 :: Page
consUncons2 = pageTitle "リストの先頭と残り" :| [
	text "逆にリストを先頭と残りとに、わけるには",
	itext 4 "パターンマッチを使う",
	itext 4 "% vim repetition.hs",
	itext 4 "headTail :: [a] -> Maybe (a, [a])",
	itext 4 "headTail (x : xs) = Just (x, xs)",
	itext 4 "headTail [] = Nothing",
	text "演算子(:)がパターンマッチに使われている",
	text "「値を先頭に追加」と逆の処理になっている",
	text "空リストは、先頭と残りにわけられない",
	text "なので、Nothing値をかえす"
	]

consUncons3 :: Page
consUncons3 = pageTitle "リストの先頭と残り" :| [
	text "試してみる",
	itext 4 "*Main> :reload",
	itext 4 "*Main> headTail [3, 2, 8, 5]",
	itext 4 "Just (3,[2,8,5])",
	itext 4 "*Main> headTail []",
	itext 4 "Nothing"
	]

concatFunction :: Page
concatFunction = pageTitle "2段のリストを1段にする" :| [
	text "「リストのリスト」のように2段になっているリストを",
	itext 4 "1段にする関数がある",
	itext 4 "*Main> concat [[1, 2, 3], [4, 5], [6, 7]]",
	itext 4 "[1,2,3,4,5,6,7]",
	text "リスト[1, 2, 3]とリスト[4, 5, 6]の",
	itext 4 "すべての組み合わせで、かけ算をしたいとする",
	itext 4 "(ここから、書き始める)"
	]
