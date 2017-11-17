import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	specification1, specification2, module1,
	structure1, structure2, structure3, structure4,
	moduleField1, widthHeight1, toField1, sampleField1, sampleToField1,
	showField1, showField2, showField3, showField4,
	downf1, downf2, upf1, upf2, mapTuple1, rightf1, rightf2, leftf1, leftf2,
	moveCheck1, moveCheck2
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
	]

moduleField1 :: Page
moduleField1 = pageTitle "モジュールField" :| [
	text "ファイルField.hsを、つぎのように作成する",
	itext 4 "module Field where",
	itext 4 "",
	itext 4 "import Data.Bool",
	itext 4 "import System.Random",
	itext 4 "",
	text "モジュール宣言と必要なモジュールの導入"
	]

widthHeight1 :: Page
widthHeight1 = pageTitle "幅と高さ" :| [
	text "フィールドの幅と高さを定義する",
	itext 4 "width = 40",
	itext 4 "height = 20",
	text "これをファイルField.hsに定義しておこう"
	]

toField1 :: Page
toField1 = pageTitle "関数toField" :| [
	text "リストのリストを「現在位置を含むデータ構造」に変換",
	text "はじめの「現在位置」は左上とする",
	text "ファイルField.hsに関数toFieldを定義する",
	itext 4 "toField ls = ([], map (\\l -> ([], l)) ls)",
	text "現在位置が左上なので",
	itext 4 "すべての行で左側は空リストになる",
	itext 4 "また、上にある行はないので、やはり空リスト"
	]

sampleField1 :: Page
sampleField1 = pageTitle "サンプルのフィールド" :| [
	text "試しながら定義するためのサンプルのフィールドを用意",
	itext 4 "sample = [",
	itext 4 "        [False, False, False, True, True],",
	itext 4 "        [True, False, False, False, True],",
	itext 4 "        [True, True, False, False, True],",
	itext 4 "        [True, True, True, False, False] ]",
	text "これは、つぎのようなフィールドをあらわす",
	itext 4 "   **",
	itext 4 "*   *",
	itext 4 "**  *",
	itext 4 "***  "
	{-
	(>>) <$> backLine <*> itext 8 "[False, False, False, True, True],",
	itext 8 "[True, False, False, False, True],",
	itext 8 "[True, True, False, False, True],",
	itext 8 "[True, True, True, False, False] ]"
	-}
	]

sampleToField1 :: Page
sampleToField1 = pageTitle "サンプルのフィールド" :| [
	text "関数toFieldでサンプルのフィールドを",
	itext 4 "「現在地情報つきのフィールド」に変換する",
	itext 4 "> :load Field.hs",
	itext 4 "> toField sample",
	itext 4 "([],[([],[False,False,False,True,True]),..."
	]

showField1 :: Page
showField1 = pageTitle "フィールドを表示する" :| [
	text "フィールドを表示するために文字列化する",
	text "一行の左側を表示する関数showLを定義する",
	itext 4 "showL = map (bool ' ' '*') . reverse",
	text "左側は要素が逆順になっているので",
	itext 4 "関数reverseでもとにもどす",
	text "そのうえで、すべての要素について",
	itext 4 "関数boolでFalseなら' '、Trueなら'*'とする",
	text "右側を表示する関数showRは関数reverseを使わないだけ",
	itext 4 "showR = map (bool ' ' '*')",
	text "関数showLとshowRの定義を書き込もう"
	]

showField2 :: Page
showField2 = pageTitle "フィールドを表示する" :| [
	text "関数showLとshowRを使って",
	itext 4 "一行を文字列化する関数showLineを定義する",
	itext 4 "showLine (l, r) = showL l ++ showR r",
	text "これらを使ってフィールドを表示する関数showFieldを定義",
	itext 4 "showField (t, (l, _ : r) : b) = unlines $",
	itext 4 "        map showLine (reverse t) ++",
	itext 4 "        [showL l ++ \"A\" ++ showR r] ++",
	itext 4 "        map showLine b ++",
	itext 4 "        [replicate (width - 2) ' ' ++ \"GOAL\"]",
	text "tは上の行、lは左側、rは右側で、bは下の行",
	text "最後に「GOAL」の表示を追加した"
	]

showField3 :: Page
showField3 = pageTitle "フィールドを表示する" :| [
	text "サンプルのフィールドを表示してみよう",
	itext 4 "> :reload",
	itext 4 "> putStr . showField $ toField sample",
	itext 4 "A  **",
	itext 4 "*   *",
	itext 4 "**  *",
	itext 4 "***  ",
	itext 4 "                                      GOAL"
	]

showField4 :: Page
showField4 = pageTitle "フィールドを表示する" :| [
	text "フィールドを表示する関数putFieldを定義する",
	itext 4 "putField = putStr . showField",
	text "試してみる",
	itext 4 "> :reload",
	itext 4 "> putField $ toField sample",
	itext 4 "A  **",
	itext 4 "*   *",
	itext 4 "**  *",
	itext 4 "***  ",
	itext 4 "                                      GOAL"
	]

downf1 :: Page
downf1 = pageTitle "下方向に移動" :| [
	text "下方向に移動する関数downfを定義する",
	text "これは「壁か通路か」を判定せずに",
	itext 4 "壁であっても移動する関数だ",
	itext 4 "downf (as, [h]) = (as, [h])",
	itext 4 "downf (as, h : bs) = (h : as, bs)",
	text "hが「現在いる行」である",
	text "「現在いる行」を「上の行」とすることで",
	itext 4 "下方向に移動を実現することができる",
	text "下の行がないときは、そのまま変化させない"
	]

downf2 :: Page
downf2 = pageTitle "下方向に移動" :| [
	text "対話環境で試してみよう",
	itext 4 "> putField . downf $ toField sample",
	itext 4 "   **",
	itext 4 "A   *",
	itext 4 "**  *",
	itext 4 "***  ",
	text "キャラクター(A)が下に移動した(壁をすりぬけている)",
	text "GOALの表示は、ここでは省略する"
	]

upf1 :: Page
upf1 = pageTitle "上方向に移動" :| [
	text "上方向への移動関数を定義する",
	text "こちらも壁をすりぬける",
	itext 4 "upf ([], hbs) = ([], hbs)",
	itext 4 "upf (a : as, hbs) = (as, a : hbs)",
	text "下方向への移動と、だいたいおなじだ",
	text "上の行(a)を現在の行にしている"
	]

upf2 :: Page
upf2 = pageTitle "上方向に移動" :| [
	text "対話環境で試してみよう",
	itext 4 "> :reload",
	itext 4 "> f = downf . downf $ toField sample",
	itext 4 "> putField f",
	itext 4 "   **",
	itext 4 "*   *",
	itext 4 "A*  *",
	itext 4 "***  ",
	itext 4 "> putField $ upf f",
	itext 4 "   **",
	itext 4 "A   *",
	itext 4 "**  *",
	itext 4 "***  "
	]

mapTuple1 :: Page
mapTuple1 = pageTitle "タプルの2要素に、おなじ変換を" :| [
	itext (- 2) "左右方向への移動を実装するまえに",
	itext 0 "タプルの2要素に、おなじ変換をする関数を定義",
	itext 0 "mapTuple f (x, y) = (f x, f y)",
	itext (- 2) "試してみる",
	itext 0 "> :reload",
	itext 0 "> mapTuple (map (\\x -> x * 2)) ([1, 2, 3], [10, 20])",
	itext 0 "([2,4,6],[20,40])",
	itext (- 2) "関数mapTupleとmapとを組み合わせて",
	itext 0 "ふたつのリストの全要素に、おなじ変換をしている"
	]

rightf1 :: Page
rightf1 = pageTitle "右方向への移動" :| [
	text "右方向への移動関数rightfを定義する",
	itext 4 "rightf = mapTuple . map $ \\lhr -> case lhr of",
	itext 4 "        (_, [_]) -> lhr",
	itext 4 "        (ls, h : rs) -> (h : ls, rs)",
	text "「リストのタプル」の全要素に",
	itext 4 "「\\lhr ->」以下の変換を適用している",
	text "「変換」は現在のマスを左に動かしている"
	]

rightf2 :: Page
rightf2 = pageTitle "右方向への移動" :| [
	text "試してみる",
	itext 4 "> :reload",
	itext 4 "> putField . rightf $ toField sample",
	itext 4 " A **",
	itext 4 "*   *",
	itext 4 "**  *",
	itext 4 "***  "
	]

leftf1 :: Page
leftf1 = pageTitle "左方向への移動" :| [
	text "左方向への移動関数leftfを定義する",
	itext 4 "leftf = mapTuple . map $ \\lhr -> case lhr of",
	itext 4 "        ([], _) -> lhr",
	itext 4 "        (l : ls, hrs) -> (ls, l : hrs)"
	]

leftf2 :: Page
leftf2 = pageTitle "左方向への移動" :| [
	text "試してみる",
	itext 4 "> :reload",
	itext 4 "> f = rightf . rightf . rightf $ toField sample",
	itext 4 "> putField f",
	itext 4 "   A*",
	itext 4 "*   *",
	itext 4 "**  *",
	itext 4 "***  ",
	itext 4 "> putField $ leftf f",
	itext 4 "  A**",
	itext 4 "*   *",
	itext 4 "**  *",
	itext 4 "***  "
	]

moveCheck1 :: Page
moveCheck1 = pageTitle "壁はすりぬけない" :| [
	text "それぞれの移動の「壁をすりぬけないバージョン」を定義",
	itext 4 "[up, down, left, right] =",
	itext 4 "        map check [upf, downf, leftf, rightf]",
	itext 4 "        where check m f = case m f of",
	itext 4 "                (_, (_, True : _) : _) -> f",
	itext 4 "                f' -> f'",
	text "関数checkは移動さきが「壁」であったときに",
	itext 4 "移動しないようにする関数",
	text "リストリテラルパターンを使って一気に定義している"
	]

moveCheck2 :: Page
moveCheck2 = pageTitle "壁はすりぬけない" :| [
	text "試してみる",
	itext 4 "> :reload",
	itext 4 "> f = toField sample",
	itext 4 "> putField $ down f",
	itext 4 "A  **",
	itext 4 "*   *",
	itext 4 "...",
	itext 4 "> putField $ right f",
	itext 4 " A **",
	itext 4 "*   *",
	itext 4 "...",
	text "下方向への移動は「壁」なので、できない",
	text "右方向への移動は「通路」なので、できる"
	]
