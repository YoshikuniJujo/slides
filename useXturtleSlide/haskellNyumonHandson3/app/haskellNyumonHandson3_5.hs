module Main where

import Data.List.NonEmpty
import Graphics.X11.Slide

version :: Version
version = [0, 0, 0, 1]

main :: IO ()
main = runSlide version someSlide

someSlide :: Slide
someSlide = title :| [
	prelude, ioAsValue, funPutStrLn, ioNextIo, ioBind, ioTypes,
	doNotation1, doNotation2, doNotation3, doNotation4,
	expressionCase1
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #3" "5. IOについて" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "Haskellの「関数」にできるのは",
	itext 4 "引数をとり、返り値をかえすことだけ",
	text "ここまでは、対話環境で返り値を表示してきた",
	text "そろそろ、「対話環境で」ではなく",
	itext 4 "独立した実行可能ファイルを作りたい",
	text "しかし、「関数」にはキー入力を受け取ることも",
	itext 4 "標準出力に出力することもできない",
	text "どうしたらいいだろうか?"
	]

ioAsValue :: Page
ioAsValue = pageTitle "入出力という値" :| [
	text "Haskellでは、たとえば数値や文字列という値と",
	itext 4 "おなじように、「入出力」という値がある",
	text "「入出力」という値は",
	itext 4 "より細かい「入出力」という部品から組み立てられる",
	text "組み立てられた「入出力」は",
	itext 4 "対話環境で評価されたとき、あるいは",
	itext 4 "変数mainを束縛したものは",
	itext 8 "スタンドアロンなプログラムのなかで",
	itext 2 "実行される"
	]

funPutStrLn :: Page
funPutStrLn = pageTitle "1行を表示" :| [
	text "まずは1行を標準出力に出力する",
	itext 4 "*Main> putStrLn \"hello\"",
	itext 4 "hello",
	text "まちがいやすいところだが",
	itext 4 "関数の評価の副作用として出力されたのではない",
	text "対話環境は「式を評価した結果」が「入出力」の場合",
	itext 4 "その入出力を「実行」してくれる"
	]

ioNextIo :: Page
ioNextIo = pageTitle "...のつぎに..." :| [
	text "「入出力」は値なので演算子によって演算できる",
	text "「入出力」に対して(は)",
	itext 4 "「...のつぎに...」を意味する演算子(>>)がある",
	itext 4 "*Main> putStrLn \"hello\" >> putStrLn \"world\"",
	itext 4 "hello",
	itext 4 "world"
	]

ioBind :: Page
ioBind = pageTitle "...の結果をわたして..." :| [
	text "「入出力」の「入出」のところはどうだろうか",
	text "「入力」は「入力された値」が使えないと意味がない",
	text "Haskellでは「入力された値」を",
	itext 4 "つぎの「入出力」にわたす仕組みがある",
	text "それには演算子(>>=)を使う",
	itext 4 "*Main> getLine >>= putStrLn",
	itext 4 "(何か入力し改行)hello",
	itext 4 "hello"
	]

ioTypes :: Page
ioTypes = pageTitle "入出力の型" :| [
	text "「入出力」も値なので型がある",
	itext 4 "*Main> :type getLine",
	itext 4 "getLine :: IO String",
	text "「入出力」の型はIO aであり",
	itext 4 "型変数aのところは、つぎの入出力にわたす値の型",
	text "つぎにわたす値がないときは",
	itext 4 "型変数aのところは",
	itext 4 "「情報がない」値の型であるユニット型になる",
	itext 4 "*Main> :type putStrLn \"hello\"",
	itext 4 "putStrLn \"hello\" :: IO ()"
	]

doNotation1 :: Page
doNotation1 = pageTitle "do記法" :| [
	text "ここまでみてきた「入出力」の例をファイルに定義する",
	itext 4 "% vim io.hs",
	itext 4 "hello :: IO ()",
	itext 4 "hello = putStrLn \"hello\" >> putStrLn \"world\"",
	itext 4 "",
	itext 4 "echo :: IO ()",
	itext 4 "echo = getLine >>= putStrLn"
	]

doNotation2 :: Page
doNotation2 = pageTitle "do記法" :| [
	text "対話環境で試してみる",
	itext 4 "*Main> :load io.hs",
	itext 4 "*Main> hello",
	itext 4 "hello",
	itext 4 "world",
	itext 4 "*Main> echo",
	itext 4 "(何か打ちこみ、改行)hello",
	itext 4 "hello"
	]

doNotation3 :: Page
doNotation3 = pageTitle "do記法" :| [
	text "Haskellにはdo記法という構文糖がある",
	text "do記法を使って入出力hello, echoを書き直す",
	text "型宣言はそのまま、関数定義を編修する",
	itext 4 "% vim io.hs",
	itext 4 "hello = do",
	itext 4 "        putStrLn \"hello\"",
	itext 4 "        putStrLn \"world\"",
	itext 4 "",
	itext 4 "echo = do",
	itext 4 "        l <- getLine",
	itext 4 "        putStrLn l"
	]

doNotation4 :: Page
doNotation4 = pageTitle "do記法" :| [
	text "do記法を使うと",
	itext 4 "ふつうの手続き型言語のように書ける",
	text "対話環境で試してみよう",
	itext 4 "*Main> :reload",
	itext 4 "*Main> hello",
	itext 4 "hello",
	itext 4 "world",
	itext 4 "*Main> echo",
	itext 4 "(何か打ち込み、改行)hello",
	itext 4 "hello"
	]

expressionCase1 :: Page
expressionCase1 = pageTitle "case式" :| [
	text "ここで、case式を紹介する",
	text "Haskellでコードを分岐させるには",
	itext 4 "いくつかの構文があるが",
	itext 4 "case式がすべての基礎になっている",
	text "case式では、値に対してパターンマッチをして",
	itext 4 "マッチするかどうかでコードを分岐させる"
	]

-- 文字列に対するcase式の例
-- Maybe値に対するcase式の例
