module Main where

import Data.List.NonEmpty
import Graphics.X11.Slide

version :: Version
version = [0, 0, 0, 1]

main :: IO ()
main = runSlide version someSlide

someSlide :: Slide
someSlide = title :| [
	prelude, parseOp1, parseOp2, parseOp3,
	parseExpr1, parseExpr2, parseExpr3, parseExpr4, parseExpr5
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #3" "4. 計算式のパース" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "道具はそろった",
	text "これで四則演算の式を解析できる"
	]

parseOp1 :: Page
parseOp1 = pageTitle "演算子のパース" :| [
	text "はじめに演算子をパースする",
	text "演算をあらわす型シノニムを定義",
	itext 4 "% vim calc.hs",
	itext 4 "type Op = Integer -> Integer -> Integer",
	text "ここでの「演算」は",
	itext 4 "ふたつの整数を引数として",
	itext 4 "整数をかえす関数"
	]

parseOp2 :: Page
parseOp2 = pageTitle "演算子のパース" :| [
	text "それぞれの演算子用のパーサ",
	itext 4 "% vim calc.hs",
	itext 4 "ad, sb, ml, dv :: Parse Op",
	itext 4 "ad = char '+' `build` const (+)",
	itext 4 "sb = char '-' `build` const (-)",
	itext 4 "ml = char '*' `build` const (*)",
	itext 4 "dv = char '/' `build` const div",
	text "それぞれの記号をパースして",
	itext 4 "それぞれの演算を結果とするパーサ"
	]

parseOp3 :: Page
parseOp3 = pageTitle "演算子のパース" :| [
	text "演算子は4つの演算子の「どれか」なので",
	itext 4 "% vim calc.hs",
	itext 4 "op :: Parse Op",
	itext 4 "op = ad `alt` sb `alt` ml `alt` dv",
	text "対話環境で試してみる",
	itext 4 "*Main> :reload",
	itext 4 "*Main> fromJust (parse op \"+\") 9 4",
	itext 4 "13",
	itext 4 "*Main> fromJust (parse op \"*\") 9 4",
	itext 4 "36",
	text "関数parseによって得られる値はJust値なので",
	itext 4 "関数fromJustでなかみを取り出している",
	text "取り出された関数を数値9, 4に適用した"
	]

parseExpr1 :: Page
parseExpr1 = pageTitle "式と項" :| [
	itext (- 1) "「式」は、ふたつの「項」を演算子でつないだもの",
	itext (- 1) "「項」は、「数」または、「式」を丸括弧でかこったもの",
	itext (- 1) "このように、互いに互いの定義に使われているとき",
	itext 3 "「相互再帰の関係にある」という",
	itext (- 1) "たとえば「式」の例として、つぎのものがある",
	itext 3 "13+5, (12*3)+17, (30-5)/(20*4), ((41/2)+3)*5",
	itext (- 1) "「項」の例は、つぎのようになる",
	itext 3 "19, (25+4), ((11*3)/(25-3)), (((315*8)+31)*7)"
	]

parseExpr2 :: Page
parseExpr2 = pageTitle "式のパース" :| [
	text "式のパーサ",
	itext 4 "% vim calc.hs",
	itext 4 "expr :: Parse Integer",
	itext 4 "expr = (term >@> op >@> term) `build`",
	itext 4 "        \\((x, o), y) -> x `o` y",
	text "パーサtermは、あとで定義する",
	text "\\((x, o), y) -> x `o` yは関数リテラル",
	text "引数をパターン((x, o), y)にマッチさせる",
	text "ここで、変数xとyにはパーサtermの結果として",
	itext 4 "「項」の値がはいる",
	text "変数oには、パーサopの結果として演算がはいる",
	text "結果としての「x `o` y」は演算の結果になる"
	]

parseExpr3 :: Page
parseExpr3 = pageTitle "項のパース" :| [
	text "項のパーサ",
	itext 4 "% vim calc.hs",
	itext 4 "term :: Parse Integer",
	itext 4 "term = number `alt`",
	itext 4 "        (char '(' @> expr >@ char ')')",
	text "「数」または、「式」を丸括弧でかこったもの",
	text "「項」の定義は「そのまま」だ"
	]

parseExpr4 :: Page
parseExpr4 = pageTitle "四則演算の評価" :| [
	text "対話環境で試してみる",
	itext 4 "*Main> :reload",
	itext 4 "*Main> parse expr \"3*(5-2)\"",
	itext 4 "9",
	text "より使いやすいように関数calcを定義する",
	itext 4 "% vim calc.hs",
	itext 4 "calc :: String -> Maybe Integer",
	itext 4 "calc = parse expr"
	]

parseExpr5 :: Page
parseExpr5 = pageTitle "四則演算の評価" :| [
	text "対話環境で試す",
	itext 4 "*Main> :reload",
	itext 4 "*Main> calc \"3*(5-2)\"",
	itext 4 "9",
	itext 4 "*Main> calc \"(43+24)/(21-16)\"",
	itext 4 "13",
	text "他の式でも試してみよう",
	text "ただし",
	itext 4 "空白をいれてはならない",
	itext 4 "丸括弧は省略できない",
	itext 2 "というところに注意する"
	]
