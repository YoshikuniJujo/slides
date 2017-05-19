import Data.List.NonEmpty

import Control.Monad

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	greeting, introduction, mosadomo,
	benefit1, benefit2,
	simpleFunction, monad
	]

titlePage :: Page
titlePage =
	writeTitle "Swiftの中心で、Haskellをさけぶ" "第19回 Swift愛好会" :| []

greeting :: Page
greeting = pageTitle "ごあいさつ" :| [
	text "はじめまして。おまねきいただき、ありがとうござい(ry",
	(>>)
		<$> writeImageCenter
			(515 * 22 / 60, 654 * 22 / 60, "images/cover.png")
		<*> replicateM_ 10 . nextLine,
	text "「Haskell 教養としての関数型プログラミング」の著者",
	itext 4 "です"
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
	itext 4 "たくさんの実例で説明するべき、と考えています",
	text "僕とおなじ「とにかく手を動かして結果を見たい」",
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
	itext 4 "Haskellを学ぶことで、絶対に得する",
	itext 4 "それと、Haskellは難しくない、ということです"
	]

benefit1 :: Page
benefit1 = pageTitle "コードがきれいになる" :| [
	text "Haskellを学ぶことで、得することはたくさんある",
	text "まず、Haskellを学ぶと、他の言語を使っていても",
	itext 4 "コードがきれいになる",
	text "きたないコードとは、たとえば",
	itext 4 "ある手続きを実行することで",
	itext 4 "他の手続きの動作が変わってしまう",
	text "そういうコードは、「よごれて」いる",
	text "「グローバル変数を使うな」というのは、そういうこと",
	text "Haskellを学ぶと",
	itext 4 "「よごれ」を「よごれ」として感じられる"
	]

benefit2 :: Page
benefit2 = pageTitle "自分が何をしているのか、わかる" :| [
	text "自分が何をしているのか、わかる",
	itext 4 "関数の入口と出口とが、それぞれ、ひとつである",
	itext 4 "型によって、関数に入るものと出るものとが決まる",
	text "ということ",
	text "関数doubleを定義することを考える",
	text "Haskellでは、関数の型は、引数の型と返り値の型とを",
	(>>)	<$> itext 4 "->の左右に置くことで、あらわす"
		<*> nextLine,
	(>>)	<$> itext 4 "double :: Integer -> Integer"
		<*> nextLine,
	text "この関数doubleは整数を整数に置き換える以外には",
	itext 4 "何もしないことが保証される(ただし黒魔術は(ry"
	]

simpleFunction :: Page
simpleFunction = pageTitle "関数の定義" :| [
	text "Haskellは簡単です",
	(>>)	<$> text "整数を2倍する関数の定義を示します"
		<*> nextLine,
	(>>) <$> itext 4 "double x = x * 2" <*> nextLine,
	text "これ以上ないくらい、わかりやすく、シンプルな表記",
	(>>)	<$> text "これは対話環境で評価できる完全な定義。対話環境で"
		<*> nextLine,
	itext 4 "> double 3",
	(>>) <$> itext 4 "6" <*> nextLine,
	text "のように試すことができます"
	]

monad :: Page
monad = pageTitle "モナド" :| [
	text "Haskellは簡単って言うけれど",
	itext 4 "じゃあ、モナドは、どうなる?",
	itext 4 "圏論を知らないと、だめなんでしょ?",
	itext 4 "何やら、むずかしそう",
	text "圏論は、知らなくても大丈夫",
	text "モナドは、むずかしくないよ",
	text "誤解しやすいところがある",
	itext 4 "モナドとIOモナドとは",
	itext 4 "切りわけて学んだほうがいい"
	]
