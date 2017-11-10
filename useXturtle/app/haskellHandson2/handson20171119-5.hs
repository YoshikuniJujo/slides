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
	"Haskell入門ハンズオン! #2" "5. いくつかの関数を学ぶ(1)" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "Haskellで、はじめから定義されている関数のうちの",
	itext 4 "いくつかを紹介する",
	text "紹介するのは、つぎの、11個の関数(演算子)",
	itext 4 "いくつかの関数を学ぶ(1)",
	itext 8 "関数map, filter, take, drop",
	itext 8 "関数replicate, reverse",
	itext 8 "演算子(++)",
	itext 4 "いくつかの関数を学ぶ(2)",
	itext 8 "関数randoms, mkStdGen",
	itext 8 "関数unlines",
	itext 8 "関数read",
	text "ざっくりと、使いかたのみを紹介する"
	]
