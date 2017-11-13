import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude, randoms1, randoms2, unlines1, read1, epilogue
	]

titlePage :: Page
titlePage = writeTitle
	"Haskell入門ハンズオン! #2" "6. いくつかの関数を学ぶ(2)" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "ひき続き、いくつかの関数を学ぶ",
	text "ここで学ぶ関数は、つぎのとおり",
	itext 4 "関数randoms, mkStdGen",
	itext 4 "関数unlines",
	itext 4 "関数read"
	]

randoms1 :: Page
randoms1 = pageTitle "関数randoms, mkStdGen" :| [
	text "乱数のリストを生成する関数を紹介する",
	text "関数randomsなどは、現在は、標準的なパッケージには",
	itext 4 "含まれていないので、いちど対話環境をぬけて",
	itext 4 "randomsパッケージを導入しながら",
	itext 4 "対話環境を立ち上げる",
	itext 4 "> :quit",
	itext 4 "% stack ghci --package random",
	text "モジュールSystem.Randomを導入する",
	itext 4 "> :module System.Random"
	]

randoms2 :: Page
randoms2 = pageTitle "関数randoms, mkStdGen" :| [
	text "関数randomsは「乱数の種」を引数とし",
	itext 4 "ランダムな値を要素とする無限リストをかえす",
	text "「乱数の種」は関数mkStdGenで整数から作れる",
	itext 4 "> take 10 . randoms $ mkStdGen 8",
	itext 4 "[-398575370259562870,-6370604356117182359,",
	itext 4 "8399777519602674086,..."
	]

unlines1 :: Page
unlines1 = pageTitle "関数unlines" :| [
	text "文字列を要素とするリストを",
	itext 4 "行の集まりと解釈して",
	itext 4 "それぞれの行のおわりに改行を追加した",
	itext 4 "ひとつの文字列としてかえす関数",
	itext 4 "> unlines [\"hello\",\"world\"]",
	itext 4 "\"hello\\nworld\\n\"",
	text "helloやworldの、それぞれの後ろに\\n(改行)が追加される",
	text "そのうえで、結合され、ひとつの文字列となる"
	]

read1 :: Page
read1 = pageTitle "関数read" :| [
	text "文字列を適切な値に変換する",
	itext 4 "> read \"12345\" + 54321",
	itext 4 "66666",
	text "文字列\"12345\"が整数値12345に変換された"
	]

epilogue :: Page
epilogue = pageTitle "ここで学んだ関数" :| [
	text "ここでは、つぎの関数を学んだ",
	itext 4 "関数randoms, mkStdGen",
	itext 4 "関数unlines",
	itext 4 "関数read"
	]
