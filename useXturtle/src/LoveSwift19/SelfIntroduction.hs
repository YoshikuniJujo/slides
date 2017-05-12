module LoveSwift19.SelfIntroduction (
	selfIntroduction
	) where

import Lecture
import Data.List.NonEmpty

selfIntroduction :: [Page]
selfIntroduction = [
		selfIntroduction1,
		selfIntroduction2,
		selfIntroduction3,
		selfIntroduction4,
		selfIntroduction5,
		selfIntroduction6,
		selfIntroduction7,
		selfIntroduction8,
		selfIntroduction9 ]

selfIntroduction1 :: Page
selfIntroduction1 = pageTitle "自己紹介" :| [
	text "はじめてのプログラミングは?",
	itext 4 "中学時代に、MSXでBASIC言語",
	itext 4 "コンピュータクラブに入っていた",
	itext 4 "ただしMSXが数台しかなかったため、",
	itext 8 "紙の裏にコードを書いていた",
	text "キーボードに触れたのは?",
	itext 4 "ブラインドタッチの練習を",
	itext 8 "キーボードの絵のコピーで",
	(>>) <$> nextLine
		<*> bigIText 2 "紙でコーディング??? 紙のキーボード!!!"
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
	text "入門書出版",
	itext 4 "転職サイトでHaskellを検索",
	itext 4 "Haskellに興味のある会社に面接に行ってみる",
	itext 4 "社員のかたにHaskellを教えることになる",
	itext 4 "スライドを作成し週一でレクチャー",
	itext 4 "他の会社の、コードを見たかたからスカウト",
	itext 4 "(株)Reproに、ちょいちょい遊びに行くように",
	itext 8 "(「Repro飯」もいただきました)",
	itext 4 "CTOのかたにHaskellを教えはじめる",
	itext 4 "今日、まねいていただいた七島さんに",
	itext 8 "秀和システムの編集のかたを紹介してもらう"
	]

selfIntroduction9 :: Page
selfIntroduction9 = pageTitle "自己紹介" :| [
	text "入門書出版(続き)",
	itext 4 "編集のかたにHaskellのすばらしさを熱弁する",
	itext 4 "Haskellの入門書の出版が決まる",
	itext 4 "レクチャー用のスライドとウェブページに",
	itext 8 "肉づけ、説明を追加、サンプルコードも追加",
	itext 4 "半年ほどで出版のはずだったが",
	itext 8 "何度となく読み返し",
	itext 8 "構成の修正、誤字脱字のチェック、",
	itext 8 "処理系のインストールのテスト、",
	itext 8 "読点の追加、鉤括弧の追加、",
	itext 8 "索引の作成などで、結局1年ちょっとかかる"
	]
