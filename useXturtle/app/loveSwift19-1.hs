import Data.List.NonEmpty

import Control.Monad

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	greeting, introduction, mosadomo
	]

titlePage :: Page
titlePage =
	writeTitle "Swiftの中心で、Haskellをさけぶ" "第19回 Swift愛好会" :| []

greeting :: Page
greeting = pageTitle "ごあいさつ" :| [
	text "はじめまして、おまねきいただき、ありがとうございます",
	(>>)
		<$> writeImageCenter
			(515 * 22 / 60, 654 * 22 / 60, "images/cover.png")
		<*> replicateM_ 10 . nextLine,
	text "「Haskell 教養としての関数型プログラミング」の著者です"
	]

introduction :: Page
introduction = pageTitle "本の紹介" :| [
	writeImageMoreRight (515 / 6, 654 / 6, "images/cover.png"),
	text "Haskellの入門書です",
	text "僕の理想をつめこんだ入門書です",
	text "本に書かれた内容を愚直に実行していけば",
	itext 4 "Haskellの考えかたが身につく",
	text "それを目指して書きました",
	text "あつかう内容を最小限とするように腐心しました",
	text "入門書は、すくない内容にたいして",
	itext 4 "たくさんの実践で説明するべき、と考えています",
	text "僕とおなじタイプの「とにかく手を動かして結果を見たい」",
	itext 4 "そういうかたに最適な入門書です",
	text "よろしくおねがいします"
	]

mosadomo :: Page
mosadomo = pageTitle "どうしよう" :| [
	text "「Swift愛好会」にまねいていただき光栄に思っています",
	text "しかし、おそらく、ここは、実践できたえられた",
	itext 4 "Swiftの猛者たちの集まっている場かと思います",
	text "僕のような「もやしっ子」が何を話せばいいのか",
	itext 4 "と、たじろいでいます",
	text "まず、第一に言いたいことは",
	itext 4 "Haskellを学ぶことで、絶対に得する、ということです"
	]
