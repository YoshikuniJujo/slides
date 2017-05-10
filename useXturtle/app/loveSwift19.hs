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
		selfIntroduction3,
		selfIntroduction4,
		selfIntroduction5,
		selfIntroduction6,
		selfIntroduction7,
		selfIntroduction8,
		selfIntroductionX,
		samplePage,
		samplePage2
		]

titlePage :: Page
titlePage =
	writeTitle "Swiftの中心で、Haskellをさけぶ" "第19回 Swift愛好会" :| []

selfIntroduction :: Page
selfIntroduction = pageTitle "自己紹介" :| [
	text "はじめてのプログラミングは?",
	itext 4 "中学時代に、MSXでBASIC言語",
	itext 4 "コンピュータクラブに入っていた",
	itext 4 "ただしMSXが数台しかなかったため、",
	itext 8 "紙の裏にコードを書いていた",
	text "キーボードに触れたのは?",
	itext 4 "ブラインドタッチの練習を",
	itext 8 "キーボードの絵のコピーで",
	nextLine >> text "紙のキーボード!!! 紙のディスプレイ???"
	]

selfIntroduction2 :: Page
selfIntroduction2 = pageTitle "自己紹介" :| [
	text "大学入学!!",
	itext 4 "入学祝いは、ノートパソコン",
	itext 4 "やった、紙じゃない!!!",
	itext 4 "本物だ",
	itext 4 "本物のWindowsだった",
	itext 4 "日記を書いて、メールを書いて...",
	itext 4 "えっ、プログラミングは?",
	itext 4 "BASICはどこ?(泣)"
	]

selfIntroduction3 :: Page
selfIntroduction3 = pageTitle "自己紹介" :| [
	text "Perl期",
	itext 4 "ホームページを作ろう",
	itext 4 "とりあえず、アクセスカウンタと掲示板だ!",
	itext 4 "よろしい、ならばCGIだ",
	itext 4 "CGIなら、Perlだ",
	itext 4 "このころのPerlは、かがやいていた",
	text "C言語",
	itext 4 "やばい、C言語やっとかないと、まずいらしい",
	itext 4 "とりあえず、Cは必要らしい",
	itext 4 "文字列は文字の配列?",
	itext 4 "メモリのことを、よく知っておく必要があるようだ"
	]

selfIntroduction4 :: Page
selfIntroduction4 = pageTitle "自己紹介" :| [
	text "GNU/Linux",
	itext 4 "Windowsつまらない",
	itext 4 "なに!フィンランドの学生がOSを作っただって?",
	itext 4 "さっそく試してみよう",
	itext 4 "あ、Windowsのパーティション壊しちゃった",
	itext 4 "いろんなディストリビューションがある",
	itext 8 "Turbo, Debian, Vine, Mandrake ...",
	itext 4 "パッケージをソースコードから",
	itext 8 "コンパイルするディストリ?",
	itext 8 "Gentoo! Gentoo! Gentoo!"
	]

selfIntroduction5 :: Page
selfIntroduction5 = pageTitle "自己紹介" :| [
	text "Ruby",
	itext 4 "さかのぼること約15年前",
	itext 4 "いまは亡き、雑誌「UNIX USER」",
	itext 4 "まだマイナーだったRubyの特集",
	itext 4 "「ちょっと小意気にRuby」",
	itext 4 "おもしろそうだ",
	itext 4 "書籍「オブジェクト指向スクリプト言語 Ruby」購入",
	itext 4 "オブジェクト指向、かっこいい!",
	itext 4 "静的型付けなんて古い古い、動的型付け最高!!!"
	]

selfIntroduction6 :: Page
selfIntroduction6 = pageTitle "自己紹介" :| [
	text "いろいろな言語",
	itext 4 "Python, CommonLisp, Scheme, Prolog, ...",
	itext 4 "いろいろな言語に手を出す",
	itext 4 "でも、やっぱりRubyだよね、Ruby最高",
	itext 4 "しかし、しだいに暗雲が立ちこめる",
	itext 4 "Rubyの1 + 1って1.+(1)ってことなんだよな",
	itext 4 "Rubyって第1引数をえこひいきしすぎじゃない?",
	itext 4 "それでも、僕はRubyistだから...",
	itext 4 "お、「Rubyソースコード完全解説」だって?",
	itext 4 "これは読むでしょ"
	]

selfIntroduction7 :: Page
selfIntroduction7 = pageTitle "自己紹介" :| [
	text "Haskellとの出会い",
	itext 4 "なになに「(Rubyは)",
	itext 4 "PL/IやHaskellではなくCで書かれているから",
	itext 8 "一般人でも理解できる」か",
	itext 4 "「Haskell?Haskellって何?」",
	itext 4 "2003年1月1日 Haskellの入門書を購入",
	itext 4 "本のなかほどまで読んで、やっと\"Hello, world\"",
	itext 4 "これは、{おもしろい/美しい}言語だ!!!",
	itext 4 "その後、14年間、Haskellを学び続けることになる"
	]

selfIntroduction8 :: Page
selfIntroduction8 = pageTitle "自己紹介" :| [
	text "入門書出版"
	]

selfIntroductionX :: Page
selfIntroductionX = pageTitle "自己紹介" :| [
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
