import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude, putStr1, print1, print2, getChar1, getArgs1, getArgs2,
	hGetSetBuffering1, hGetSetBuffering2
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン! #2"
	"8. 入出力に関する関数、動作" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "いくつかの入出力に関する関数、動作を学ぶ",
	text "以下に学ぶ関数、動作を示す",
	itext 4 "関数putStr, print, 動作getChar",
	itext 4 "動作getArgs",
	itext 4 "関数hGetBuffering, hSetBuffering"
	]

putStr1 :: Page
putStr1 = pageTitle "関数putStr" :| [
	text "すでに関数putStrLnをみた",
	itext 4 "> putStrLn \"hello\"",
	itext 4 "hello",
	text "関数putStrLnは引数である文字列を",
	itext 4 "標準出力に出力したあと改行を出力する",
	text "関数putStrは改行を出力しない",
	itext 4 "> putStr \"hello\"",
	itext 4 "hello>",
	text "改行が出力されないので",
	itext 4 "プロンプトが出力のあとに続く"
	]

print1 :: Page
print1 = pageTitle "関数print" :| [
	text "関数printは文字列ではなく「値」を表示する",
	itext 4 "> print 123",
	itext 4 "123",
	text "値を文字列化する関数showがある",
	itext 4 "> show 123",
	itext 4 "\"123\"",
	text "関数printは関数putStrLnとshowを結合したものだ",
	itext 4 "> (putStrLn . show) 123",
	itext 4 "123"
	]

print2 :: Page
print2 = pageTitle "関数print" :| [
	text "実は対話環境は、評価した結果が動作でないとき",
	itext 4 "結果の値を関数printに引数としてあたえ",
	itext 4 "作られた「動作」を実行していたことになる",
	text "よって、対話環境では、つぎのふたつの結果がおなじになる",
	itext 4 "123",
	itext 4 "print 123"
	]

getChar1 :: Page
getChar1 = pageTitle "関数getChar" :| [
	text "ユーザの打ち込んだ文字列を行単位で取得する",
	itext 4 "関数getLineはすでにみた",
	text "ユーザの打ち込んだ文字を、ひとつだけ取得する",
	itext 4 "関数getCharをみてみよう",
	itext 4 "> getChar",
	itext 4 "(cと入力する)c'c'",
	text "動作getCharは入力された文字をかえす",
	text "かえされた文字は対話環境によって表示される"
	]

getArgs1 :: Page
getArgs1 = pageTitle "動作getArgs" :| [
	text "ターミナルから呼び出すアプリケーションを作っていると",
	itext 4 "コマンドライン引数を取得したくなる",
	text "動作getArgsを使う",
	text "ファイルaction.hsに、定義を追加する",
	itext 4 "printArgs = do",
	itext 4 "        as <- getArgs",
	itext 4 "        print as",
	text "関数getArgsは",
	itext 4 "モジュールSystem.Environmentから公開されている",
	text "ファイルの先頭に、つぎのように追加する",
	itext 4 "import System.Environment",
	text "モジュールを導入するには予約語importを使う"
	]

getArgs2 :: Page
getArgs2 = pageTitle "動作getArgs" :| [
	text "対話環境で試してみる",
	itext 4 "> printArgs",
	itext 4 "[]",
	text "対話環境なので、コマンドライン引数は指定されていない",
	text "動作getArgsのかえすリストは空リストになる",
	text "対話環境のなかでコマンドライン引数を指定するには",
	itext 4 "コマンド:runを使う",
	itext 4 "> :run printArgs hello world",
	itext 4 "[\"hello\",\"world\"]"
	]

hGetSetBuffering1 :: Page
hGetSetBuffering1 = pageTitle "バッファリング" :| [
	text "バッファリングというものがある",
	text "バッファリングのモードを変えることで",
	itext 4 "一文字ずつ入力を行うのか",
	itext 4 "一行ずつ入力を行うのか、を",
	itext 2 "変えることができる",
	text "現在のバッファリングのモードを確認する",
	itext 4 "> :module System.IO",
	itext 4 "> hGetBuffering stdin",
	itext 4 "NoBuffering",
	text "現在のバッファリングのモードはNoBufferingである",
	text "つまり、入力は一文字ずつ処理される",
	itext 4 "> getChar",
	itext 4 "(cと入力)c'c'"
	]

hGetSetBuffering2 :: Page
hGetSetBuffering2 = pageTitle "バッファリング" :| [
	text "バッファリングのモードを変えるには",
	itext 4 "関数hSetBufferingを使う",
	itext 4 "> hSetBuffering stdin LineBuffering",
	itext 4 "> hGetBuffering stdin",
	itext 4 "LineBuffering",
	itext 4 "> getChar",
	itext 4 "(c123と入力し改行を入力)c'c'",
	itext 4 "> 123",
	itext 4 "123",
	text "改行を入力するまで、文字'c'は読み込まれない",
	text "一文字読み込んだあとの文字列\"123\"は",
	itext 4 "対話環境への「つぎの入力」とされる"
	]
