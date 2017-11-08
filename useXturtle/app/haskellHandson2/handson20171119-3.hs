import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	tuple1, tuple2,
	list1, list2, list3
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
