module LoveSwift19_0.Haskell (
	haskell
	) where

import Control.Monad
import Data.List.NonEmpty

import Lecture
import Montecarlo

haskell :: [Page]
haskell = [
	haskell1, haskell2, haskell3, haskell4, haskell5,
	haskell6, haskell7, haskell8, haskell9, haskell10,
	{- haskell11, -} haskell12, haskell13, haskell14, haskell15,
	haskell16, haskell17, haskell18, haskell19, haskell20,
	haskell21, haskell22, haskell23, haskell24, haskell25,
	haskell26, haskell27, haskell28, haskell29, haskell30,
	haskell31, haskell32, haskellXX, haskellYY
	]

haskell1 :: Page
haskell1 = pageTitle "Haskell" :| [
	text "Haskell! Haskell! Haskell!",
	text "よろしい、それならHaskellだ",
	(>>)	<$> nextLine
		<*> text "Haskellの魅力をつたえたい",
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
	text "平文をe乗して、nでわった、あまりをとると、暗号文に",
	text "暗号文をd乗して、nでわった、あまりをとると、平文に"
	]

haskell6 :: Page
haskell6 = pageTitle "RSA暗号も、すなお" :| [
	text "暗号化と複号とを、関数にすると、つぎのようになる",
	(>>)	<$> nextLine
		<*> itext 4 "encrypt n e m = m ^ e `mod` n",
	(>>)	<$> itext 4 "decrypt n d c = c ^ d `mod` n"
		<*> nextLine,
	text "「すなお」だなぁ",
	text "適切な値の例としてe = 13, d = 95497, n = 138689を",
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
	(>>)	<$> itext 4 "関数名 実引数1 実引数2 ..."
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
		<*> text "「べ、べつに買ってほしいわけじゃ(ry"
	]

haskell11 :: Page
haskell11 = pageTitle "こういうギャグを" :| [
	(>>)	<$> replicateM_ 3 . nextLine
		<*> text "こういうギャグを、真顔で打ち込んでいるわけです",
	text "大丈夫です。こういう空気には慣れていますので",
	text "つぎに進みます"
	]

haskell12 :: Page
haskell12 = pageTitle "どうして、そんなに、すなおなの?" :| [
	(>>) <$> text "引数を2倍する関数をSwiftで書くと" <*> nextLine,
	itext 4 "func double (_ x: Int) -> Int {",
	itext 8 "return(x * 2)",
	(>>) <$> itext 4 "}" <*> nextLine,
	text "のようになるかと思います",
	text "(今日のために、Swiftを、ほんのちょっとだけ、",
	itext 4 "勉強してきました)",
	text "Swiftでは{}やreturnが必要",
	text "これは{}のなかで動作が実行されるかもしれないから"
	]

haskell13 :: Page
haskell13 = pageTitle "どうして、そんなに、すなおなの?" :| [
	text "動作とは、文字列を表示したり、",
	itext 4 "変数の値を変化させたりすること",
	text "Swiftでは関数doubleを評価しているあいだに",
	itext 4 "文字列が表示されたり",
	itext 4 "変数の値が変化したりする",
	itext 2 "かもしれない",
	text "Haskellでは関数doubleは、ただ評価される",
	text "そのあいだに、実行される動作はない",
	(>>)	<$> text "だから{}もreturnも不要で、つぎのように書ける"
		<*> nextLine,
	itext 4 "double x = x * 2"
	]

haskell14 :: Page
haskell14 = pageTitle "どうして、そんなに、すなおなの?" :| [
	(>>)	<$> replicateM_ 3 . nextLine
		<*> text "Haskellでは評価しているあいだに",
	itext 4 "動作が実行されるということがない",
	itext 4 "(これを参照透過性とよぶ)",
	text "だから、「関数」が、とても「すなお」に書ける"
	]

haskell15 :: Page
haskell15 = pageTitle "モンテカルロ法も、とっても、すなお" :| [
	text "モンテカルロ法って何?",
	itext 3 "モンテカルロにはカジノがある",
	writeImageCenterTop (300 * 23 / 30, 450 * 23 / 30,
		"images/monte_carlo_casino.jpg"),
	(>>) <$> replicateM_ 5 . erase <*> replicateM_ 0 . nextLine,
	itext 3 "モンテカルロ法は、ランダムな値を調べることで",
	itext 6 "確率論的に正しい値を導こうという、やりかた",
	itext 3 "結果が正しいかどうかは賭け",
	itext 3 "だから「モンテカルロ」法",
	itext 3 "正確な結果を得るのに時間がかかりすぎるときに",
	itext 3 "(ちなみに、ラスベガス法というものも、ある)"
	]

haskell16 :: Page
haskell16 = pageTitle "モンテカルロ法も、とっても、すなお" :| [
	text "モンテカルロ法で円周率を、もとめる",
	text "正方形のなかに、円を描いて、そこに米粒をばらまく",
	(>>) <$> text "つぎの関係が、だいたい、成り立つ" <*> nextLine,
	itext 3 "円の面積 : 正方形の面積 =",
	(>>)	<$> itext 6 "円内の米粒の数 : 正方形内の米粒の数"
		<*> nextLine,
	text "半径1の円の面積が円周率に等しい",
	text "半径1の円は、1辺が2の正方形に、ぎりぎり、はいる"
	]

haskell17 :: Page
haskell17 = pageTitle "モンテカルロ法も、とっても、すなお" :| [
	text "つぎの図を、みてください",
	(>>)	<$> circleInSquare (3 / 10, 11 / 40) (1 / 5)
		<*> replicateM_ 5 . nextLine,
	text "半径1の円が、1辺が2の正方形の内側にある",
	(>>)	<$> text "正方形の面積は4なので、だいたい、つぎのようになる"
		<*> nextLine,
	itext (- 2.5) "円周率 = 円の面積 = 4 * 円内の点の数 / 正方形内の点の数"
	]

haskell18 :: Page
haskell18 = pageTitle "モンテカルロ法も、とっても、すなお" :| [
	text "それでは、実際に米粒を",
	itext 3 "まいてみましょう",
	runMontecarloRightTop 15 400,
	text "400粒まいてみました",
	text "つぎは、1000粒まいてみましょう",
	runMontecarloRightBottom 15 1000,
	text "米粒の数を、ふやせばふやすほど、",
	itext 3 "正確な値となる可能性が高まる"
	]

haskell19 :: Page
haskell19 = pageTitle "モンテカルロ法も、とっても、すなお" :| [
	text "モンテカルロ法で円周率をもとめる関数を、つくる",
	text "つぎのような流れになる",
	itext 3 "1. 正方形内のランダムな点のリストを作成する",
	itext 3 "2. 点のリストから、n個の点を取り出す",
	itext 3 "3. n個の点のうち、円の内部にあるものを取り出す",
	itext 3 "4. 円の内部の点の数を数える(m個とする)",
	itext 3 "5. 円周率の予測値は4 * m / nとなる",
	itext 6 "(4は正方形の面積)",
	(>>) <$> nextLine <*> text "それでは、ひとつずつ、みていきましょう"
	]

haskell20 :: Page
haskell20 = pageTitle "モンテカルロ法: 正方形内のランダムな点" :| [
	text "乱数値を得るライブラリはいくつかある",
	text "ここでは、古いほうのライブラリを使う",
	text "パッケージrandomにふくまれる",
	itext 3 "ライブラリSystem.Randomを使う",
	text "乱数を得るには、乱数の種が必要",
	(>>) <$> text "つぎのように、整数から乱数の種を生成する" <*> nextLine,
	(>>) <$> itext 3 "mkStdGen 8" <*> nextLine,
	text "関数mkStdGenのとる引数で、得られる乱数の種が変わる",
	text "乱数の種が異なれば",
	itext 3 "得られる乱数のリストも異なるものになる"
	]

haskell21 :: Page
haskell21 = pageTitle "モンテカルロ法: 正方形内のランダムな点" :| [
	text "種から指定した範囲の乱数値のリストを生成するには",
	(>>) <$> itext 3 "関数randomRsを使う" <*> nextLine,
	(>>) <$> itext 3 "randomRs (-1, 1) (mkStdGen 8)" <*> nextLine,
	text "この関数が返すリストには-1から1までの範囲の乱数値が",
	itext 3 "無限個ふくまれている"
	]

haskell22 :: Page
haskell22 = pageTitle "モンテカルロ法: 正方形内のランダムな点" :| [
	text "-1から1までの範囲の乱数値のリストが手に入った",
	text "ほしいものは、1辺が2の正方形内のランダムな点のリスト",
	text "原点を中心とする1辺が2の正方形を考える",
	text "-1から1までの範囲の乱数値のリストが、ふたつ必要だ",
	(>>) <$> text "乱数の種は、ふたつに割ることができる" <*> nextLine,
	(>>) <$> itext 3 "split (mkStdGen 8)" <*> nextLine,
	text "このようにすると、乱数の種が、ふたつ手に入る"
	]

haskell23 :: Page
haskell23 = pageTitle "モンテカルロ法: 正方形内のランダムな点" :| [
	text "乱数の種が、ふたつ手に入れば、",
	itext 3 "乱数値のリストも、ふたつ手に入る",
	text "ふたつの乱数値のリストを、点のリストにするには",
	itext 3 "それぞれの乱数値をペアにしていく必要がある",
	(>>) <$> text "そのための関数zipがある、たとえば" <*> nextLine,
	(>>)	<$> itext 3 "zip [1, 2, 3] [\"hello\", \"my\", \"friend\"]"
		<*> nextLine,
	(>>)	<$> text "のようにすると、つぎのような値が、つくられる"
		<*> nextLine,
	(>>)	<$> itext 3 "[(1, \"hello\"), (2, \"my\"), (3, \"friend\")]"
		<*> nextLine
	]

haskell24 :: Page
haskell24 = pageTitle "モンテカルロ法: 正方形内のランダムな点" :| [
	(>>) <$> text "正方形内のランダムな点が定義できる" <*> nextLine,
	itext 3 "points :: Int -> [(Double, Double)]",
	itext 3 "points x = let",
	itext 7 "(g, g') = split (mkStdGen x)",
	itext 7 "xs = randomRs (-1, 1) g",
	itext 7 "ys = randomRs (-1, 1) g' in",
	(>>) <$> itext 7 "zip xs ys" <*> nextLine,
	text "1行目は、型の定義。->の前後に引数の型と返り値の型が",
	text "またlet-in構文も、ここが初出",
	text "整数値から、それぞれの、ランダムな点の系列を生成"
	]

haskell25 :: Page
haskell25 = pageTitle "モンテカルロ法: 円の内外の判定" :| [
	text "円の内部か外部かの判定のために",
	(>>)	<$> itext 3 "つぎのような関数を定義する"
		<*> nextLine,
	itext 3 "inCircle :: (Double, Double) -> Bool",
	(>>) <$> itext 3 "inCircle (x, y) = x ^ 2 + y ^ 2 <= 1" <*> nextLine,
	(>>) <$> text "つぎのようになる" <*> nextLine,
	itext 3 "inCircle (0.7, 0.7) => True",
	itext 3 "inCircle (0.8, 0.8) => False",
	itext 3 "inCircle (1, 0) => True",
	itext 3 "inCircle (1, 0.1) => False"
	]

haskell26 :: Page
haskell26 = pageTitle "モンテカルロ法: リストをあつかう関数たち" :| [
	text "リストをあつかう関数を、いくつか追加で導入する",
	text "関数take",
	itext 3 "リストの先頭から指定した数の要素を取り出す",
	(>>) <$> itext 3 "つぎのようになる" <*> nextLine,
	(>>) <$> itext 3 "take 3 [1, 2, 3, 4, 5] => [1, 2, 3]" <*> nextLine,
	text "関数filter",
	itext 3 "リストから条件を満たす要素だけを取り出す",
	(>>) <$> itext 3 "つぎのようになる" <*> nextLine,
	itext 3 "filter even [1, 2, 3, 4, 5] => [2, 4]"
	]

haskell27 :: Page
haskell27 = pageTitle "モンテカルロ法: リストをあつかう関数たち" :| [
	text "関数length",
	itext 3 "リストの要素を数える",
	(>>) <$> itext 3 "つぎのようになる" <*> nextLine,
	itext 3 "length [1, 2, 3, 4, 5] => 5"
	]

haskell28 :: Page
haskell28 = pageTitle "モンテカルロ法: 役者はそろった" :| [
	text "手もとには、つぎのような部品がある",
	itext 2 "正方形内のランダムな点のリスト (points x)",
	itext 2 "円の内外を判定する (inCircle)",
	itext 2 "リストから決められた数の要素を取り出す (take)",
	itext 2 "リストから条件を満たす要素を取り出す (filter)",
	(>>) <$> itext 2 "リストの要素を数える (length)" <*> nextLine,
	text "追加で、もうひとつ",
	itext 2 "整数値を実数値に変換する関数 (fromIntegral)"
	]

haskell29 :: Page
haskell29 = pageTitle "モンテカルロ法: 円周率の予測値" :| [
	(>>) <$> text "円周率の予測値は、つぎのようになる" <*> nextLine,
	itext 3 "guessPi :: Int -> Int -> Double",
	itext 3 "guessPi x n = let",
	itext 7 "ps = take n (points x)",
	itext 7 "is = filter inCircle ps in",
	itext 7 "4 * fromIntegral (length is) /",
	(>>) <$> itext 11 "fromIntegral (length ps)" <*> nextLine,
	itext 3 "guessPi 8 100 => 3.24",
	itext 3 "guessPi 8 10000 => 3.1616",
	itext 3 "guessPi 8 1000000 => 3.141424"
	]

haskell30 :: Page
haskell30 = pageTitle "モンテカルロ法: 円周率をもとめる: コード" :| [
	oneshot $
	foldl1 (\l1 l2 -> (\x y z -> x >> y >> z) <$> l1 <*> nextLine <*> l2)
	[
	miniIText 0 "points :: Int -> [(Double, Double)]",
	miniIText 0 "points x = let",
	miniIText 4 "(g, g') = split (mkStdGen x)",
	miniIText 4 "xs = randomRs (-1, 1) g",
	miniIText 4 "ys = randomRs (-1, 1) g' in",
	(>>) <$> miniIText 4 "zip xs ys" <*> miniNextLine,
	miniIText 0 "inCircle :: (Double, Double) -> Bool",
	(>>)	<$> miniIText 0 "inCircle (x, y) = x ^ 2 + y ^ 2 <= 1"
		<*> miniNextLine,
	miniIText 0 "guessPi :: Int -> Int -> Double",
	miniIText 0 "guessPi x n = let",
	miniIText 4 "ps = take n (points x)",
	miniIText 4 "is = filter inCircle ps in",
	miniIText 4 "4 * fromIntegral (lengh is) / fromIntegral (length ps)"
	] ]

haskell31 :: Page
haskell31 = pageTitle "ここまでの、まとめ" :| [
	text "Haskellは、とっても、すなお",
	text "関数を評価しているときに、動作の実行がない",
	itext 3 "-> 関数の定義の書きかたが、すなおになる",
	text "無限リストが使える",
	itext 3 "-> 「まず無限個、要素をもつリストを使って",
	itext 9 "そこから、いくつか取り出して...」",
	itext 3 "というコーディングができる"
	]

haskell32 :: Page
haskell32 = pageTitle "関数は値" :| [
	text "Haskellでは関数は値",
	itext 3 "値なので「関数の引数」になれる",
	itext 3 "「関数の返り値」になれる",
	itext 3 "リストの要素にすることができる",
	(>>)	<$> itext 3 "変数を束縛する(変数に代入する)ことができる"
		<*> nextLine,
	text "関数filterの例を、みてみる"
	]

haskellXX :: Page
haskellXX = pageTitle "モナド" :| [
	text ""
	]

haskellYY :: Page
haskellYY = pageTitle "入出力" :| [
	]
