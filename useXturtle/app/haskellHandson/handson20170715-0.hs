import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	greeting, selfIntroduction, installStack, startup, input,
	calc, useIt, history, forcedTermination, fruits, reload,
	simpleFunction, typeDeclaration, typeDeclaration2, maybeValue,
	tuple, patternMatch, patternMatch2, patternMatch3
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

startup :: Page
startup = pageTitle "対話環境の起動と終了" :| [
	text "事前資料の内容を、もういちど、おさらいしましょう",
	text "まずは、対話環境の起動と終了です",
	itext 4 "% stack ghci",
	itext 4 "Prelude>",
	text "新しい言語を学ぶときの",
	itext 4 "一番はじめの壁は「インストール」かもしれません",
	text "対話環境は立ち上がったでしょうか",
	text "ここまで、できれば最初の壁は、こえたことになります",
	text "さて、ソフトを立ち上げたときに、はじめに知りたいのは",
	itext 4 "僕だったら、その終わらせかたです",
	text "終わらせかたを知らないと、不安になります",
	itext 4 "Prelude> :quit"
	]

input :: Page
input = pageTitle "値や式の打ちこみ" :| [
	text "対話環境に、いろいろな値を打ちこんでみます",
	itext 4 "% stack ghci",
	itext 4 "Prelude> 4492",
	itext 4 "4492",
	itext 4 "Prelude> 'c'",
	itext 4 "'c'",
	itext 4 "Prelude> pi",
	itext 4 "3.141592653589793",
	text "整数や文字はリテラルです。そのまま表示されます",
	text "piは変数です。それが束縛されている値が表示されます"
	]

calc :: Page
calc = pageTitle "電卓" :| [
	text "計算もできます",
	itext 4 "Prelude> 2 + 3",
	itext 4 "5",
	itext 4 "Prelude> 3 * 10 + 5 * 7",
	itext 4 "65",
	itext 4 "Prelude> 2 ^ 8",
	itext 4 "256",
	itext 4 "Prelude> 3 + 4 - 5",
	itext 4 "2",
	text "「Haskell 電卓としての関数型プログラミング」",
	itext 4 "です"
	]

useIt :: Page
useIt = pageTitle "変数it" :| [
	text "計算の結果を、つぎの計算で使いたいとします",
	itext 4 "Prelude> 123456789 * 123456789",
	itext 4 "1524159121932621",
	text "これを、もう1回、打ちこむのはめんどくさいですね",
	text "変数itを使いましょう",
	itext 4 "Prelude> it * 123456789",
	itext 4 "188167791118860863013969",
	text "対話環境は評価した値を変数itに束縛しておいてくれます"
	]

history :: Page
history = pageTitle "履歴" :| [
	text "対話環境を快適に使うには、履歴機能もかかせません",
	text "以下を順に打ちこんでください",
	itext 4 "Prelude> 12345 * 6789",
	itext 4 "Prelude> \"Haskell Language\"",
	itext 4 "Prelude> pi",
	text "上矢印キーを3回、下矢印キーを1回、押してください",
	itext 4 "Prelude> \"Haskell Language\"",
	text "左矢印キーを1回、バックスペースキーを8回押します",
	text "Brooks Curryと打ちこみ、エンターキーを押します",
	itext 4 "Prelude> \"Haskell Brooks Curry\"",
	itext 4 "\"Haskell Brooks Curry\""
	]

forcedTermination :: Page
forcedTermination = pageTitle "強制終了" :| [
	text "対話環境に、つぎのように打ち込んでください",
	itext 4 "Prelude> repeat \"Haskell\"",
	itext 4 "[\"Haskell\",\"Haskell\",\"Haskell\",...",
	text "「うわぁぁぁぁ」",
	text "大丈夫、何事もなかったようにCtrl-Cを押しましょう",
	text "強制終了にはCtrl-Cです",
	text "プロンプトが、かえってきます",
	text "さらに、つぎのように打ち込んでください",
	itext 4 "Prelude> x = x",
	itext 4 "Prelude> x",
	text "「...おいっ...どうした...死んでる?」",
	text "大丈夫、Ctrl-Cで意識を取りもどします"
	]

fruits :: Page
fruits = pageTitle "ファイルからの読み込み" :| [
	text "ファイルに保存した定義を読み込んでみます",
	text "まずは、お好きなエディタでファイルを作成",
	itext 4 "% vim fruits.hs",
	itext 4 "myFavoriteFruit = \"apple\"",
	text "対話環境に読み込みましょう",
	itext 4 "Prelude> :load fruits.hs",
	itext 4 "*Main>",
	text "値を表示してみます",
	itext 4 "*Main> myFavoriteFruit",
	itext 4 "\"apple\""
	]

reload :: Page
reload = pageTitle "再読み込み" :| [
	text "対話環境は、そのままにして",
	itext 4 "別のターミナルでファイルを編集",
	itext 4 "% vim fruits.hs",
	itext 4 "myFavoriteFruit = \"banana\"",
	text "これだけでは、新しい定義は使われない",
	itext 4 "*Main> myFavoriteFruit",
	itext 4 "\"apple\"",
	text "コマンド:reloadが必要",
	itext 4 "*Main> :reload",
	itext 4 "*Main> myFavoriteFruit",
	itext 4 "\"banana\""
	]

simpleFunction :: Page
simpleFunction = pageTitle "関数の定義と使用" :| [
	text "かんたんな関数を定義しましょう",
	itext 4 "% vim functions.hs",
	itext 4 "double x = x * 2",
	text "関数doubleを使ってみましょう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load functions.hs",
	itext 4 "*Main> double 8",
	itext 4 "16"
	]

typeDeclaration :: Page
typeDeclaration = pageTitle "型宣言" :| [
	text "変数luckyを定義します",
	itext 4 "% vim functions.hs",
	itext 4 "lucky :: Integer",
	itext 4 "lucky = 7",
	text "変数luckyの値をInteger型として明示的に宣言しました",
	text "関数douleにも型宣言をつけてみましょう",
	itext 4 "% vim functions.hs",
	itext 4 "double :: Integer -> Integer",
	itext 4 "double x = x * 2" ]

typeDeclaration2 :: Page
typeDeclaration2 = pageTitle "型宣言" :| [
	text "対話環境に読みこみます",
	itext 4 "*Main> :reload",
	itext 4 "*Main> lucky",
	itext 4 "7",
	itext 4 "*Main> :type lucky",
	itext 4 "lucky :: Integer",
	itext 4 "*Main> double lucky",
	itext 4 "14",
	itext 4 "*Main> :type double",
	itext 4 "double :: Integer -> Integer"
	]

maybeValue :: Page
maybeValue = pageTitle "Maybe値" :| [
	text "Maybe値とは、値がないかもしれない値",
	text "値がある: Just 値",
	text "値がない: Nothing",
	itext 4 "*Main> Just 8",
	itext 4 "Just 8",
	itext 4 "*Main> Nothing",
	itext 4 "Nothing"
	]

tuple :: Page
tuple = pageTitle "タプル" :| [
	text "いくつかの値を組み合わせた構造がタプル",
	text "タプルを定義してみましょう",
	itext 4 "% vim functions.hs",
	itext 4 "taro :: (String, Integer)",
	itext 4 "taro = (\"Taro Yamada\", 35)",
	text "対話環境で、みてみましょう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load functions.hs",
	itext 4 "*Main> taro",
	itext 4 "(\"Taro Yamada\",35)",
	itext 4 "*Main> :type taro",
	itext 4 "(String,Integer)"
	]

patternMatch :: Page
patternMatch = pageTitle "パターンマッチ" :| [
	text "パターンマッチは、Haskellでは本質的な機能のひとつ",
	text "分岐と、複合的な値からの値のとりだし",
	text "失敗するかもしれない計算の結果を使う例",
	itext 4 "% vim functions.hs",
	itext 4 "helloTo :: Maybe String -> String",
	itext 4 "helloTo (Just n) = \"Hello, \" ++ n ++ \"!\"",
	itext 4 "helloTo Nothing = \"Hello, customer!\"",
	text "タプルの、それぞれの要素の取り出し",
	itext 4 "human :: (String, Integer) -> String",
	itext 4 "human (n, a) = n ++ \"(\" ++ show a ++ \")\""
	]

patternMatch2 :: Page
patternMatch2 = pageTitle "パターンマッチ" :| [
	text "リテラルもパターンとして使える",
	itext 4 "safeRecip :: Double -> Maybe Double",
	itext 4 "safeRecip 0 = Nothing",
	itext 4 "safeRecip x = Just (1 / x)" ]

patternMatch3 :: Page
patternMatch3 = pageTitle "パターンマッチ" :| [
	text "定義した関数を試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load functions.hs",
	itext 4 "*Main> helloTo (Just \"Yoshikuni\")",
	itext 4 "\"Hello, Yoshikuni!\"",
	itext 4 "*Main> helloTo Nothing",
	itext 4 "\"Hello, customer!\"",
	itext 4 "*Main>human (\"Taro Yamada\", 32)",
	itext 4 "\"Taro Yamada(32)\"",
	itext 4 "*Main> safeRecip 8",
	itext 4 "Just 0.125",
	itext 4 "*Main> safeRecip 0",
	itext 4 "Nothing"
	]
