module Main where

import Data.List.NonEmpty
import Graphics.X11.Slide

version :: Version
version = [0, 0, 0, 1]

main :: IO ()
main = runSlide version someSlide

someSlide :: Slide
someSlide = title :| [
	prelude, refactoring, giveup, killerApp, killerApp2, urls, environment,
	repl1, repl2, repl3, repl4, repl5, defFile1, defFile2, defFile3,
	type1, type2, type3, type4,
	aboutIO1, aboutIO2, aboutIO3, aboutIO4
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #3" "1. Haskellの概要" :| []

prelude :: Page
prelude = pageTitle "Haskellの特徴" :| [
	text "Haskellのよさを紹介する" >> nextLine,
	text "Haskellは僕の知る汎用言語のなかで一番素直な言語",
	text "ほかの多くの言語は",
	itext 4 "変数xとyを使って計算を行った結果",
	itext 4 "なぜか変数xの値が変化してしまうこともある",
	text "それ以外でも、Haskellは構文も意味論も",
	itext 4 "すごく素直なつくりになっている",
	text "素直である結果として保守しやすい"
	]

refactoring :: Page
refactoring = pageTitle "Haskellの特徴" :| [
	text "たとえば、リファクタリングやバグフィックスのとき",
	text "型の設計をきちんとしていれば",
	itext 4 "おおもとを書き換えたうえで",
	itext 4 "あとは、型エラーの出た箇所をつぶしていくだけ"
		>> nextLine,
	itext 4 "...",
	itext 4 "だめだっ",
	text "(僕にとって)Haskellは空気のようなもの",
	text "「空気のよさ」や「空気の特徴」をつたえるのは困難"
	]

giveup :: Page
giveup = pageTitle "Haskellの特徴" :| [
	text "Haskellの特徴をつたえるのは(僕には)無理みたいだ",
	text "実際にコードを書いていくなかで",
	itext 4 "感じとってもらいたい",
	text "ただし、短時間では",
	itext 4 "Haskellの魅力を十分にはつたえられない",
	text "たとえば、Haskellの魅力のひとつに「保守性」がある",
	itext 4 "これは何年もコードを保守することでわかるもの"
	]

killerApp :: Page
killerApp = pageTitle "キラーアプリ" :| [
	text "Haskellで書かれたソフトウェアで有名なのは",
	itext 4 "GHC (Haskellのコンパイラ)",
	itext 4 "Xmonad (タイル型ウィンドウマネージャ)",
	itext 4 "Darcs (分散バージョン管理システム)",
	text "といったところか",
	text "ただ",
	itext 4 "GHCは再帰的だし",
	itext 4 "Xmonadはマニアックすぎるし",
	itext 4 "DarcsはGitに敗れたし",
	text "ということで、いまいち都合のいいものがなかった"
	]

killerApp2 :: Page
killerApp2 = pageTitle "キラーアプリ" :| [
	text "と思っていたら、これぞというものが見つかった",
	itext 4 "Pandoc (文書変換ソフト)",
	text "Pandocはマークダウンなどの形式の文書を",
	itext 4 "LaTeXなどの形式に変換する",
	text "入力にできる文書の形式は10種類ほど",
	itext 4 "出力にできる文書の形式は20種類以上",
	text "Haskellを知らなくても",
	itext 4 "Pandocなら知っているという人もいるくらい",
	text "最近、「C++のすごい人」が",
	itext 4 "Pandocを理解し改造するために",
	itext 4 "Haskellを学びはじめた様子",
	text "ここまでくれば",
	itext 4 "これをキラーアプリと呼んでいいように思う"
	]

urls :: Page
urls = pageTitle "当日用資料、サンプルコード" :| [
	text "今日やる内容はQiitaにすべて、まとめてある",
	text "以下の短縮アドレスからアクセスしてほしい" >> nextLine,
	itext 4 "https://goo.gl/EpZU8E" >> nextLine >>
	itext 4 "(イー、ピー、ゼット、ユー、ハチ、イー)" >> nextLine,
	text "サンプルコードはGitHubに置いてある" >> nextLine,
	itext 4 "https://goo.gl/GQdqsT" >> nextLine >>
	itext 4 "(ジー、キュー、ディー、キュー、エス、ティー)"
	]

environment :: Page
environment = pageTitle "環境の確認" :| [
	text "Stackによる環境がちゃんと導入されていることを確認",
	text "ターミナルにstack ghc -- --versionと入力する",
	itext 3 "% stack ghc -- --version",
	text "'%'はプロンプトを表すので、入力しない",
	text "結果は、つぎのようになる",
	itext 3 "The Glorious Glasgow Haskell Compilation System,",
	itext 3 "version 8.2.2",
	text "ちゃんと導入されているだろうか?"
	]

repl1 :: Page
repl1 = pageTitle "対話環境" :| [
	text "それでは、対話環境を開こう",
	text "ターミナルにstack ghciと打ち込む",
	itext 4 "% stack ghci",
	text "とりあえず数値や文字を打ち込む",
	itext 4 "Prelude> 123",
	itext 4 "123",
	itext 4 "Prelude> 'c'",
	itext 4 "'c'",
	text "できただろうか"
	]

repl2 :: Page
repl2 = pageTitle "対話環境" :| [
	text "足し算や引き算もできる",
	itext 4 "Prelude> 3 + 5",
	itext 4 "8",
	itext 4 "Prelude> 15 - 9",
	itext 4 "6",
	text "関数を使ってみよう",
	itext 4 "Prelude> negate 8",
	itext 4 "-8",
	text "関数を使うには、つぎのようにする",
	itext 4 "[関数名] [引数1] [引数2] ..."
	]

repl3 :: Page
repl3 = pageTitle "対話環境" :| [
	text "+や-などの演算子も実は関数だ",
	itext 4 "Prelude> (+) 3 5",
	itext 4 "8",
	itext 4 "Prelude> (-) 15 9",
	itext 4 "6",
	text "関数(+)に引数3と5とを、",
	itext 4 "関数(-)に引数15と9とを、それぞれ、あたえている"
	]

repl4 :: Page
repl4 = pageTitle "対話環境" :| [
	text "関数を定義してみよう",
	text "そのまえに、変数を定義してみる",
	itext 4 "Prelude> n = 1234",
	itext 4 "Prelude> n",
	itext 4 "1234",
	itext 4 "Prelude> n + 4321",
	itext 4 "5555"
	]

repl5 :: Page
repl5 = pageTitle "対話環境" :| [
	text "関数を定義してみよう",
	text "半径から円の面積をもとめる関数",
	itext 4 "Prelude> area r = r ^ 2 * pi",
	itext 4 "Prelude> area 3",
	itext 4 "28.274333882308138",
	text "半径3cmの円の面積は、だいたい28cm^2",
	text "変数の定義と関数の定義の構文とは、よく似ている",
	text "Haskellでは変数piは円周率として定義ずみ"
	]

defFile1 :: Page
defFile1 = pageTitle "定義ファイル" :| [
	text "対話環境を終了する",
	itext 4 "Prelude> :quit",
	text "対話環境で定義した関数は",
	itext 4 "対話環境の終了とともに消えてしまう",
	text "関数を定義したファイルを対話環境に読み込んでみる",
	text "好きなエディタでファイルcircle.hsを作ろう",
	text "僕の場合はVimを使う",
	itext 4 "% vim circle.hs",
	itext 4 "area r = r ^ 2 * pi",
	text "これを対話環境に読み込む",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load circle.hs"
	]

defFile2 :: Page
defFile2 = pageTitle "定義ファイル" :| [
	text "試してみよう",
	itext 4 "*Main> area 3",
	itext 4 "28.274333882308138",
	text "読み込めたようだ",
	text "ここで、対話環境は立ち上げたままとして",
	itext 4 "ファイルcircle.hsに円周をもとめる関数を追加",
	itext 4 "% vim circle.hs",
	itext 4 "circumf r = r * 2 * pi",
	text "対話環境に、コマンド:reloadを打ち込む",
	itext 4 "*Main> :reload",
	itext 4 "*Main> circumf 3",
	itext 4 "18.84955592153876"
	]

defFile3 :: Page
defFile3 = pageTitle "定義ファイル" :| [
	text "たいていにおいて、僕の開発スタイルは",
	itext 4 "ターミナルを2つに分割して",
	itext 4 "Vimと対話環境を開きっぱなしにして",
	itext 4 "ファイルを変更するたびに:reloadしながら"
	]

type1 :: Page
type1 = pageTitle "型" :| [
	text "値には型がある",
	text "対話環境で型をみてみよう",
	itext 4 "*Main> :type 'c'",
	itext 4 "'c' :: Char",
	text "文字'c'はChar型の値だ",
	itext 4 "*Main> :type True",
	itext 4 "True :: Bool",
	text "真(本当)であることをあらわす値TrueはBool型の値だ"
	]

type2 :: Page
type2 = pageTitle "関数の型" :| [
	text "関数にも型がある",
	text "関数の型は、引数の型と返り値の型とで決まる",
	text "例として、文字を大文字にする関数と",
	itext 4 "文字が大文字であることを確認する関数をみる",
	text "まずは、それぞれを使ってみる",
	itext 4 "*Main> :module Data.Char",
	itext 4 "Prelude Data.Char> toUpper 'c'",
	itext 4 "'C'",
	itext 4 "Prelude Data.Char> isUpper 'c'",
	itext 4 "False",
	text "関数toUpper, isUpperは",
	itext 4 "モジュールData.Charから公開されている",
	text "対話環境では、コマンド:moduleでモジュールを導入する"
	]

type3 :: Page
type3 = pageTitle "関数の型" :| [
	text "関数toUpperは引数も返り値もChar型の値であり",
	itext 3 "関数isUpperは引数がChar型で、返り値はBool型の値",
	text "それぞれの型をみてみよう",
	itext 4 "Prelude Data.Char> :type toUpper",
	itext 4 "toUpper :: Char -> Char",
	itext 4 "Prelude Data.Char> :type isUpper",
	itext 4 "isUpper :: Char -> Bool",
	text "関数の型は、引数の型と返り値の型とを'->'でつなぐ"
	]

type4 :: Page
type4 = pageTitle "型宣言" :| [
	text "Haskellでは(たいてい)型は自動的に決まる",
	text "しかし、型を明示するのは良い習慣だ",
	text "ファイルcircle.hsを編集しよう",
	itext 4 "% vim circle.hs",
	itext 4 "area :: Double -> Double",
	itext 4 "area r = r ^ 2 * pi" >> nextLine,
	itext 4 "circumf :: Double -> Double",
	itext 4 "circumf r = r * 2 * pi",
	text "対話環境に読み込んで試してみよう",
	itext 4 "Prelude Data.Char> :load circle.hs",
	itext 4 "*Main> area 3",
	itext 4 "28.274333882308138"
	]

aboutIO1 :: Page
aboutIO1 = pageTitle "入出力について" :| [
	text "Haskellでは「関数は関数」だ",
	itext 4 "「足し算を評価するついでに",
	itext 8 "設定ファイルを書きかえておきましたよ」",
	text "といった(気の利いた|余計な)ことはしてくれない",
	text "関数は入出力をしない",
	text "...",
	text "「入出力なしで、どうやって生きていけと?!」",
	text "Haskellでは関数の評価と入出力とは分離されている",
	text "入出力は、むしろ、ただの値だ"
	]

aboutIO2 :: Page
aboutIO2 = pageTitle "入出力は値だ" :| [
	text "リストという構造がある",
	text "たとえば数のリストの総和をもとめられる",
	itext 1 "*Main> sum [3, 4, 5]",
	itext 1 "12",
	text "入出力も値なのでリストの要素にすることができる",
	itext 1 "*Main> hello = [putStrLn \"hello\", putStrLn \"world\"]",
	text "リストに含まれる入出力を組み立てることもできる",
	itext 1 "*Main> sequence_ hello",
	itext 1 "hello",
	itext 1 "world"
	]

aboutIO3 :: Page
aboutIO3 = pageTitle "入出力は値だ" :| [
	text "逆順にして組み立てることもできる",
	itext 4 "*Main> sequence_ (reverse hello)",
	itext 4 "world",
	itext 4 "hello",
	text "対話環境は評価した結果の値が入出力だったとき",
	itext 4 "その入出力を実行してくれる",
	text "ちなみに、結果の値が入出力でないとき",
	itext 4 "もしそれが表示可能なら表示する"
	]

aboutIO4 :: Page
aboutIO4 = pageTitle "入出力の詳細は拙書で" :| [
	text "Haskellでは入出力(および状態変化)は",
	itext 4 "IOモナドという、わくぐみであつかわれる",
	text "今回はIOモナドについては、くわしく説明しない",
	text "とりあえず覚えておくことは、Haskellでは",
	itext 4 "「入出力は",
	itext 8 "評価のついでに、おこなうものではない」",
	itext 4 "「入出力も、また値である」",
	text "ということ"
	]
