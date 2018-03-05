module Main where

import Data.List.NonEmpty
import Graphics.X11.Slide

version :: Version
version = [0, 0, 0, 1]

main :: IO ()
main = runSlide version someSlide

someSlide :: Slide
someSlide = title :| [
	prelude, funList1, funList2, funList3, funList4,
	numberList1, numberList2, numberList3, numberList4, numberList5
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #3" "3. パーサコンビネータ(2)" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "パーサを組み立てるための基本的な関数を定義した",
	text "それらを使って空白で区切った数値をパースする",
	text "まずは、パーサをリストのパーサに変換する関数を定義する"
	]

funList1 :: Page
funList1 = pageTitle "リストのパーサ" :| [
	text "「ひとつの要素を解析するパーサ」を",
	itext 2 "「複数の要素を解析して、リストとして返すパーサ」に",
	itext 3 "変換する",
	text "ポイントは",
	itext 4 "「0要素以上のリストを解析するパーサ」と",
	itext 4 "「1要素以上のリストを解析するパーサ」とを",
	itext 4 "同時に作ること",
	text "関数list, list1を定義する"
	]

funList2 :: Page
funList2 = pageTitle "リストのパーサ" :| [
	text "ファイルcalc.hsに関数list, list1を追加する",
	itext 4 "% vim calc.hs",
	itext 4 "list, list1 :: Parse a -> Parse [a]",
	itext 4 "list p = succeed [] `alt` list1 p",
	itext 4 "list1 p = (p >@> list p) `build` uncurry (:)",
	text "uncurry (:)のところは、つぎの例をみてみよう",
	itext 4 "*Main> uncurry (:) ('h', \"ello\")",
	itext 4 "\"hello\"",
	text "(先頭の値、残りの値)のようなタプルを",
	itext 4 "もとのリストに変換している",
	text "この`build`以下の部分は「かたちを整えている」だけ"
	]

funList3 :: Page
funList3 = pageTitle "リストのパーサ" :| [
	text "`build`以下には、いちど目をつぶる",
	itext 4 "list p = succeed [] `alt` list1 p",
	itext 4 "list1 p = p >@> list p",
	text "0要素以上のリストは",
	itext 2 "「0要素のリスト、または、1要素以上のリスト」",
	text "1要素以上のリストは",
	itext 2 "「ひとつの要素に、0要素以上のリストを続けたもの」"
	]

funList4 :: Page
funList4 = pageTitle "リストのパーサ" :| [
	text "対話環境で試してみる",
	itext 4 "*Main> :reload",
	itext 4 "*Main> list (check isDigit) \"123\"",
	itext 4 "[(\"\",\"123\"),(\"1\",\"23\"),(\"12\",\"3\"),(\"123\",\"\")]",
	itext 4 "*Main> list1 (check isDigit) \"123\"",
	itext 4 "[(\"1\",\"23\"),(\"12\",\"3\"),(\"123\",\"\")]",
	text "関数listで0要素以上のくりかえしが",
	itext 4 "関数list1で1要素以上のくりかえしが",
	itext 4 "それぞれ、解析されている"
	]

numberList1 :: Page
numberList1 = pageTitle "数の並びの構文解析" :| [
	text "ここで、例として数の並びの構文解析をしてみる",
	text "1文字以上の空白文字で区切られた数値の並びを",
	itext 4 "数値のリストに変換する",
	text "まずは、ひとつの数値を解析する",
	itext 4 "% vim calc.hs",
	itext 4 "number :: Parse Integer",
	itext 4 "number = list1 (check isDigit) `build` read",
	text "Haskellでは多倍長整数としてInteger型の値が使える",
	text "関数readは、ここでは",
	itext 4 "文字列を数値に変換する関数と考えておく"
	]

numberList2 :: Page
numberList2 = pageTitle "数の並びの構文解析" :| [
	text "対話環境で試してみよう",
	itext 4 "*Main> :reload",
	itext 4 "*Main> number \"4492\"",
	itext 4 "[(4,\"492\"),(44,\"92\"),(449,\"2\"),(4492,\"\")]",
	itext 4 "*Main> (number >@ eof) \"4492\"",
	itext 4 "[(4492,\"\")]",
	text "パーサeofを最後につけると",
	itext 4 "残りの文字列が空文字列のものだけにしぼられる",
	text "なので、「残りの文字列」は情報としての価値がない",
	text "タプルの第1要素だけを取り出したい",
	text "関数fstが使えると思うが",
	itext 4 "[(4492,\"\")]では、タプルはリストのなかにある"
	]

numberList3 :: Page
numberList3 = pageTitle "関数map" :| [
	text "Haskellでは関数mapによって",
	itext 2 "リストの要素すべてに、関数を適用できる",
	itext 2 "*Main> map negate [3, 4, 5]",
	itext 2 "[-3,-4,-5]",
	text "この関数mapを使うと、つぎのようにできる",
	itext 2 "*Main> map fst ((number >@ eof) \"4492\"",
	itext 2 "[4492]"
	]

numberList4 :: Page
numberList4 = pageTitle "関数listToMaybe" :| [
	text "ここで、複数の候補のうち",
	itext 2 "はじめのひとつを取り出すとする",
	text "リストの先頭を取り出すのに関数listToMaybeが使える",
	itext 1 "*Main> listToMaybe [3, 4, 5]",
	itext 1 "Just 3",
	itext 1 "*Main> listToMaybe []",
	itext 1 "Nothing",
	text "空リストでは、値がないことを意味するNothing値が返る",
	text "これを使うと、つぎのようにできる",
	itext 1 "*Main> listToMaybe (map fst ((number >@ eof) \"4492\"))",
	itext 1 "Just 4492"
	]

numberList5 :: Page
numberList5 = pageTitle "関数合成" :| [
	itext (- 1.5)  "最後に対話環境に打ち込んだ式を、再掲する",
	itext 3 "listToMaybe (map fst ((number >@ eof) \"4492\"))",
	itext (- 1.5) "これは、すこし複雑だ",
	itext (- 1.5) "Haskellでは演算子(.)で関数合成ができる",
	itext 3 "*Main> (+ 5) (negate 3)",
	itext 3 "2",
	itext 3 "*Main> ((+ 5) . negate) 3",
	itext 3 "2",
	itext (- 1.5) "関数negateを適用したうえで、関数(+ 5)を適用している",
	itext (- 1.5) "演算子(.)を使うと、つぎのようにできる",
	itext (- 1.5) "*Main> (listToMaybe . map fst . (number >@ eof)) \"4492\"",
	itext (- 1.5) "4492"
	]
