import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	specification1, specification2, module1,
	structure1, structure2, structure3, structure4,
	toField1
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン! #2" "10. 迷路ゲーム(1)" :| []

specification1 :: Page
specification1 = pageTitle "仕様" :| [
	text "これまで学んできた知識を利用して",
	itext 4 "ぎりぎり「遊べる」迷路ゲームを作る",
	text "仕様は、つぎのようになる",
	itext 4 "標準出力に一画面ずつ出力することで",
	itext 8 "ゲームの「動き」を表現する",
	text "標準出力の一文字を1マスとする",
	text "マスはスペースと'*'のどちらかであり",
	itext 4 "スペースは通れるところ'*'は通れないところ",
	text "キャラクターは'A'であらわす",
	text "キャラクターの移動はつぎのキーで入力する",
	itext 4 "h: 左, j: 下, k: 上, l: 右",
	text "左上からはじめて、右下まで行ければゴールとする"
	]

specification2 :: Page
specification2 = pageTitle "仕様" :| [
	text "ここで、ひとつ、ゲームの要素を追加する",
	text "何回かは「壁」をすりぬけられるようにする",
	text "hjklを大文字にしたHJKLを入力したとき",
	itext 4 "壁をすりぬけられる",
	text "はじめ100ポイントあり",
	itext 4 "「すりぬけ」をするたびに10ポイント減算し",
	itext 4 "0ポイントになったら負けとする",
	text "迷路のフィールドは乱数を使って生成する"
	]

module1 :: Page
module1 = pageTitle "モジュール構成" :| [
	text "モジュールの構成を考える",
	text "つぎの、ふたつのモジュールを作る",
	itext 4 "関数mainをふくむモジュール(maze.hs)",
	itext 4 "モジュールField(Field.hs)",
	text "モジュールFieldで",
	itext 4 "迷路のデータの表現や",
	itext 4 "それに対してアクセスするための関数を定義する"
	]

structure1 :: Page
structure1 = pageTitle "迷路をあらわすデータ構造" :| [
	text "迷路を通路(False)と壁(True)からなる",
	itext 4 "リストのリストとして表現する",
	text "たとえば、つぎのようなフィールドを考える",
	itext 4 "   **",
	itext 4 "*   *",
	itext 4 "**  *",
	itext 4 "***  ",
	text "これは、つぎのようになる",
	itext 4 "[",
	(>>) <$> backLine <*> itext 8 "[False, False, False, True, True],",
	itext 8 "[True, False, False, False, True],",
	itext 8 "[True, True, False, False, True],",
	itext 8 "[True, True, True, False, False] ]"
	]

structure2 :: Page
structure2 = pageTitle "迷路をあらわすデータ構造" :| [
	text "キャラクターの位置を表現するには",
	itext 4 "(3, 5)のように座標で表現すればいい",
	text "しかし、そうはしない",
	text "理由は、ここでは、説明しないが",
	itext 4 "フィールドをあらわすデータ構造に",
	itext 4 "現在位置の情報もうめこむ",
	text "そのために、それぞれのリストを、ふたつにわける"
	]

structure3 :: Page
structure3 = pageTitle "迷路をあらわすデータ構造" :| [
	text "たとえば、1行で考えて、つぎのようになっているとする",
	itext 4 "* A *",
	text "このとき、この状態を、つぎのように表現する",
	itext 4 "([False, True], [False, False, True])",
	text "キャラクターの左のマスは逆順で、ひとつめのリストとし",
	itext 4 "キャラクターのいるマスと",
	itext 4 "それより右のマスは、ふたつめのリストとする",
	text "キャラクターが右に移動したとする",
	itext 4 "*  A*",
	text "データはつぎのようになる",
	itext 4 "([False, False, True], [False, True])",
	text "うしろのリストの先頭を取り",
	itext 4 "まえのリストの先頭に追加したかたちになる"
	]

structure4 :: Page
structure4 = pageTitle "迷路をあらわすデータ構造" :| [
	text "さらに、たて方向にもおなじようにする",
	text "つぎのような状態を考える",
	itext 4 "   **",
	itext 4 "* A *",
	itext 4 "**  *",
	itext 4 "***  ",
	text "これは、つぎのようなデータになる",
	itext 2 "(",
	(>>) <$> backLine <*> itext 4 "[",
	(>>) <$> backLine <*> itext 6 "([False, False], [False, True, True]) ],",
	itext 4 "[",
	(>>) <$> backLine <*> itext 6 "([False, True], [False, False, True]),",
	itext 6 "([True, True], [False, False, True]),",
	itext 6 "([True, True], [True, False, False]) ] )"
	{-
	(>>) <$> backLine <*> itext 8 "[False, False, False, True, True],",
	itext 8 "[True, False, False, False, True],",
	itext 8 "[True, True, False, False, True],",
	itext 8 "[True, True, True, False, False] ]"
	-}
	]

toField1 :: Page
toField1 = pageTitle "関数toField" :| [
	text "リストのリストを「現在位置を含むデータ構造」に変換する",
	text "はじめの「現在位置」は左上とする",
	text "ファイルField.hsを、つぎのように作成する",
	itext 4 "module Field where",
	itext 4 "",
	itext 4 "toField ls = ([], map (\\l -> ([], l)) ls)",
	text "(ここに説明を追加するところから)"
	]
