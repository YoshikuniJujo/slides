import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	tuple1, tuple2,
	list1, list2, list3,
	listRec1, listRec2, listRec3, listRec4,
	listRec5, listRec6, listRec7, listRec8, listRec9,
	whereClause1, whereClause2
	]

titlePage :: Page
titlePage = writeTitle
	"Haskell入門ハンズオン! #2" "3. タプル、リスト、case式" :| []

tuple1 :: Page
tuple1 = pageTitle "タプル" :| [
	text "複数の値をセットにして、ひとつの値にしたい?",
	text "タプルを使っては、いかがでしょうか",
	itext 4 "> (\"Yoshikuni Jujo\", 37)",
	itext 4 "(\"Yoshikuni Jujo\",37)",
	itext 4 "> yj = it",
	text "変数itで直前に評価された値を取り出せる",
	text "タプルのなかみを取り出すにもパターンマッチを使う",
	itext 4 "> :{",
	itext 4 "| showPerson (n, a) =",
	itext 4 "|     n ++ \" (\" ++ show a ++ \")\"",
	itext 4 "> :}",
	itext 4 "> showPerson yj",
	itext 4 "\"Yoshikuni Jujo (37)\""
	]

tuple2 :: Page
tuple2 = pageTitle "タプル" :| [
	text "タプルを使うと複数の値を、まとめてひとつの値にできる",
	text "丸括弧でかこんで、値どうしをカンマでくぎる",
	itext 4 "(\"foo\", 123)",
	text "なかみを取り出すにはパターンマッチを使う",
	itext 4 "bar (x, y) = ..."
	]

list1 :: Page
list1 = pageTitle "リスト" :| [
	text "Haskellでよく使われるデータ構造としてリストがある",
	text "0個以上のおなじタイプのデータを順番に並べたもの",
	text "対話環境でみてみよう",
	itext 4 "> [3, 2, 8, 5, 4]",
	itext 4 "[3,2,8,5,4]",
	text "リストを先頭に追加するには、演算子(:)を使う",
	itext 4 "> 3 : [2, 8, 5, 4]",
	itext 4 "[3,2,8,5,4]",
	itext 4 "> 3 : 2 : [8, 5, 4]",
	itext 4 "[3,2,8,5,4]",
	itext 4 "> 3 : 2 : 8 : 5 : 4 : []",
	itext 4 "[3,2,8,5,4]"
	]

list2 :: Page
list2 = pageTitle "リスト" :| [
	text "対話環境に入力した式をみてみよう",
	itext 4 "3 : 2 : 8 : 5 : 4 : []",
	text "空リストの先頭に4, 5, 8, 2, 3の順で追加していき",
	itext 4 "結果として、つぎのようなリストに評価された",
	itext 4 "[3,2,8,5,4]",
	text "そのようにみえる、しかし",
	text "実は、後者のような表示は「わかりやすさ」のため",
	text "本当は3 : (2 : (8 : (5 : (4 : []))))として保存される",
	text "なので、",
	text "x : xsのようなパターンでマッチしてやると",
	itext 4 "先頭(3)が変数xを",
	itext 4 "残り(8 : (5 : ...))が変数xsを束縛する"
	]

list3 :: Page
list3 = pageTitle "リスト" :| [
	text "先頭の値と残りのリストからなるタプルを作る関数",
	text "空リストのときは値をもたない",
	itext 4 "headTail [] = Nothing",
	itext 4 "headTail (x : xs) = Just (x, xs)",
	text "対話環境で試してみよう",
	itext 4 "> :{",
	itext 4 "| headTail [] = Nothing",
	itext 4 "| headTail (x : xs) = Just (x, xs)",
	itext 4 "> :}",
	itext 4 "> headTail [3, 2, 8, 5, 4]",
	itext 4 "Just (3,[2,8,5,4])"
	]

listRec1 :: Page
listRec1 = pageTitle "リストに対する再帰関数" :| [
	text "リストに対しても再帰関数が定義できる",
	text "整数のリストの、すべての値をたしあわせる関数",
	itext 4 "mySum [] = 0",
	itext 4 "mySum (x : xs) = x + mySum xs",
	text "空リストの総和は0",
	text "リストxsの先頭に整数値xを追加したリストの総和は",
	itext 4 "整数値xと",
	itext 4 "リストxsの総和とを、たし算した値"
	]

listRec2 :: Page
listRec2 = pageTitle "リストに対する再帰関数" :| [
	text "対話環境で試す",
	itext 4 "> :{",
	itext 4 "| mySum [] = 0",
	itext 4 "| mySum (x : xs) = x + mySum xs",
	itext 4 "> :}",
	itext 4 "> mySum [1, 2, 3, 4, 5]",
	itext 4 "15"
	]

listRec3 :: Page
listRec3 = pageTitle "リストに対する再帰関数" :| [
	text "もとのリストの要素をすべて2倍したリストを作る",
	itext 4 "toDoubleAll [] = [] ",
	itext 4 "toDoubleAll (x : xs) = x * 2 : toDoubleAll xs",
	text "空リストのすべての要素を2倍したリストは空リスト",
	text "リストxsの先頭に整数値xを追加したリストの",
	itext 8 "要素のすべてを2倍したリストは",
	itext 4 "リストxsのすべての要素を2倍したリストの先頭に",
	itext 4 "整数値xを2倍した値を追加したもの"
	]

listRec4 :: Page
listRec4 = pageTitle "リストに対する再帰関数" :| [
	text "対話環境で試す",
	itext 3 "> :{",
	itext 3 "| toDoubleAll [] = []",
	itext 3 "| toDoubleAll (x : xs) = x * 2 : toDoubleAll xs",
	itext 3 "> :}",
	itext 3 "> toDoubleAll [1, 2, 3, 4, 5]",
	itext 3 "[2,4,6,8,10]"
	]

listRec5 :: Page
listRec5 = pageTitle "リストに対する再帰関数" :| [
	text "もとのリストの要素のうち奇数のみを取り出したリスト",
	text "奇数であることを確認する関数oddを使う",
	itext 4 "> odd 8",
	itext 4 "False",
	itext 4 "> odd 13",
	itext 4 "True",
	text "値FalseやTrueは、Bool値であり",
	itext 4 "値Falseが「そうでない」を",
	itext 4 "値Trueが「そうである」をあらわす"
	]

listRec6 :: Page
listRec6 = pageTitle "リストに対する再帰関数" :| [
	text "値FalseやTrueに対して",
	itext 3 "それぞれの値をかえす関数bool",
	itext 3 "> :module Data.Bool",
	itext 3 "> bool \"BOO\" \"GOOD\" False",
	itext 3 "\"BOO\"",
	itext 3 "> bool \"BOO\" \"GOOD\" True",
	itext 3 "\"GOOD\"",
	text "コマンド:moduleでモジュールData.Boolを読み込んでいる",
	text "これで、関数boolが導入される",
	text "関数boolの使いかたは、つぎのようになる",
	itext 3 "bool [Falseのときの値] [Trueのときの値] [Bool値]"
	]

listRec7 :: Page
listRec7 = pageTitle "リストに対する再帰関数" :| [
	text "関数oddとboolとを組み合わせる",
	itext 4 "> bool \"It isn't odd.\" \"It's odd!\" (odd 8)",
	itext 4 "\"It isn't odd.\"",
	itext 4 "> bool \"It isn't odd.\" \"It's odd!\" (even 13)",
	itext 4 "\"It's odd!\""
	]

listRec8 :: Page
listRec8 = pageTitle "リストに対する再帰関数" :| [
	text "リストのなかから奇数だけ取り出す関数",
	itext 3 "onlyOdd [] = []",
	itext 3 "onlyOdd (x : xs) =",
	itext 7 "bool (onlyOdd xs) (x : onlyOdd xs) (odd x)",
	text "空リストから奇数だけ取り出したリストは空リスト",
	text "リストxsの先頭に整数値xを追加したリストから",
	itext 7 "奇数だけを取り出したリストは",
	itext 0 "xが奇数ではないとき",
	itext 3 "リストxsから奇数のみ取り出したリスト",
	itext 0 "xが奇数のとき",
	itext 3 "リストxsから奇数のみ取り出したリストに値xを追加"
	]

listRec9 :: Page
listRec9 = pageTitle "リストに対する再帰関数" :| [
	text "ファイルlistRec.hsに定義を書く",
	itext 2 "onlyOdd [] = []",
	itext 2 "onlyOdd (x : xs) =",
	itext 2 "        bool (onlyOdd xs) (x : onlyOdd xs) (odd x)",
	text "対話環境で試す",
	itext 2 "> :load listRec.hs",
	itext 2 "> onlyOdd [1, 2, 3, 4, 5]",
	itext 2 "[1,3,5]"
	]

whereClause1 :: Page
whereClause1 = pageTitle "where節" :| [
	text "関数onlyOddの定義をみてみよう",
	itext 2 "onlyOdd [] = []",
	itext 2 "onlyOdd (x : xs) =",
	itext 2 "        bool (onlyOdd xs) (x : onlyOdd xs) (odd x)",
	text "onlyOdd xsが2回、使われている",
	text "DRY(Don't Repeat Your Self)原則に反している",
	text "ファイルlistRec.hsにある定義を書き換えよう",
	itext 2 "onlyOdd [] = []",
	itext 2 "onlyOdd (x : xs) = bool xs' (x : xs') (odd x)",
	itext 2 "        where xs' = onlyOdd xs",
	text "where節を使ってローカル変数xs'を定義した"
	]

whereClause2 :: Page
whereClause2 = pageTitle "where節" :| [
	text "対話環境で試す",
	itext 4 "> :reload",
	itext 4 "> onlyOdd [1, 2, 3, 4, 5]",
	itext 4 "[1,3,5]"
	]
