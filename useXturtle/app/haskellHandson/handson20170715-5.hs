import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	janken, janken2, janken3, janken4, janken5, janken6,
	squareAndCircleType, squareAreaType, circleAreaType,
	squareAndCircleSamplesType, mismatchedType,
	squareAndCircleData, squareAndCircleSamplesData,
	squareAreaData, circleAreaData, mismatchedData,
	unify, unifySamples, unifyArea,
	jankenAgain
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン!" "5. 代数的データ型" :| []

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

squareAndCircleType :: Page
squareAndCircleType = pageTitle "正方形と円" :| [
	text "直交座標上の正方形は",
	itext 4 "左上の点と1辺の長さで表現できる",
	text "これを、タプルで表現すると",
	itext 4 "% vim squareAndCircleType.hs",
	itext 4 "type Square = ((Double, Double), Double)",
	text "このように表すことができる",
	text "おなじように円は、中心と半径とで表現できる",
	itext 4 "% vim squareAndCircleType.hs",
	itext 4 "type Circle = ((Double, Double), Double)"
--	text "型シノニムは型の「別名」",
--	text "型SquareとCircleとは「おなじ型」となる"
	]

squareAreaType :: Page
squareAreaType = pageTitle "正方形の面積" :| [
	text "正方形の面積をもとめる関数",
	itext 4 "% vim squareAndCircleType.hs",
	itext 4 "squareArea :: Square -> Double",
	itext 4 "squareArea (_, x) = x ^ 2",
	text "試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load squareAndCircleType.hs",
	itext 4 "*Main> squareArea ((10, 20), 15)",
	itext 4 "225.0"
	]

circleAreaType :: Page
circleAreaType = pageTitle "円の面積" :| [
	text "円の面積をもとめる関数",
	itext 4 "% vim squareAndCircleType.hs",
	itext 4 "circleArea :: Circle -> Double",
	itext 4 "circleArea (_, r) = r ^ 2 * pi",
	text "試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load squareAndCircleType.hs",
	itext 4 "*Main> circleArea ((30, 45), 12)",
	itext 4 "452.3893421169302"
	]

squareAndCircleSamplesType :: Page
squareAndCircleSamplesType = pageTitle "正方形と円のサンプル" :| [
	text "正方形と円の例を定義する",
	itext 4 "% vim squareAndCircleType.hs",
	itext 4 "sampleSquare :: Square",
	itext 4 "sampleSquare = ((10, 20), 15)",
	itext 4 "sampleCircle :: Circle",
	itext 4 "sampleCircle = ((30, 45), 12)",
	text "試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load squareAndCircleType.hs",
	itext 4 "*Main> squareArea sampleSquare",
	itext 4 "225.0",
	itext 4 "*Main> circleArea sampleCircle",
	itext 4 "452.3893421169302"
	]

mismatchedType :: Page
mismatchedType = pageTitle "正方形なの?円なの?" :| [
	text "ところで、つぎのようなことを試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load squareAndCircleType.hs",
	itext 4 "*Main> squareArea sampleCircle",
	itext 4 "144.0",
	itext 4 "*Main> circleArea sampleSquare",
	itext 4 "706.8583470577034",
	text "何事もなかったように、まちがった答えが計算される",
	text "これは問題だ",
	text "type構文で作られる型シノニムは、ただの型の別名",
	text "ここでの型SquareとCircleとは、おなじ型"
	]

squareAndCircleData :: Page
squareAndCircleData = pageTitle "正方形と円を代数的データ型で" :| [
	text "型の別名ではなく「新しい型」を定義する",
	itext 4 "% vim squareAndCircleData.hs",
	itext 4 "data Square = Square (Double, Double) Double",
	itext 4 "data Circle = Circle (Double, Double) Double",
	text "このままだと、対話環境で表示できないので",
	itext 4 "deriving Showをつける",
	itext 4 "% vim squareAndCircleData.hs",
	itext 4 "data Square = ... deriving Show",
	itext 4 "data Circle = ... deriving Show"
	]

squareAndCircleSamplesData :: Page
squareAndCircleSamplesData = pageTitle "正方形と円のサンプル" :| [
	text "正方形と円のサンプルを定義する",
	itext 4 "% vim squareAndCircleData.hs",
	itext 4 "sampleSquare :: Square",
	itext 4 "sampleSquare = Square (10, 20) 15",
	itext 4 "sampleCircle :: Circle",
	itext 4 "sampleCircle = Circle (30, 45) 12",
	text "対話環境でみてみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load squareAndCircleData.hs",
	itext 4 "*Main> sampleSquare",
	itext 4 "Square (10.0,20.0) 15.0",
	itext 4 "*Main> sampleCircle",
	itext 4 "Circle (30.0,45.0) 12.0"
	]

squareAreaData :: Page
squareAreaData = pageTitle "正方形の面積" :| [
	text "正方形の面積をもとめる関数を定義する",
	itext 4 "% vim squareAndCircleData.hs",
	itext 4 "squareArea :: Square -> Double",
	itext 4 "squareArea (Square _ x) = x ^ 2",
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load squareAndCircleData.hs",
	itext 4 "*Main> squareArea sampleSquare",
	itext 4 "225.0"
	]

circleAreaData :: Page
circleAreaData = pageTitle "円の面積" :| [
	text "円の面積をもとめる関数を定義する",
	itext 4 "% vim squareAndCircleData.hs",
	itext 4 "circleArea :: Circle -> Double",
	itext 4 "circleArea (Circle _ r) = r ^ 2 * pi",
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load squareAndCircleData.hs",
	itext 4 "*Main> circleArea sampleCircle",
	itext 4 "452.3893421169302"
	]

mismatchedData :: Page
mismatchedData = pageTitle "正方形なの?円なの?" :| [
	text "つぎのように試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load squareAndCircleData.hs",
	itext 4 "*Main> squareArea sampleCircle",
	itext 4 "(型エラーが生じる)",
	itext 4 "*Main> circleArea sampleSquare",
	itext 4 "(型エラーが生じる)",
	text "対話環境だとはっきりしないが",
	itext 4 "型エラーはコンパイル時に起きる",
	text "コンパイルが通れば、このようなエラーはないということ"
	]

unify :: Page
unify = pageTitle "正方形も円も図形だ" :| [
	text "正方形も円も、どちらも「図形」だ",
	text "ひとつの型の値にできるはず",
	itext 4 "% vim squareAndCircleUnion.hs",
	itext 4 "data Shape",
	itext 8 "= Square (Double, Double) Double",
	itext 8 "| Circle (Double, Double) Double",
	itext 8 "deriving Show"
	]

unifySamples :: Page
unifySamples = pageTitle "正方形と円のサンプル" :| [
	text "正方形と円のサンプルを定義する",
	itext 4 "% vim squareAndCircleUnion.hs",
	itext 4 "sampleSquare :: Shape",
	itext 4 "sampleSquare = Square (10, 20) 15",
	itext 4 "sampleCircle :: Shape",
	itext 4 "sampleCircle = Circle (30, 45) 12",
	text "対話環境で、みてみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load squareAndCircleUnion.hs",
	itext 4 "*Main> sampleSquare",
	itext 4 "Square (10,20) 15",
	itext 4 "*Main> sampleCircle",
	itext 4 "Circle (30,45) 12"
	]

unifyArea :: Page
unifyArea = pageTitle "正方形と円の面積" :| [
	text "正方形と円の面積の両方をもとめる関数を定義する",
	itext 4 "% vim squareAndCircleUnion.hs",
	itext 4 "area :: Shape -> Double",
	itext 4 "area (Square _ x) = x ^ 2",
	itext 4 "area (Circle _ r) = r ^ 2 * pi",
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load squareAndCircleUnion.hs",
	itext 4 "*Main> area sampleSquare",
	itext 4 "225.0",
	itext 4 "*Main> area sampleCircle",
	itext 4 "452.3893421169302"
	]

jankenAgain :: Page
jankenAgain = pageTitle "じゃんけんの例との比較" :| [
	text "型Jankenと型Shapeの、ふたつの定義を比較する",
	itext 4 "data Janken = Rock | Paper | Scissors",
	itext 4 "data Shape",
	itext 8 "= Square (Double, Double) Double",
	itext 8 "| Circle (Double, Double) Double",
	text "値構築子SquareやCircleは、引数をふたつとる",
	itext 4 "(ひとつめはタプル、ふたつめはDouble型の値)",
	text "おなじように",
	itext 4 "値構築子Rock, Paper, Scissorsは",
	itext 4 "「引数を0個とる」と考えることができる"
	]
