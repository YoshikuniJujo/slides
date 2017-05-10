module Main where

import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = do
	runLecture version $ titlePage :| [
		samplePage,
		samplePage2
		]

titlePage :: Page
titlePage = [
	writeTitle "Swiftの中心で、Haskellをさけぶ" "第19回 Swift愛好会"
	]

samplePage, samplePage2 :: Page
samplePage = [
	text "サンプルのページですよ",
	text "これは2行目です"
	]

samplePage2 = [
	text "サンプルのページの2つめです",
	text "これは2つめの2行目です"
	]
