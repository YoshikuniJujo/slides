import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	list1, list2
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン! #2" "3. リストとcase式" :| []

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
