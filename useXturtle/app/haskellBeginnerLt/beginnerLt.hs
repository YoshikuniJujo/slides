import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	greeting, smallTalk, prelude, prelude2, fileAccess, fileAccess2,
	connectToGoogle, makeServer, makeServer2, kinokoTakenoko,
	ktClient, ktClient2
	]

titlePage :: Page
titlePage =
	writeTitle "Haskell入門者LT会" "Haskellでソケットプログラミング" :| []

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

smallTalk :: Page
smallTalk = pageTitle "近況" :| [
	text "最近はHaskellでのバイナリの処理を楽しんでいる",
	text "PNGファイルを解析したり",
	text "Deflate圧縮、展開を実装したり",
	text "ビットいじりが楽しい"
	]

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "入門者LT会ということで",
	itext 4 "何が楽しいかなと考えた結果",
	text "「タイピング量のわりに楽しめること」ということで",
	text "「Haskellでソケットプログラミング」とした",
	text "HTTPよりも、したの層で、いろいろと試してみようかと"
	]

prelude2 :: Page
prelude2 = pageTitle "はじめに" :| [
	text "前回、事前資料の復習とした部分が",
	itext 4 "意外と評判がよかったので",
	text "今回はスライドのだいたいの内容を、事前資料にUP",
	itext 4 "https://goo.gl/cPY8FM",
	text "また、サンプルコードや学習環境は、つぎのように入手できる",
	itext 2 "git使える人は",
	itext (- 4) "git clone \\",
	itext (- 2) "https://github.com/YoshikuniJujo/haskell-nyumon-handson",
	itext 2 "git使えない人は、以下でダウンロードして展開する",
	itext 4 "https://git.io/vQIKd",
	text "新しくできたディレクトリに移動しておこう",
	itext 4 "% cd haskell-nyumon-handson/beginnerLt"
	]

fileAccess :: Page
fileAccess = pageTitle "ファイルの読み書き" :| [
	text "まずはファイルの読み書きから",
	itext 4 "% cat hello.txt",
	itext 4 "Hello, world!",
	itext 4 "% stack ghci",
	itext 4 "> :module System.IO",
	itext 4 "> h <- openFile \"hello.txt\" ReadMode",
	itext 4 "> hGetLine h",
	itext 4 "\"Hello, world!\"",
	itext 4 "> hClose h"
	]

fileAccess2 :: Page
fileAccess2 = pageTitle "ファイルの読み書き" :| [
	itext 4 "> h <- openFile \"foo.txt\" WriteMode",
	itext 4 "> hPutStrLn h \"bar\"",
	itext 4 "> hClose h",
	itext 4 "> :quit",
	itext 4 "% cat foo.txt",
	itext 4 "bar"
	]

connectToGoogle :: Page
connectToGoogle = pageTitle "Webページに接続してみる" :| [
	text "つぎは、Webページに接続してみる",
	itext 2 "% stack ghci --package network",
	itext 2 "> :module Network",
	itext 2 "> :module + System.IO",
	itext 2 "> h <- connectTo \"skami.iocikun.jp\" $ PortNumber 80",
	itext 2 "> hPutStrLn h \"GET / HTTP/1.1\"",
	itext 2 "> hPutStrLn h \"\"",
	itext 2 "> hGetLine h",
	itext 2 "\"HTTP/1.1 200 OK\\r\"",
	text "ファイルの入出力と、おなじように書ける",
	text "HTTPのGETリクエストを出したら、HTTP 200 OKがかえってきた"
	]

makeServer :: Page
makeServer = pageTitle "サーバを立ててみよう" :| [
	text "手作業HTTPサーバを立ててみよう",
	itext 2 "> s <- listenOn $ PortNumber 4492",
	itext 2 "> (h, _, _) <- accept s",
	text "関数acceptでサーバはクライアントからの接続を待つ",
	text "ブラウザを開いて以下のアドレスをうちこもう",
	itext 2 "http://localhost:4492" ]

makeServer2 :: Page
makeServer2 = pageTitle "サーバを立ててみよう" :| [
	text "対話環境にもどって",
	itext 2 "> hGetLine h",
	itext 2 "\"GET / HTTP/1.1\\r\"",
	itext 2 "> hPutStrLn h \"HTTP/1.1 200 OK\"",
	itext 2 "> hPutStrLn h \"Content-Type: text/plain\"",
	itext 2 "> hPutStrLn h \"Content-Length: 5\"",
	itext 2 "> hPutStrLn h \"\"",
	itext 2 "> hPutStrLn h \"hello\"",
	text "これで、ブラウザにhelloと表示される(はず)"
	]

kinokoTakenoko :: Page
kinokoTakenoko = pageTitle "きのこ、たけのこ総選挙" :| [
	text "最後は「きのこ、たけのこ総選挙」でしめようかと",
	text "(ここでskami.iocikun.jpサーバでサーバを起動する",
	itext 2 "そのあと10ページから再開する >自分)",
	text "きのこ、たけのこ総選挙サーバを以下のアドレスで",
	itext 4 "立ち上げた",
	itext 2 "skami.iocikun.jp:4492",
	text "みなさんは、クライアントを書いて、選挙に参加します"
	]

ktClient :: Page
ktClient = pageTitle "きのこ、たけのこ総選挙" :| [
	text "つぎのようにクライアントを書きます",
	itext (-2) "% kinoko.hs",
	itext (-2) "import System.IO",
	itext (-2) "import Network",
	itext (-2) "",
	itext (-2) "main :: IO ()",
	itext (-2) "main = do",
	itext 2 "h <- connectTo \"skami.iocikun.jp\" $ PortNumber 4492",
	itext 2 "hPutStrLn h \"Yoshio\"",
	itext 2 "hPutStrLn h \"kinoko\"",
	itext 2 "hGetLine h >>= putStrLn",
	itext 2 "hClose h",
	text "自分の名前(アルファベット)、kinokoはtakenokoかも"
	]

ktClient2 :: Page
ktClient2 = pageTitle "きのこ、たけのこ総選挙" :| [
	text "走らせてみる",
	text "コンパイルするのが、めんどうなので、つぎのようにする",
	itext 0 "% stack ghc -- -fno-warn-tabs -e main kinoko.hs",
	itext 0 "kinoko: 2 takenoko: 3",
	text "できただろうか",
	text "サーバのほうの画面を出すので、さらに続けて投票してみよう",
	text "1人で何回、投票してもいいので",
	text "(サーバのほうの画面を見てみる >自分)"
	]
