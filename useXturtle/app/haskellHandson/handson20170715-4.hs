import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	janken, janken2, janken3, janken4, janken5, janken6
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

janken2 :: Page
janken2 = pageTitle "じゃんけん" :| [
	text "じゃんけんの手や結果を表すのに最適な型がない",
	text "ないものは、作ればいい",
	itext 4 "% vim janken.hs",
	itext 4 "data Janken = Rock | Paper | Scissors",
	itext 4 "data Result = Lose | Draw | Win",
	text "3つの値(Rock, Paper, Scissors)を持つ型Jankenと",
	text "3つの値(Lose, Draw, Win)を持つ型Resultとを定義した",
	text "ただし、このままでは対話環境で表示できない",
	text "それぞれの最後に、deriving Showを追加しよう",
	itext 4 "% vim janken.hs",
	itext 4 "data Janken = ... deriving Show",
	itext 4 "data Result = ... deriving Show"
	]

janken3 :: Page
janken3 = pageTitle "じゃんけん" :| [
	text "定義を読みこんで、試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load janken.hs",
	itext 4 "*Main> Rock",
	itext 4 "Rock",
	itext 4 "*Main> Win",
	itext 4 "Win",
	itext 4 "*Main> :type Scissors",
	itext 4 "Scissors :: Janken",
	text "新しい型が、ちゃんと定義できている"
	]

janken4 :: Page
janken4 = pageTitle "じゃんけん" :| [
	text "関数xxxAgainstを定義するにあたって",
	itext 4 "等値演算ができたほうがいい",
	text "deriving Eqを使う",
	text "derivingするものが複数のときは、()と,とを使う",
	itext 4 "% vim janken.hs",
	itext 4 "data Janken = ... deriving (Show, Eq)",
	text "これで、等値演算が可能になる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load janken.hs",
	itext 4 "*Main> Rock == Rock",
	itext 4 "True",
	itext 4 "*Main> Paper == Scissors",
	itext 4 "False"
	]

janken5 :: Page
janken5 = pageTitle "じゃんけん" :| [
	text "関数xxxAgainstを定義する",
	itext 4 "% vim janken.hs",
	itext 4 "xxxAgainst :: Janken -> Janken -> Result",
	itext 4 "j `xxxAgainst` k | j == k = Draw",
	itext 4 "Rock `xxxAgainst` Paper = Lose",
	itext 4 "Paper `xxxAgainst` Scissors = Lose",
	itext 4 "Scissors `xxxAgainst` Rock = Lose",
	itext 4 "_ `xxxAgainst` _ = Win",
	text "おなじ手なら「あいこ」",
	text "ひとつめの手が負ける場合を列挙",
	text "残りは、ひとつめの手が勝つ",
	text "ワイルドカードを使って楽をしたが、",
	itext 4 "勝ちの場合も列挙したほうが、安全なコード"
	]

janken6 :: Page
janken6 = pageTitle "じゃんけん" :| [
	text "試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load janken.hs",
	itext 4 "*Main> Rock `xxxAgainst` Rock",
	itext 4 "Draw",
	itext 4 "*Main> Paper `xxxAgainst` Scissors",
	itext 4 "Lose",
	itext 4 "*Main> Rock `xxxAgainst` Scissors",
	itext 4 "Win"
	]
