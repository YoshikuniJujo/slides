import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	janken
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン!" "4. 代数的データ型" :| []

janken :: Page
janken = pageTitle "じゃんけん" :| [
	text "じゃんけんゲームに必要な関数を考える",
	text "引数として、ふたつの手をとり、勝敗をかえす関数",
	text "関数againstを定義したい",
	text "じゃんけんの手を表す変数youとaiについて",
	itext 4 "you `xxxAgainst` ai",
	text "として、結果をかえすような関数を考える",
	text "さて、変数youやaiには、どのような値を束縛するべきか",
	text "0, 1, 2のような整数値か",
	text "\"rock\", \"paper\", \"scissors\"のような文字列か",
	text "勝敗はどのようにあらわすか",
	text "Bool値のFalseを負けとし、Trueを勝ちとするか",
	text "でも、あいこはどうする?"
	]
