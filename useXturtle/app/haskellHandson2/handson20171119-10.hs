import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	specification1, specification2
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
