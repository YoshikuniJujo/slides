-- import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude, foobar, foobar2, foobar3
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
foobar2 = itext 4 "import Control.Concurrent " :| [
	itext 4 "",
	itext 4 "main :: IO ()",
	itext 4 "main = do",
	itext 8 "forkIO . loop $ do",
	itext 12 "threadDelay $ 1000 * 1000",
	itext 12 "putStrLn \"hello\"",
	itext 8 "forkIO . loop $ do",
	itext 12 "threadDelay $ 1500 * 1000",
	itext 12 "putStrLn \"world\"",
	itext 8 "threadDelay $ 30 * 1000 * 1000",
	itext 4 "",
	itext 4 "loop :: IO a -> IO ()",
	itext 4 "loop act = act >> loop act"
	]

foobar3 :: Page
foobar3 = pageTitle "Hello, Concurrent!" :| [
	text "関数loopは引数にとった動作を永遠にくりかえす",
	text "関数forkIOは新しいスレッドを作成し",
	itext 4 "あたえられた動作を実行する",
	text "関数threadDelayは、あたえられたマイクロ秒だけ休止させる",
	text "コード全体では",
	itext 4 "1秒ごとにhelloと表示し",
	itext 4 "1.5秒ごとにworldと表示する",
	text "親となるスレッドでは30秒の休止を行う",
	text "親のスレッドが終了すると子のスレッドも終了する"
	]

sleepSort :: Page
sleepSort = pageTitle "スリープソート" :| [
	text "アメリカ版の2ちゃんねるであるプログラミング板で提案された",
	itext 4 "画期的なソート方法",
	text "スリープソート",
	text "数値をソートすることができる",
	text "やりかたとしては",
	itext 4 "あたえられた数値のそれぞれに対して",
	itext 4 "スレッドを生"
	]
