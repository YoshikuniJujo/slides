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
	"Haskell入門ハンズオン! #2" "6. いくつかの関数を学ぶ(2)" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "ひき続き、いくつかの関数を学ぶ",
	text "ここで学ぶ関数は、つぎのとおり",
	itext 4 "関数randoms, mkStdGen",
	itext 4 "関数unlines",
	itext 4 "関数read"
	]
