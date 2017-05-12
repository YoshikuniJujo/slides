module LoveSwift19.Haskell (
	haskell
	) where

import Control.Monad
import Data.List.NonEmpty

import Lecture

haskell :: [Page]
haskell = [
	haskell1, haskell2, haskell3, haskell4, haskell5,
	haskell6, haskell7, haskell8, haskell9, haskell10,
	haskell11
	]

haskell1 :: Page
haskell1 = pageTitle "Haskell" :| [
	text "Haskell! Haskell! Haskell!",
	text "Haskellの魅力をつたえたい",
	text "僕にとってHaskellは空気のようなもの",
	text "空気の魅力をつたえるのは、むずかしいこと",
	text "「Haskellはすなお」",
	text "「とっても、すなお」",
	text "と、とりあえず言っておこう"
	]

haskell2 :: Page
haskell2 = pageTitle "関数定義がすなお" :| [
	text "関数定義がすなお",
	text "引数を2倍する関数を定義してみる",
	(\x y z -> x >> y >> z)
		<$> nextLine <*> itext 4 "double x = x * 2" <*> nextLine,
	text "これで、関数doubleが定義できる",
	(>>) <$> text "これ以上はないってくらい「すなお」" <*> nextLine
	]

haskell3 :: Page
haskell3 = pageTitle "関数の使いかたが、すなお" :| [
	text "関数の使いかたも、すなお",
	(\x y z -> x >> y >> z)
		<$> nextLine <*> itext 4 "double 5" <*> nextLine,
	text "これは、10に評価される",
	text "すなおだなあ"
	]

haskell4 :: Page
haskell4 = pageTitle "RSA暗号も、すなお" :| [
	text "RSA暗号の例を見てみましょう",
	text "RSA暗号とは",
	itext 4 "公開鍵暗号の実装のひとつ",
	text "公開鍵暗号とは",
	itext 4 "開けるときと、閉じるときで異なる鍵をつかう箱",
	itext 4 "「みんな、僕に秘密のメッセージを送ってくれ」",
	itext 8 "と言って箱と閉じる鍵をばらまく",
	itext 4 "開ける鍵は、ばらまいちゃだめだよ",
	itext 4 "不特定多数の人から秘密のメッセージをもらえる",
	itext 4 "HTTPSに使われている技術"
	]

haskell5 :: Page
haskell5 = pageTitle "RSA暗号も、すなお" :| [
	text "適切に選ばれた3つの値e, d, nを用意する",
	text "これらを、どう選ぶかは、ここでは説明しない",
	text "平文をmとし暗号文をcとすると",
	text "暗号化と複号は、それぞれ、つぎの式で表せる",
	(>>)	<$> nextLine
		<*> itext 4 "c = m ^ e `mod` n",
	(>>)	<$> itext 4 "m = c ^ d `mod` n"
		<*> nextLine,
	text "平文をe乗して、nでわった、あまりをとると、暗号文になる",
	text "暗号文をd乗して、nでわった、あまりをとると、平文になる"
	]

haskell6 :: Page
haskell6 = pageTitle "RSA暗号も、すなお" :| [
	text "暗号化と複号とを、関数にすると、つぎのようになる",
	(>>)	<$> nextLine
		<*> itext 4 "encrypt n e m = m ^ e `mod` n",
	(>>)	<$> itext 4 "decrypt n d c = c ^ d `mod` n"
		<*> nextLine,
	text "「すなお」だなぁ",
	text "適切な値の例としてe = 13, d = 95497, n = 138689がある",
	text "暗号化と複号の例は、つぎのようになる",
	(>>)	<$> nextLine
		<*> itext 4 "encrypt 138689 13 12345 => 47046",
	(>>)	<$> itext 4 "decrypt 138689 95497 47046 => 12345"
		<*> nextLine
	]

haskell7 :: Page
haskell7 = pageTitle "関数定義、関数適用は、すなお" :| [
	text "関数定義、関数適用は、とっても、すなおでした",
	(>>)	<$> nextLine
		<*> itext 4 "関数名 仮引数1 仮引数2 ... = 結果となる式",
	(>>)	<$> itext 4 "関数名 実引数1 実引数2"
		<*> nextLine,
	text "すなおだなぁ"
	]

haskell8 :: Page
haskell8 = pageTitle "複数の引数をとる関数" :| [
	text "Haskellでは複数の引数をとる関数も",
	itext 4 "とっても、すなおに書け",
	itext 4 "(うっ何をする!?)",
	writeImageAlmost (430, 300, "images/nanohana.jpg"),
	(>>)	<$> replicateM_ 3 . backLine
		<*> text "ただいま、不適切な発言がありました",
	text "しばらく、こちらの画像をお楽しみください",
	text ".",
	(>>) <$> backLine <*> itext 1 ".",
	(>>) <$> backLine <*> itext 2 ".",
	(>>) <$> backLine <*> itext 3 ".",
	(>>) <$> backLine <*> itext 4 ".",
	(>>) <$> backLine <*> itext 5 ".",
	(>>) <$> backLine <*> itext 6 "."
	]

haskell9 :: Page
haskell9 = pageTitle "複数の引数をとる関数などない" :| [
	text "Haskellには、複数の引数をとる関数はありません",
	text "「もうしわけありませんでしたっ」",
	text "(拙書P. 81を参照のこと、",
	itext 8 "本屋さんとかでっ",
	itext 8 "高いし、重いし、",
	itext 8 "もうしわけ、ありませんでしたっ)"
	]

haskell10 :: Page
haskell10 = pageTitle "複数の引数をとる関数はありまぁす" :| [
	text "実用上は多引数関数があると思っていても問題ない",
	text "すべて説明していると、本が1冊、書けてしまうので、",
	itext 4 "くわしくは、「本屋さんとか、でっ」",
	text "「べ、べつに買ってほしいわけじゃないんだから」",
	writeImageCenter (515 * 21 / 60, 654 * 21 / 60, "images/cover.png"),
	(>>)	<$> replicateM_ 4 . nextLine
		<*> text "「べ、べつに買ってほしいわけじゃ(ry",
	(>>) <$> text "." <*> backLine,
	(>>) <$> itext 1 "." <*> backLine,
	(>>) <$> itext 2 "." <*> backLine,
	(>>) <$> itext 3 "." <*> backLine,
	(>>) <$> itext 4 "." <*> backLine,
	itext 5 "か、買わないの...?」"
	]

haskell11 :: Page
haskell11 = pageTitle "こういうギャグを" :| [
	(>>)	<$> replicateM_ 3 . nextLine
		<*> text "こういうギャグを、真顔で打ち込んでいるわけです",
	text "大丈夫です。こういう空気には慣れていますので",
	text "つぎに進みます"
	]
