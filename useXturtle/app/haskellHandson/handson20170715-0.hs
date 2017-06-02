import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	greeting
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン!" "0. 文法等おさらい" :| []

greeting :: Page
greeting = pageTitle "ごあいさつ" :| [
	text "はじめまして",
	(>>)
		<$> writeImageCenter
			(515 * 22 / 60, 654 * 22 / 60, "images/cover.png")
		<*> replicateM_ 10 . nextLine,
	text "「Haskell 教養としての関数型プログラミング」の著者",
	itext 4 "です"
	]
