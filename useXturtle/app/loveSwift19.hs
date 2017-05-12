module Main where

-- import Control.Monad
import Data.List.NonEmpty

import Lecture
import Montecarlo
import LoveSwift19.SelfIntroduction
import LoveSwift19.Book

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = do
	runLecture version $ titlePage :| selfIntroduction ++ book ++ [
		samplePage2
		]

titlePage :: Page
titlePage =
	writeTitle "Swiftの中心で、Haskellをさけぶ" "第19回 Swift愛好会" :| []

samplePage2 :: Page
samplePage2 = pageTitle "ここに2つめのページタイトルを置きます" :| [
	runMontecarloRightTop 15 100,
	runMontecarloRightBottom 15 1000,
	text "サンプルのページの2つめです",
	text "これは2つめの2行目です"
	]
