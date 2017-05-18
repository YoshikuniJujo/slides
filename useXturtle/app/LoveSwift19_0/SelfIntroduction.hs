module LoveSwift19_0.SelfIntroduction (
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
	itext 3 "中学時代に、MSXでBASIC言語",
	itext 3 "コンピュータクラブに入っていた",
	itext 3 "ただしMSXが数台しかなかったため、",
	itext 7 "紙の裏にコードを書いていた",
	text "キーボードに触れたのは?",
	itext 3 "ブラインドタッチの練習を",
	itext 7 "キーボードの絵のコピーで",
	(>>) <$> nextLine
		<*> bigIText 2 "紙でコーディング??? 紙のキーボード!!!"
	]

selfIntroduction2 :: Page
selfIntroduction2 = pageTitle "自己紹介" :| [
	text "大学入学!!",
	itext 3 "入学祝いは、ノートパソコン",
	itext 3 "やった、紙じゃない!!!",
	itext 3 "本物だ",
	itext 3 "本物のWindowsだった",
	itext 3 "日記を書いて、メールを書いて...",
	itext 3 "えっ、プログラミングは?",
	itext 3 "BASICはどこ?(泣)"
	]

selfIntroduction3 :: Page
selfIntroduction3 = pageTitle "自己紹介" :| [
	text "Perl期",
	itext 3 "ホームページを作ろう",
	itext 3 "とりあえず、アクセスカウンタと掲示板だ!",
	itext 3 "よろしい、ならばCGIだ",
	itext 3 "CGIなら、Perlだ",
	itext 3 "このころのPerlは、かがやいていた",
	text "C言語",
	itext 3 "やばい、C言語やっとかないと、まずいらしい",
	itext 3 "とりあえず、Cは必要らしい",
	itext 3 "文字列は文字の配列?",
	itext 3 "メモリのことを、よく知っておく必要がある"
	]

selfIntroduction4 :: Page
selfIntroduction4 = pageTitle "自己紹介" :| [
	text "GNU/Linux",
	itext 3 "Windowsつまらない",
	itext 3 "なに!フィンランドの学生がOSを作っただって?",
	itext 3 "さっそく試してみよう",
	itext 3 "あ、Windowsのパーティション壊しちゃった",
	itext 3 "いろんなディストリビューションがある",
	itext 7 "Turbo, Debian, Vine, Mandrake ...",
	itext 7 "パッケージをソースコードから",
	itext 7 "コンパイルするディストリ?",
	itext 7 "Gentoo! Gentoo! Gentoo!"
	]

selfIntroduction5 :: Page
selfIntroduction5 = pageTitle "自己紹介" :| [
	text "Ruby",
	itext 3 "さかのぼること約15年前",
	itext 3 "いまは亡き、雑誌「UNIX USER」",
	itext 3 "まだマイナーだったRubyの特集",
	itext 3 "「ちょっと小意気にRuby」",
	itext 3 "おもしろそうだ",
	itext 3 "書籍「オブジェクト指向スクリプト言語 Ruby」購入",
	itext 3 "オブジェクト指向、かっこいい!",
	itext 3 "静的型付けなんて古い古い、動的型付け最高!!!"
	]

selfIntroduction6 :: Page
selfIntroduction6 = pageTitle "自己紹介" :| [
	text "いろいろな言語",
	itext 3 "Python, CommonLisp, Scheme, Prolog, ...",
	itext 3 "いろいろな言語に手を出す",
	itext 3 "でも、やっぱりRubyだよね、Ruby最高",
	itext 3 "しかし、しだいに暗雲が立ちこめる",
	itext 3 "Rubyの1 + 1って1.+(1)ってことなんだよな",
	itext 3 "Rubyって第1引数をえこひいきしすぎじゃない?",
	itext 3 "それでも、僕はRubyistだから...",
	itext 3 "お、「Rubyソースコード完全解説」だって?",
	itext 3 "これは読むでしょ"
	]

selfIntroduction7 :: Page
selfIntroduction7 = pageTitle "自己紹介" :| [
	text "Haskellとの出会い",
	itext 3 "なになに「(Rubyは)",
	itext 3 "PL/IやHaskellではなくCで書かれているから",
	itext 7 "一般人でも理解できる」か",
	itext 3 "「Haskell?Haskellって何?」",
	itext 3 "2003年1月1日 Haskellの入門書を購入",
	itext 3 "本のなかほどまで読んで、やっと\"Hello, world\"",
	itext 3 "これは、{おもしろい/美しい}言語だ!!!",
	itext 3 "その後、14年間、Haskellを学び続けることになる"
	]

selfIntroduction8 :: Page
selfIntroduction8 = pageTitle "自己紹介" :| [
	text "入門書出版",
	itext 3 "転職サイトでHaskellを検索",
	itext 3 "Haskellに興味のある会社に面接に行ってみる",
	itext 3 "社員のかたにHaskellを教えることになる",
	itext 3 "スライドを作成し週一でレクチャー",
	itext 3 "他の会社の、コードを見たかたからスカウト",
	itext 3 "(株)Reproに、ちょいちょい遊びに行くように",
	itext 7 "(「Repro飯」もいただきました)",
	itext 3 "CTOのかたにHaskellを教えはじめる",
	itext 3 "今日、まねいていただいた七島さんに",
	itext 7 "秀和システムの編集のかたを紹介してもらう"
	]

selfIntroduction9 :: Page
selfIntroduction9 = pageTitle "自己紹介" :| [
	text "入門書出版(続き)",
	itext 3 "編集のかたにHaskellのすばらしさを熱弁する",
	itext 3 "Haskellの入門書の出版が決まる",
	itext 3 "レクチャー用のスライドとウェブページに",
	itext 7 "肉づけ、説明を追加、サンプルコードも追加",
	itext 3 "半年ほどで出版のはずだったが",
	itext 7 "何度となく読み返し",
	itext 7 "構成の修正、誤字脱字のチェック、",
	itext 7 "処理系のインストールのテスト、",
	itext 7 "読点の追加、鉤括弧の追加、",
	itext 7 "索引の作成などで、結局1年ちょっとかかる"
	]
