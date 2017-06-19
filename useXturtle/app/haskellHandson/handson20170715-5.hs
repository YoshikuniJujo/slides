import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude,
	calculator,
	parser, parser2, parser3, parser4,
	parser5, parser6, parser7, parser8
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン!" "5. 作ってみよう" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "数十行の小さなアプリケーションを作ってみる",
	itext 4 "ひとつめは電卓",
	itext 4 "もうひとつは、数当てゲーム"
	]

calculator :: Page
calculator = pageTitle "電卓" :| [
	text "電卓の仕様はつぎのようにする",
	itext 4 "* 整数の四則演算をあつかう",
	itext 4 "* 式を入力すると答えを表示する",
	itext 4 "* 式には空白文字はなく、丸括弧を明示する",
	itext 4 "* 構文解析の失敗にはエラーメッセージを出力",
	itext 4 "* 正確にquitまたはexitと入力すると終了する",
	text "まずはパーサを作っていく"
	]

parser :: Page
parser = pageTitle "パーサ" :| [
	text "一般的なパーサの組み立てに使える関数群を作る",
	text "まずは、パーサの型を作ろう",
	text "文字列を取って、何らかの値を返すことを考えると",
	itext 4 "String -> a",
	text "パーサをつなげていくことを考えると",
	itext 4 "「残りの文字列」が必要になるので",
	itext 4 "String -> (a, String)",
	text "パースの結果に複数の候補が必要になることがあるので",
	itext 4 "String -> [(a, String)]",
	text "これを定義する",
	itext 4 "% vim calculator.hs",
	itext 4 "type Parse a = String -> [(a, String)]"
	]

parser2 :: Page
parser2 = pageTitle "パーサ" :| [
	text "何に使うのか、今は疑問に思うと思うが、つぎを考える",
	itext 4 "「文字列を消費せず、何らかの値をかえすパーサ」",
	text "いちばん単純なパーサである、それを作る関数",
	itext 4 "% vim calculator.hs",
	itext 4 "succeed :: a -> Parse a",
	itext 4 "succeed v inp = [(v, inp)]",
	text "「パーサ」と呼んでいるものは、単数をひとつとる関数",
	text "引数をひとつとり「パーサ」をかえす関数は",
	itext 4 "引数をふたつとる関数とおなじこと",
	text "つぎのように書いてもいい",
	itext 4 "succeed v = \\inp -> [(v, inp)]"
	]

parser3 :: Page
parser3 = pageTitle "パーサ" :| [
	text "つぎの、ふたつは、おなじもの",
	itext 4 "「引数をふたつとる関数」",
	itext 4 "「引数をひとつとり、関数をかえす関数」",
	text "関数succeedを試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "Prelude> succeed 123 \"hello\"",
	itext 4 "(123,\"hello\")",
	text "これは「文字列を消費せず整数123をかえすパーサ」で",
	itext 4 "文字列\"hello\"を解析したということ",
	text "結果として整数123がかえり",
	itext 4 "つぎのパーサにわたすのは文字列\"hello\""
	]

parser4 :: Page
parser4 = pageTitle "パーサ" :| [
	text "条件を満たす1文字をパースする関数",
	itext 4 "% vim calculator.hs",
	itext 4 "check :: (Char -> Bool) -> Parse Char",
	itext 4 "check p (c : cs) | p c = [(c, cs)]",
	itext 4 "check _ _ = []",
	text "試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> :module + Data.Char",
	itext 4 "*Main Data.Char> check isDigit \"123\"",
	itext 4 "[('1',\"23\")]",
	itext 4 "*Main Data.Char> check isDigit \"abc\"",
	itext 4 "[]"
	]

parser5 :: Page
parser5 = pageTitle "パーサ" :| [
	text "特定の1文字をパースする関数",
	text "これは、関数checkの条件を「その文字と等しい」とする",
	itext 4 "% vim calculator.hs",
	itext 4 "char :: Char -> Parse Char",
	itext 4 "char c0 = check $ \\c1 -> c1 == c0",
	text "試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> char 'a' \"abc\"",
	itext 4 "[('a',\"bc\")]",
	itext 4 "*Main> char 'a' \"123\"",
	itext 4 "[]"
	]

parser6 :: Page
parser6 = pageTitle "パーサ" :| [
	text "ふたつのパーサの、それぞれを候補とするパーサを作成",
	itext 4 "% vim calculator.hs",
	itext 4 "alt :: Parse a -> Parse a -> Parse a",
	itext 4 "(p1 `alt` p2) inp = p1 inp ++ p2 inp",
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> :module + Data.char",
	itext 4 "*Main> (check isDigit `alt` char 'a') \"123\"",
	itext 4 "[('1',\"23\")]",
	itext 4 "*Main> (check isDigit `alt` char 'a') \"abc\"",
	itext 4 "[('a',\"bc\")]"
	]

parser7 :: Page
parser7 = pageTitle "パーサ" :| [
	text "解析の結果に関数を適用する関数",
	itext 4 "% vim calculator.hs",
	itext 4 "build :: Parse a -> (a -> b) -> Parse b",
	itext 4 "build p f inp =",
	itext 8 "[ (f x, r) | (x, r) <- p inp ]",
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> :module + Data.Char",
	itext 4 "*Main Data.Char>",
	itext 4 "(check isDigit `build` digitToInt) \"123\"",
	itext 4 "[(1,\"23\")]"
	]

parser8 :: Page
parser8 = pageTitle "パーサ" :| [
	text "「...のつぎに...」のようにパーサをつなげる",
	itext 4 "% vim calculator.hs",
	itext 4 "(>@>) :: Parse a -> Parse b -> Parse (a, b)",
	itext 4 "(p1 >@> p2) inp = [ ((x, y), r') |",
	itext 8 "(x, r) <- p1 inp, (y, r') <- p2 r ]",
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> :module + Data.Char",
	itext 4 "*Main> (char 'a' >@> check isDigit) \"a123\"",
	itext 4 "[(('a','1'),\"23\")]"
	]
