import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude, constFunction, constFunction2, constFunction3
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
