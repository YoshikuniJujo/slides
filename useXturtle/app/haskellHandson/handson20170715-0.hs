import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	greeting, selfIntroduction, installStack
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン!" "0. 文法等おさらい" :| []

greeting :: Page
greeting = pageTitle "ごあいさつ" :| [
	text "お集まりいただき、ありがとうございます",
	(>>)
		<$> writeImageCenter
			(515 * 22 / 60, 654 * 22 / 60, "images/cover.png")
		<*> replicateM_ 10 . nextLine,
	text "「Haskell 教養としての関数型プログラミング」の著者",
	itext 4 "です"
	]

selfIntroduction :: Page
selfIntroduction = pageTitle "自己紹介" :| [
	text "この人は、こういう人",
	itext 4 "OS: Gentoo on KVM on Gentoo",
	itext 4 "言語: 日本語、Haskell",
	itext 4 "エディタ: Vim",
	itext 4 "日本語入力: TUT-code(漢字直接入力)",
	itext 4 "GUI: Xmonad",
	itext 4 "ターミナルエキュレータ: rxvt-unicode",
	itext 4 "仮想端末: Tmux",
	itext 4 "シェル: zsh",
	itext 4 "ブラウザ: Firefox + Vimperator",
	itext 4 "メールソフト: Mutt",
	itext 4 "キーボード: HHKB"
	]

installStack :: Page
installStack = pageTitle "Stackある?" :| [
	text "みなさま、もちろん処理系はインストールしてありますね!",
	text "対話環境やコンパイラを導入しないと",
	itext 4 "今日1日、指をくわえて見ていることになります",
	text "まにあうかはわかりませんが、つぎのアドレスを参考に",
	itext 4 "がんばってインストールしてみてください",
	itext 4 "「ハンズオン!」事前資料 - 2/3",
	itext 4 "http://qiita.com/hogehoge <- あとでURIを書く",
	text "さきに進ませていただきます",
	text "まずは、Stackのバージョンを確認してみましょう",
	itext 4 "% stack --version",
	itext 4 "Version 1.3.2, Git ...",
	text "僕の環境では、こうなります。",
	text "みなさんの環境は?あまり古いと動かないかも、です"
	]
