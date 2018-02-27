module Main where

import Data.List.NonEmpty
import Graphics.X11.Slide

version :: Version
version = [0, 0, 0, 1]

main :: IO ()
main = runSlide version someSlide

someSlide :: Slide
someSlide = title :| [
	prelude, refactoring, giveup, killerApp, killerApp2, environment,
	repl1, repl2, repl3, repl4
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #3" "1. Haskellの概要" :| []

prelude :: Page
prelude = pageTitle "Haskellの特徴" :| [
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
	itext 4 "あとは、型エラーの出た箇所をつぶしていけばいい"
		>> nextLine,
	itext 4 "...",
	itext 4 "だめだっ",
	text "(僕にとって)Haskellは空気のようなもの",
	text "「空気のよさ」や「空気の特徴」をつたえるのは困難"
	]

giveup :: Page
giveup = pageTitle "Haskellの特徴" :| [
	text "Haskellの特徴をつたえるのは(僕には)無理みたいだ",
	text "ハンズオンしていくなかで、その都度",
	itext 4 "「これがHaskellの特徴です」のように紹介する"
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
	text ""
	]
