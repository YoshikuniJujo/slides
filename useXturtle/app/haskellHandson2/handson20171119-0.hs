import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	greeting, selfIntroduction, kinkyou, nerai,
	dekinai, dekinai1_1, dekinai1_2, dekinai1_3,
	dekinai2, dekinai3, dekinai4,
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

dekinai1_1 :: Page
dekinai1_1 = pageTitle "複雑さの制御" :| [
	text "つぎの事実が、Haskellが難しいと誤解される一因だ",
	itext 4 "* Haskellの売りのひとつは「複雑さの制御」だ",
	text "つまり、Haskellの「よさ」をつたえるためには",
	itext 4 "「複雑な問題」を用意する必要がある",
	text "それで、「Haskellは難しい」と誤解される",
	text "Haskellを使うと",
	itext 4 "「かんたんなこと」は「かんたん」に",
	itext 4 "「ふつうのこと」は「ふつう」に",
	itext 4 "「すごく難しいこと」は「それほど難しくなく」",
	itext 2 "解決できる",
	text "(印象としてつぎのことを感じる。最近の多くの言語は",
	itext 2 "「ふつうのこと」を「かんたん」に解決、に特化?)"
	]

dekinai1_2 :: Page
dekinai1_2 = pageTitle "複雑さの制御" :| [
	text "Haskellの利点として、つぎのことがある",
	itext 4 "「難しいこと」が「それほど難しくなく」できる",
	text "「ふつうのこと」をするだけなら",
	itext 4 "他の言語のほうがかんたん、かも",
	text "しかし、「難しいこと」をするなら",
	itext 4 "Haskellを使ったほうが、かんたんにできる",
	text "小さいものを作るには、やわらかい粘土が、かんたん",
	text "大きいものを作るには、かたいレンガが、かんたん"
	]

dekinai1_3 :: Page
dekinai1_3 = pageTitle "複雑さの制御" :| [
	text "抽象度の高いコードが書ける",
	itext 4 "さきに、わくぐみだけを作り",
	itext 4 "そのうえに具体的な処理を実装することができる",
	text "型による表現力の向上",
	itext 4 "整数ではなく、年齢をあらわす型を作るなど",
	text "ここまでなら、最近の多くの言語で可能",
	text "これらを「静的な型」によって",
	itext 4 "おかしな組み合わせかたから守る",
	text "「かたいレンガを、すきまなく組み合わせる」こと"
	]

dekinai2 :: Page
dekinai2 = pageTitle "保守性が高い" :| [
	text "長く使ってもらわないと実感できないかもしれない",
	text "Haskellは、適切に使えば",
	itext 4 "とても保守性の高いコードが書ける",
	text "型を適切に使うことで、",
	itext 4 "-> その変数に何の意味があるのかわかる",
	itext 4 "-> 関係ない値に変更することを、ふせげる",
	text "変数が再代入できないことで、",
	itext 4 "-> 変数が定義されたところだけで、値がわかる"
	]

dekinai3 :: Page
dekinai3 = pageTitle "構文糖と実際の意味論" :| [
	text "Haskellでは実際の意味論と",
	itext 4 "構文上の「見かけ」が異なることがある",
	text "読み書きしやすくするための構文を「構文糖」とよぶ",
	text "今回は「構文糖」でオブラートされた構文を説明する",
	text "オブラートを取りのぞいた意味論の話はしない",
	text "裸の意味論について学ぶと、その合理性に感動すると思う",
	text "拙書では「裸の意味論」に近いところから説明している"
	]

dekinai4 :: Page
dekinai4 = pageTitle "より高度な概念や機能" :| [
	text "Haskellを学び続けるのは楽しい",
	text "Haskellは意図的に成長中の言語とされている",
	text "良いものを積極的に取り込もうとしている",
	text "多くはプレインな言語に対する「拡張」というかたち",
	text "素のHaskellに飽きたり、不満を感じたりしたら",
	itext 4 "言語拡張を試してみよう"
	]

{-
dekinaiN :: Page
dekinaiN = pageTitle "(ねらわないことの各論)" :| [
	text "ここに4枚の「それぞれのねらわないこと」のスライドを置く",
	text "このあたりに「前回の反省」として",
	itext 8 "「網羅すること」",
	itext 8 "「すっぴんを教えること」",
	itext 4 "にこだわりすぎたという事情を書こうかな?"
	]
	-}

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
