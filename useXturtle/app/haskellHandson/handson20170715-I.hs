import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude, useInteract, useInteract2, toEnd, toEnd2,
	youSay, youSay2, sumAll, sumAll2, wakugumi, wakugumi2,
	wakugumi3, wakugumi4
	]

titlePage :: Page
titlePage = writeTitle
	"Haskell入門ハンズオン!" "自作プログラム用レクチャー" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "受講者として、完全な初心者を想定しているので",
	text "自作プログラム作成のところまで",
	itext 4 "数時間でもっていくことは困難",
	text "とりあえず、対話的なプログラムの作りかたは示したが",
	itext 4 "これだけで理解して、応用するのは難しい",
	text "そこで、標準入力からの入力を変換して",
	itext 4 "標準出力へと出力する簡単な方法を示す"
	]

useInteract :: Page
useInteract = pageTitle "関数interact" :| [
	text "関数interactという関数がある",
	itext 4 "% stack ghci",
	itext 4 "*Main Hndsn> :type interact",
	itext 4 "interact :: (String -> Stirng) -> IO ()",
	text "文字列を文字列に変換する関数を",
	itext 4 "入出力をおこなう機械に変換する関数である",
	text "つぎのようなコードを書く(実際には用意してある)",
	itext 4 "% vim toUpper.hs",
	itext 4 "import Data.Char",
	itext 4 "main :: IO ()",
	itext 4 "main = interact $ map toUpper"
	]

useInteract2 :: Page
useInteract2 = pageTitle "関数interact" :| [
	text "コンパイル、実行してみよう",
	itext (- 4) "% stack ghc -- -fno-warn-tabs toUpper.hs -o toUpper",
	itext (- 4) "% ./toUpper",
	itext (- 4) "hello",
	itext (- 4) "HELLO",
	itext (- 4) "world",
	itext (- 4) "WORLD",
	text "終了させるにはCtrl-Dか、Ctrl-Cで良いと思われる",
	text "OSごとに、EOFを打ち込むか、または終制終了させてほしい",
	text "わからないかたは、挙手をおねがいします",
	text "OSごとに、わかるかた、教えてください、おねがいします"
	]

toEnd :: Page
toEnd = pageTitle "関数interact" :| [
	text "関数interactはかしこいので、それ以上必要ないという",
	itext 4 "ところまでで終わりにしてくれる",
	itext 4 "% vim threeLines.hs",
	itext 4 "main :: IO ()",
	itext 4 "main = interact $ unlines . take 3 . lines"
	]

toEnd2 :: Page
toEnd2 = pageTitle "関数interact" :| [
	text "コンパイルして、実行してみる",
	itext (- 4) "% stack ghc -- -fno-warn-tabs threeLines.hs -o threeLines",
	itext (- 4) "% ./threeLines",
	itext (- 4) "hello",
	itext (- 4) "hello",
	itext (- 4) "world",
	itext (- 4) "world",
	itext (- 4) "and",
	itext (- 4) "and",
	text "ここまでで、プロンプトがかえってくる"
	]

youSay :: Page
youSay = pageTitle "関数interact" :| [
	text "たとえば、こんな感じ",
	itext 4 "% vim youSay.hs",
	itext 4 "main :: IO ()",
	itext 4 "main = interact $ unlines",
	itext 8 ". zipWith (++) [",
	itext 12 "\"Oh no ! You say \", \"and I say \" ]",
	itext 8 ". lines"
	]

youSay2 :: Page
youSay2 = pageTitle "関数interact" :| [
	text "コンパイルして、実行する",
	itext 0 "% stack ghc -- -fno-warn-tabs youSay.hs -o youSay",
	itext 0 "% ./youSay",
	itext 0 "goodbye",
	itext 0 "Oh no ! You say goodbye",
	itext 0 "hello",
	itext 0 "and I say hello"
	]

sumAll :: Page
sumAll = pageTitle "関数interact" :| [
	text "あるいは、こんな感じ",
	itext 4 "% vim sumAll.hs",
	itext 4 "main :: IO ()",
	itext 4 "main = interact $ (++ \"\\n\") . show",
	itext 8 ". sum . map read . takeWhile (/= \".\")",
	itext 8 ". lines"
	]

sumAll2 :: Page
sumAll2 = pageTitle "関数interact" :| [
	text "コンパイルして、実行する",
	itext 0 "% stack ghc -- -fno-warn-tabs sumAll.hs -o sumAll",
	itext 0 "% ./sumAll",
	itext 0 "3",
	itext 0 "8",
	itext 0 "210",
	itext 0 "15",
	itext 0 ".",
	itext 0 "236"
	]

wakugumi :: Page
wakugumi = pageTitle "関数interact" :| [
	text "状態を変化させていくこともできる",
	itext 0 "% vim addSub.hs",
	itext 0 "main :: IO ()",
	itext 0 "main = interact $ unlines . addSub 0 . lines",
	itext 0 "",
	itext 0 "addSub :: Integer -> [String] -> [String]",
	itext 0 "addSub n0 (('+' : s) : ls) = show n : addSub n ls",
	itext 4 "where n = n0 + read s",
	itext 0 "addSub n0 (('-' : s) : ls) = show n : addSub n ls",
	itext 4 "where n = n0 - read s",
	itext 0 "addSub _ (\".\" : _) = [\"Good-bye!\"]",
	itext 0 "addSub _ [] = [\"Good-bye!\"]",
	itext 0 "addSub n0 (_ : ls) = addSub n0 ls"
	]

wakugumi2 :: Page
wakugumi2 = pageTitle "関数interact" :| [
	text "コンパイルして、実行する",
	itext 0 "% stack ghc -- -fno-warn-tabs addSub.hs -o addSub",
	itext 0 "% ./addSub",
	itext 0 "+8",
	itext 0 "8",
	itext 0 "+123",
	itext 0 "133",
	itext 0 "-15",
	itext 0 "116",
	itext 0 "-95",
	itext 0 "21",
	itext 0 ".",
	itext 0 "Good-bye!"
	]

wakugumi3 :: Page
wakugumi3 = pageTitle "関数interact" :| [
	text "わくぐみとしては、つぎのようになる",
	itext 0 "% vim wakugumi.hs",
	itext 0 "main :: IO ()",
	itext 0 "main = interact $ unlines . yourFun yourInit . lines",
	itext 0 "",
	itext 0 "yourFun :: YourState -> [String] -> [String]",
	itext 0 "yourFun s (l : ls)",
	itext 4 "| yourQuit l = [\"Good-bye!\"]",
	itext 4 "| otherwise = yourOutput s l :",
	itext 8 "yourFun (yourNext s l) ls"
	]

wakugumi4 :: Page
wakugumi4 = pageTitle "関数interact" :| [
	text "自作プロジェクトにはwakugumi.hsを使ってもいい",
	text "状態の型YourState、状態の初期値yourInit",
	itext 4 "終了状件yourQuit",
	itext 4 "出力する文字列を作成する関数yourOutput",
	itext 4 "状態を更新する関数yourNext",
	text "これらを定義すると、自作プロジェクトが作れる",
	text "例として、loveを3回入力すると",
	itext 4 "人工無脳が\"I love you!\"しか言わなくなるアプリ",
	text "これをコンパイル実行してみて、それから",
	itext 4 "書き換えていくのもいいかもしれない"
	]
