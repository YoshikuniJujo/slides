import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	greeting, selfIntroduction, kinkyou
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン! #2" "0. はじめに" :| []

greeting :: Page
greeting = pageTitle "ごあいさつ" :| [
	text "おあつまりいただき、ありがとうございます",
	(>>)
		<$> writeImageCenter
			(515 * 22 / 60, 654 * 22 / 60, "images/cover.png")
		<*> replicateM_ 10 . nextLine,
	text "「Haskell 教養としての関数型プログラミング」の著者",
	itext 4 "です"
	]

selfIntroduction :: Page
selfIntroduction = pageTitle "自己紹介" :| [
	text "このひとは、こういうひと",
	itext 4 "OS: Gentoo on KVM on Gentoo",
	itext 4 "言語: 日本語、Haskell",
	itext 4 "エディタ: Vim",
	itext 4 "日本語入力: TUT-code(漢字直接入力)",
	itext 4 "GUI: Xmonad",
	itext 4 "ターミナルエミュレータ: rxvt-unicode",
	itext 4 "仮想端末: Tmux",
	itext 4 "シェル: zsh",
	itext 4 "ブラウザ: Firefox + Vimperator",
	itext 4 "メールソフト: Mutt",
	itext 4 "キーボード: HHKB" ]

kinkyou :: Page
kinkyou = pageTitle "近況" :| [
	text "最近、水出しコーヒーの器具を買った",
	(>>)
		<$> writeImageCenter
--			(120, 213, "images/naganeko.png")
			(120, 195, "images/naganeko.png")
		<*> replicateM_ 8 . nextLine,
	text "(あとでさしかえる、画像の大きさなども調整する)",
	text "1滴ずつ水をたらしながら何時間もかけて抽出する",
	text "豆の挽きかた(細かくか、荒くか)など、いろいろ試している"
	]
