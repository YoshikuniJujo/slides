import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	tryVersion, tryReplChar, tryReplInteger, tryReplBind,
	loadDefinition
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン! #2" "1. 対話環境を使う" :| []

tryVersion :: Page
tryVersion = pageTitle "処理系はある?" :| [
	text "まずは、処理系の導入ができていることを確認する",
	itext 4 "% stack ghc -- --version",
	(\x y z -> x >> y >> z)
		<$> itext 4 "The Glorious Glasgow Haskell Compilation"
		<*> nextLine
		<*> itext 4 "System, version 8.X.X",
	text "%はシェルへの入力をあらわす記号(プロンプト)",
	itext 4 "%自体は入力しない",
	text "どうだろうか",
	text "処理系の導入がうまくいかなかったというかたは",
	itext 4 "今回はハンズオンできないかもしれないが、後で",
	itext 4 "後述のteratail、Slack、メールなどでサポートする"
	]

tryReplChar :: Page
tryReplChar = pageTitle "対話環境を試す" :| [
	text "対話環境を試してみよう",
	itext 4 "% stack ghci",
	itext 4 "(いくつかのメッセージ)",
	itext 4 "Prelude>",
	text "Preludeの意味は、ここでは説明しない",
	text "また、表示の都合上、対話環境への打ち込みは>で表す",
	text "文字を打ち込んでみよう",
	itext 4 "> 'c'",
	itext 4 "'c'",
	text "対話環境に打ち込まれた「式」は「評価」されて、",
	itext 4 "つぎの行に「表示」される",
	text "式'c'が評価されて、そのまま、値'c'になり",
	itext 4 "それが表示されて'c'のように出力される"
	]

tryReplInteger :: Page
tryReplInteger = pageTitle "対話環境を試す" :| [
	text "整数を打ち込んでみる",
	itext 4 "> 123",
	itext 4 "123",
	itext 4 "> 123 + 456",
	itext 4 "579",
	text "式123は値123に評価され、",
	itext 4 "式123 + 456は値579に評価される"
	]

tryReplBind :: Page
tryReplBind = pageTitle "対話環境を試す" :| [
	text "値を変数に束縛することもできる",
	itext 4 "> x = 123",
	itext 4 "> x",
	itext 4 "123",
	text "関数を定義することもできる",
	itext 4 "> bmi h w = w / (h / 100) ^ 2",
	itext 4 "> bmi 172 68",
	itext 4 "22.985397512168742",
	text "これはBMIをもとめる関数だ",
	text "体重w(kg)を身長h(cm)の100分の1の2乗で",
	itext 4 "わったものがBMIになる",
	text "BMIは22くらいが調度いいとのこと"
	]

loadDefinition :: Page
loadDefinition = pageTitle "定義ファイルを読み込む" :| [
	]
