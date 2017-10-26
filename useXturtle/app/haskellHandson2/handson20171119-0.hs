import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	greeting, selfIntroduction, kinkyou, nerai,
	dekinai, dekinaiN,
	kousei
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
	(\x y z -> x >> y >> z)
		<$> writeImageCenterLeft
			(100, 200, "images/moving_preuse.png")
		<*> writeImageCenterRight
			(100, 200, "images/moving_use.png")
		<*> replicateM_ 10 . nextLine,
	itext (- 2) "1滴ずつ水をたらしながら何時間もかけて抽出する",
	itext (- 2) "豆の挽きかた(細かくか、荒くか)など、いろいろ試している"
	]

nerai :: Page
nerai = pageTitle "今日のねらい" :| [
	text "Haskellの魅力を知ってもらう",
	(>>)
		<$> nextLine
		<*> text "そのために",
	itext 4 "実際にHaskellを動かしてみる",
	itext 4 "Haskellの特徴がわかる例を示す",
	itext 4 "Haskellでなにか作ってみる",
	(>>)
		<$> nextLine
		<*> text "しかし",
	itext 4 "本当の魅力を紹介することは困難",
	itext 4 "時間の制約がある",
	itext 4 "今日の「紹介」を入口にして",
	itext 8 "本当の魅力を知るところまで学んでほしい"
	]

dekinai :: Page
dekinai = pageTitle "今日はねらわないこと" :| [
	text "Haskellの本当の魅力はわからない",
	(>>)
		<$> nextLine
		<*> text "なぜなら",
	itext 4 "Haskellの魅力のひとつは「複雑さの制御」",
	itext 8 "-> 短時間で紹介できる例では実感しづらい",
	itext 4 "保守性の高さ",
	itext 8 "-> コードを長年保守しないとわからない",
	itext 4 "構文によって、かくされた意味論の美しさ",
	itext 8 "-> 短時間では「すっぴん」は紹介できない",
	itext 4 "深みに、はまる楽しさ",
	itext 8 "-> マニアになるまでわからない"
	]

dekinaiN :: Page
dekinaiN = pageTitle "(ねらわないことの各論)" :| [
	text "ここに4枚の「それぞれのねらわないこと」のスライドを置く"
	]

kousei :: Page
kousei = pageTitle "前半の流れ" :| [
	text "前半ではハンズオン形式でひととおりの基礎を学ぶ",
	text "後半ではオリジナルプロダクトを作る",
	text "前半の流れは、つぎのようになる",
	itext 4 "0. あいさつ、前置き (このスライド)",
	itext 4 "1. 関数を学ぶ",
	itext 4 "2. 再帰関数を学ぶ",
	itext 4 "3. 多相関数を学ぶ",
	itext 4 "4. 関数mapを学ぶ",
	itext 4 "5. 入出力を学ぶ (do記法で)",
	itext 4 "6. プロダクトの例 ",
	itext 4 "7. 書籍の宣伝"
	]
