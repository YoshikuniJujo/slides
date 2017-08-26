import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude
	]

titlePage :: Page
titlePage = writeTitle
	"Haskell入門者LT会(予備)" "Haskellで並行プログラミング" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "「Haskellでソケットプログラミング」は内容すくなめ",
	text "はやく終わりすぎたときのために、こちらも用意した",
	text "Haskellで並行プログラミングをしてみよう",
	text "Haskellを学ぶとき、実は基礎よりも、",
	itext 4 "このていどの応用のほうが、かえって簡単かも"
	]
