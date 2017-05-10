module Main where

import Control.Monad
import Data.List.NonEmpty

import Lecture
import Montecarlo

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = do
	runLecture version $ titlePage :| [
		selfIntroduction,
		selfIntroduction2,
		samplePage,
		samplePage2
		]

titlePage :: Page
titlePage =
	writeTitle "Swiftの中心で、Haskellをさけぶ" "第19回 Swift愛好会" :| []

selfIntroduction :: Page
selfIntroduction = pageTitle "自己紹介" :| [
	text "はじめてのプログラミングは?",
	itext 4 "MSXでBASIC言語"
	]

selfIntroduction2 :: Page
selfIntroduction2 = pageTitle "自己紹介" :| [
	text "Haskellの入門書を書きました",
	writeImageRight (515 / 3, 654 / 3, "images/cover.png"),
	replicateM_ 7 . nextLine,
	text "「Haskell - 教養としての関数型プログラミング -」"
	]

samplePage, samplePage2 :: Page
samplePage = pageTitle "ここにページタイトルを置きます" :| [
	writeImageRight (128.75, 163.5, "images/cover.png"),
	text "サンプルのページですよ",
	text "これは2行目です"
	]

samplePage2 = pageTitle "ここに2つめのページタイトルを置きます" :| [
	runMontecarloRightTop 15 100,
	runMontecarloRightBottom 15 1000,
	text "サンプルのページの2つめです",
	text "これは2つめの2行目です"
	]
