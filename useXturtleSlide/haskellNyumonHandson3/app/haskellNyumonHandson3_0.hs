module Main where

import Data.List.NonEmpty
import Graphics.X11.Slide

version :: Version
version = [0, 0, 0, 1]

main :: IO ()
main = runSlide version someSlide

someSlide :: Slide
someSlide = title :| [
	prelude, selfIntroduction, vimperator, vimperatorFadeAway,
	aboutThisSlide,
	aboutLecture1, aboutLecture2, aboutLecture3
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #3" "0. はじめに" :| []

prelude :: Page
prelude = pageTitle "ごあいさつ" :| [
	text "おあつまりいただき、ありがとうございます",
	writeImage 0.3 0.25 170 210 "images/cover.png",
	text "「Haskell - 教養としての関数型プログラミング」の",
	itext 20 "著者です"
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
	itext 4 "キーボード: HHKB"
	]

vimperator :: Page
vimperator = pageTitle "Vimperator" :| [
	text "Vimperatorは、FirefoxをVimの指づかいで使えるアドオン"
		>> nextLine,
	text "ところで、Firefoxに新しいバージョンが出たらしい",
	text "Firefoxの最新バージョンである58(Quantum)の評判は上々",
	text "Firefox派としては、うれしいかぎり",
	text "と、思っていたのだが、Add-onsのVimperatorのページで",
	nextLine
		>> itext 4 "_人人人人人人人人人人人人人人人人人人人_"
		>> nextLine
		>> itext 4 "> 突然の「Quantumと互換性がありません」<"
		>> nextLine
		>> itext 4 "~Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y^Y~"
	]

vimperatorFadeAway :: Page
vimperatorFadeAway = pageTitle "Vimperator難民" :| [
	text "僕の指はVimperatorに最適化されてしまっている",
	text "Gentooの安定版では、まだ52.6.0なのでいいが",
	itext 4 "いつかは移行しなければならないし",
	itext 4 "いまをときめくRustで書かれたCSSエンジン?",
	itext 8 "-> 興味深い -> 移行したい",
	text "現在はVimium-FFを検討中" >> nextLine,
	text "みなさんのなかで",
	itext 4 "おなじようなVimperator難民のかたはいますか?"
	]

aboutThisSlide :: Page
aboutThisSlide = pageTitle "このスライドについて" :| [
	text "このスライドはHaskellのxturtleという",
	itext 4 "「亀を動かして絵を書こう」的パッケージを",
	itext 4 "使っています",
	text "GHCの対話環境(GHCi)からのコマンド入力を",
	itext 4 "その都度反映できるように",
	itext 4 "GTK等ではなくXlibを直接使っています",
	itext 4 "結果として移植性が低くなってしまった",
	itext 4 "XWindowシステム上でなら動くと思います",
	text "もしよければ、xturtleパッケージ、使ってみてください",
	text "そのうちQiitaにでも解説を書こうかと思っています"
	]

aboutLecture1 :: Page
aboutLecture1 = pageTitle "拙書について" :| [
	text "さて、今日のハンズオンですが",
	itext 4 "拙書「教養としての関数型プログラミング」の",
	itext 4 "「四則演算の構文解析」の例題を題材にします",
	text "拙書についてですが",
	itext 4 "「ひとつの概念に、ひとつのコード例」をめざす",
	itext 4 "結果として「大きい本」になってしまった",
	itext 4 "広い範囲をあつかっているのではなく",
	itext 4 "せまい範囲を「しっかりと説明」している",
	text "といった特徴があります"
	]

aboutLecture2 :: Page
aboutLecture2 = pageTitle "今日のハンズオンについて" :| [
	text "今日の例題は700ページのなかの300ページあたり",
	text "例題に使われる要素すべてを「しっかり」説明すると",
	itext 4 "それだけの量になってしまうので",
	text "今日は、それぞれの要素をちょっとずつ「つまみ食い」",
	text "しっかりと学ぼうと思ったら",
	itext 4 "拙書を読んでいただけると、ありがたい",
	text "もちろん、拙書の読書でなくても",
	itext 4 "質問等は大歓迎ですので",
	itext 4 "最後に紹介するGmail, Slack, Twitter等で",
	itext 4 "よろしくおねがいします"
	]

aboutLecture3 :: Page
aboutLecture3 = pageTitle "今日のハンズオンについて" :| [
	text "今回は、それぞれの要素を体系的に説明するのではなく",
	itext 4 "コードを書きながら説明していく形式にします"
	]
