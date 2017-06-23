import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude, constFunction, constFunction2, constFunction3,
	application, application2, application3, application4,
	application5
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン!" "1. 基本的な多相関数" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "Haskellには定義ずみの多相関数がたくさんある",
	text "どの型に対してでも使える基本的な関数だ",
	text "これらの関数を適切に使うことで",
	itext 4 "ソースコードが、ぐっと、きれいになる",
	text "ここでは、つぎのみっつを学ぶ",
	itext 4 "const :: a -> b -> a",
	itext 4 "($) :: (a -> b) -> a -> b",
	itext 4 "(.) :: (b -> c) -> (a -> b) -> a -> c"
	]

constFunction :: Page
constFunction = pageTitle "関数const" :| [
	text "関数constには、ふたつの見かたがある",
	itext 4 "* 第2引数を無視して、第1引数をかえす関数",
	itext 4 "* 「引数を無視して、特定の値をかえす関数」を",
	itext 8 "作る関数",
	text "それぞれの見かたについて、試してみよう",
	itext 4 "% stack ghci",
	itext 4 "*Main Hndsn> const 'A' 123",
	itext 4 "'A'",
	itext 4 "*Main Hndsn> constA = const 'A'",
	itext 4 "*Main Hndsn> constA 123",
	itext 4 "'A'"
	]

constFunction2 :: Page
constFunction2 = pageTitle "関数const" :| [
	text "一般的に、Haskellでは",
	itext 4 "「引数を、ふたつとる関数」と",
	itext 4 "「関数をかえす関数」とは、おなじもの",
	text "第1引数をあたえると、関数に評価され",
	itext 4 "その「関数」に第2引数をあたえると値がかえる",
	text "",
	text "関数constを自分で再定義してみよう",
	itext 4 "(実際は、該当箇所を参照)",
	itext 4 "% vim polymorphic.hs",
	itext 4 "myConst :: a -> b -> a",
	itext 4 "myConst x _ = x"
	]

constFunction3 :: Page
constFunction3 = pageTitle "関数const" :| [
	text "試してみよう",
	itext 4 "*Main Hndsn> :load polymorphic.hs",
	itext 4 "*Main> myConst 'A' 123",
	itext 4 "'A'",
	text "",
	text "関数constの型a -> b -> aの意味は、わかるだろうか",
	text "第1引数が返り値になるので、そのふたつは、おなじ型",
	text "第2引数は無視されるので、どんな型でもいい"
	]

application :: Page
application = pageTitle "関数適用演算子" :| [
	text "Haskellには、「関数を値に適用する演算子」がある",
	text "「えっ?」",
	text "関数fを値xに適用するには、つぎのようにすればいい",
	itext 4 "f x",
	text "「関数を値に適用する演算子」なんて必要ない",
	text "それでも関数適用演算子($)が定義されている",
	text "うえとおなじことを、つぎのように書ける",
	itext 4 "f $ x",
	text "「いったい何の意味が?」"
	]

application2 :: Page
application2 = pageTitle "関数適用演算子" :| [
	text "試してみよう",
	itext 4 "*Main> recip 8",
	itext 4 "0.125",
	itext 4 "*Main> recip $ 8",
	itext 4 "0.125",
	itext 4 "*Main> ($) recip 8",
	itext 4 "0.125",
	text "関数recipは逆数をもとめる関数",
	text "recip 8はrecip $ 8と書くことができる",
	itext 4 "「いったい、何の、意味が!!?」"
	]

application3 :: Page
application3 = pageTitle "関数適用演算子" :| [
	text "「いったい何の意味が?」",
	text "その疑問の答えは、あとまわし",
	text "とりあえず、おなじものを自分で定義してみよう",
	itext 4 "% vim polymorphic.hs",
	itext 4 "(.$.) :: (a -> b) -> a -> b",
	itext 4 "f .$. x = f x",
	text "「a型の引数をとり、b型の返り値をかえす関数」と",
	itext 4 "「a型の値」とをとり、b型の値をかえす",
	text "本体の定義も、まあ、見たまんまだ",
	text "引数fとxとをとり、関数fを値xに適用したものを、かえす"
	]

application4 :: Page
application4 = pageTitle "関数適用演算子" :| [
	text "試してみよう",
	itext 4 "*Main> :reload",
	itext 4 "*Main> recip .$. 8",
	itext 4 "0.125",
	text "いったい!!!",
	(>>) <$> backLine <*> itext 8 "なんの!!!",
	(>>) <$> backLine <*> itext 16 "意味が!!!???",
	text "お答えしましょう...つぎのようにしてみる",
	itext 4 "*Main> recip (3 + 5)",
	itext 4 "0.125",
	itext 4 "*Main> recip $ 3 + 5",
	itext 4 "0.125",
	text "ほら、丸括弧が減らせたね!!!"
	]

application5 :: Page
application5 = pageTitle "関数適用演算子" :| [
	text "「それだけ?」",
	text "そう、それだけ",
	text "それだけだけど、関数の引数となる式が",
	itext 4 "長く複雑になるようなとき、けっこう役に立つ",
	text "関数適用演算子($)は、コードをきれいに書くのに",
	itext 4 "役に立つ演算子のひとつ"
	]
