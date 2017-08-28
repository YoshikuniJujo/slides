-- import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude, foobar, foobar2, foobar3, foobar4,
	sleepSort, sleepSort2, sleepSort3, sleepSort4, sleepSort5,
	sleepSort6, epilogue
	]

titlePage :: Page
titlePage = writeTitle
	"Haskell入門者LT会(予備)" "Haskellで並行プログラミング" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "「Haskellでソケットプログラミング」は内容すくなめ",
	text "はやく終わりすぎたときのために、こちらも用意した",
	text "Haskellで並行プログラミングをしてみよう",
	text "Haskellを学ぶとき、実は基礎よりも、",
	itext 4 "このていどの応用のほうが、かえって簡単かも"
	]

foobar :: Page
foobar = pageTitle "Hello, Concurrent!" :| [
	text "Haskellで並行計算をするには",
	itext 4 "Control.Concurrent.forkIOを使う",
	text "つぎのコードを試してみよう",
	text "(コードは実際には用意してある)",
	itext 4 "% vim helloConcurrent.hs"
	]

foobar2 :: Page
foobar2 = itext 4 "import Control.Monad " :| [
	itext 4 "import Control.Concurrent",
	itext 4 "",
	itext 4 "main :: IO ()",
	itext 4 "main = do",
	itext 8 "forkIO . forever $ do",
	itext 12 "threadDelay $ 1000 * 1000",
	itext 12 "putStrLn \"hello\"",
	itext 8 "forkIO . forever $ do",
	itext 12 "threadDelay $ 1500 * 1000",
	itext 12 "putStrLn \"world\"",
	itext 8 "threadDelay $ 30 * 1000 * 1000"
	]

foobar3 :: Page
foobar3 = pageTitle "Hello, Concurrent!" :| [
	text "関数foreverは引数にとった動作を永遠にくりかえす",
	text "関数forkIOは新しいスレッドを作成し",
	itext 4 "あたえられた動作を実行する",
	text "関数threadDelayは、あたえられたマイクロ秒だけ休止させる",
	text "コード全体では",
	itext 4 "1秒ごとにhelloと表示し",
	itext 4 "1.5秒ごとにworldと表示する",
	text "親となるスレッドでは30秒の休止を行う",
	text "親のスレッドが終了すると子のスレッドも終了する"
	]

foobar4 :: Page
foobar4 = pageTitle "Hello, Concurrent!" :| [
	text "試してみよう",
	text "コンパイルせずに試すには-e mainとする",
	itext (- 2) "% stack ghc -- -fno-warn-tabs -e main helloConcurrent.hs",
	itext (- 2) "hello",
	itext (- 2) "world",
	itext (- 2) "hello",
	itext (- 2) "worlhde",
	itext (- 2) "llo",
	itext (- 2) "hello",
	itext (- 2) "world",
	text "場合によっては、うえの例のようにhelloとworldの出力が",
	itext 4 "まじりあうこともある"
	]

sleepSort :: Page
sleepSort = pageTitle "スリープソート" :| [
	text "アメリカ版の2ちゃんねるである4chanの",
	itext 4 "プログラミング板で提案された画期的なソート方法",
	text "スリープソート",
	text "数値をソートすることができる",
	text "やりかたとしては",
	itext 4 "あたえられた数値のそれぞれに対して",
	itext 4 "スレッドを生成し、数値ぶんだけ休止したあと",
	itext 4 "その数値を出力する",
	text "小さい数ほど、はやく出力される",
	itext 4 "-> ソートされた出力となる"
	]

sleepSort2 :: Page
sleepSort2 = pageTitle "スリープソート" :| [
	text "つぎのコードを試してみよう",
	text "(サンプルコードとして用意してある)",
	itext (- 4) "% vim sleepSort.hs",
	itext (- 4) "import Control.Concurrent",
	itext (- 4) "",
	itext (- 4) "sleepSort :: [Int] -> IO ()",
	itext (- 4) "sleepSort = mapM_ $",
	itext 0 "\\x -> forkIO $ threadDelay (x * 1000) >> print x",
	itext 0 "",
	text "関数mapM_は、リストにのすべての値にたいして、",
	itext 4 "あたえられた動作を実行する"
	]

sleepSort3 :: Page
sleepSort3 = pageTitle "スリープソート" :| [
	text "対話環境に読みこんで、試してみよう",
	itext 4 "% stack ghci",
	itext 4 "> :load sleepSort.hs",
	itext 4 "> sleepSort [3, 9, 8, 7, 4, 500, 2]",
	itext 4 "> 2",
	itext 4 "3",
	itext 4 "4",
	itext 4 "8",
	itext 4 "7",
	itext 4 "9",
	itext 4 "500",
	text "500を出力する前には、すこし時間がかかる",
	text "また、例のように、ときどき値が前後する"
	]

sleepSort4 :: Page
sleepSort4 = pageTitle "スリープソート" :| [
	text "表示するのではなく結果をリストにまとめたい",
	text "そのためには、Chanというデータ型が使える",
	text "go言語を学んだことがあるなら",
	itext 4 "あの「チャネル」だよと言えばわかる",
	text "順にいれたデータを順に取り出せるもの",
	itext 4 "と言っておこう"
	]

sleepSort5 :: Page
sleepSort5 = pageTitle "スリープソート" :| [
	text "つぎのコードを試してみよう",
	itext (- 4) "% vim sleepSortChan.hs",
	itext (- 4) "import Control.Concurrent",
	itext (- 4) "import Control.Concurrent.Chan",
	itext (- 4) "",
	itext (- 4) "sleepSort :: [Int] -> IO [Int]",
	itext (- 4) "sleepSort xs = do",
	itext 0 "c <- newChan",
	itext 0 "mapM_ (\\x -> forkIO $ threadDelay (x * 1000)",
	itext 4 ">> writeChan c x) xs",
	itext 0 "take (length xs) <$> getChanContents c"
	]

sleepSort6 :: Page
sleepSort6 = pageTitle "スリープソート" :| [
	text "対話環境に読み込んで、試してみよう",
	itext 4 "> :load sleepSortChan.hs",
	itext 4 "> sleepSort [3, 9, 8, 7, 4, 500, 2]",
	itext 4 "[2,3,4,7,8,9,500]"
	]

epilogue :: Page
epilogue = pageTitle "おわりに" :| [
	text "Haskellで並行計算をしてみた",
	text "forkIOで子スレッドを生成する",
	text "データの共有に今回はチャネルという仕組みを使った",
	text "Haskellでは、もっと高機能なSTMという仕組みがある",
	text "STMはソフトウェアトランザクショナルメモリの略",
	text "これも非常におもしろい考えかたであり",
	itext 4 "Haskellの機能をうまく使って作られている",
	text "いつか、STMも紹介したい"
	]
