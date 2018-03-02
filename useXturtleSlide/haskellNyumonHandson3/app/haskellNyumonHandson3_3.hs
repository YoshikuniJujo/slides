module Main where

import Data.List.NonEmpty
import Graphics.X11.Slide

version :: Version
version = [0, 0, 0, 1]

main :: IO ()
main = runSlide version someSlide

someSlide :: Slide
someSlide = title :| [
	prelude, funList1, funList2, funList3, funList4
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
