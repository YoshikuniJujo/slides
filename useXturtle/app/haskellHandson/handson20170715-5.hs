import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude,
	calculator,
	parser
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
