module LoveSwift19_0.Book (
	book
	) where

import Control.Monad
import Data.List.NonEmpty

import Lecture

book :: [Page]
book = [book0, book1, book2]

book0 :: Page
book0 = pageTitle "書籍紹介" :| [
	text "先月、ついに出版されました",
	writeImageCenter (515 * 21 / 60, 654 * 21 / 60, "images/cover.png"),
	(>>) <$> replicateM_ 10 . nextLine
		<*> bigIText (- 3)
			"「Haskell - 教養としての関数型プログラミング -」"
	]

book1 :: Page
book1 = pageTitle "書籍紹介" :| [
	writeImageMoreRight (515 / 6, 654 / 6, "images/cover.png"),
	text "特徴",
	itext 3 "処理系の導入から説明",
	itext 3 "「プログラミングがはじめて」でも",
	itext 3 "エディタは使える必要がある",
	itext 3 "シェルの操作にも慣れていたほうがいい",
	itext 3 "本文の説明だけでは理解できなくても",
	itext 6 "短いコードをうちこんで試すことで理解できる",
	itext 3 "使用する構文や概念はひとつずつ追加していく",
	itext 3 "あるていど意味のある例題を",
	(>>) <$> nextLine <*> bigIText 2 "僕自身が理想とする入門書"
	]

book2 :: Page
book2 = pageTitle "書籍紹介" :| [
	(>>)
		<$> replicateM_ 4 . nextLine
		<*> bigIText 5 "自己紹介と書籍の宣伝でした"
	]
