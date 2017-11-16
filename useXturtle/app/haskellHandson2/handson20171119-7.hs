import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude, action1, action2, action3, action4,
	doNotation1, doNotation2
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン! #2" "7. 入出力を学ぶ" :| []

prelude :: Page
prelude = pageTitle "関数" :| [
	text "いろいろな関数をみてきた",
	text "関数に引数をあたえたものを値に評価する",
	text "たとえば、つぎのような計算を考える",
	itext 4 "> 3 + 2 * 5",
	itext 4 "13",
	text "関数(演算子)である(+)や(*)に対して",
	itext 4 "整数値3, 2, 5をあたえることで",
	itext 4 "式3 + 2 * 5が作られ、それが13に評価される",
	text "関数は引数をとり、それによって作られた式が評価される",
	text "関数にできることは、それだけだ"
	]

action1 :: Page
action1 = pageTitle "動作" :| [
	text "式を値に評価すること",
	text "たしかに、それができるのは、すばらしいこと",
	text "しかし、僕らがプログラミングでやりたいことは",
	itext 4 "それだけじゃない",
	text "ウェブサーバを作るにも、ゲームを作るにも",
	itext 4 "何らかの「動作」が必要になる",
	text "「純粋な関数型」のわくぐみで「動作」をあつかいたい",
	text "どう考えるか?"
	]

action2 :: Page
action2 = pageTitle "動作" :| [
	text "基本となる「動作」を、関数によって組み合わせればいい",
	text "関数putStrLnは、文字列を表示する",
	itext 4 "> putStrLn \"hello\"",
	itext 4 "hello",
	itext 4 "> putStrLn \"world\"",
	itext 4 "world",
	text "putStrLn \"hello\"は「helloと表示する動作」に評価される",
	text "対話環境は、評価の結果が「動作」になったとき",
	itext 4 "その動作を「実行」する"
	]

action3 :: Page
action3 = pageTitle "動作を組み合わせる" :| [
	text "これらの動作を",
	itext 4 "「XのつぎにYを実行する」のように組み合わせる",
	itext 4 "> putStrLn \"hello\" >> putStrLn \"world\"",
	itext 4 "hello",
	itext 4 "world",
	text "「基本になる動作」を関数によって組み合わせて",
	itext 4 "「複雑な動作」を組み立てていく"
	]

action4 :: Page
action4 = pageTitle "動作を組み合わせる" :| [
	text "ファイルaction.hsに、つぎのように定義する",
	itext 4 "hello = putStrLn \"hello\" >> putStrLn \"world\"",
	text "対話環境に読み込み、試してみる",
	itext 4 "> :load action.hs",
	itext 4 "> hello",
	itext 4 "hello",
	itext 4 "world",
	text "動作を「関数」で組み合わせていくことで",
	itext 4 "複雑な動作を組み立てていくことができる"
	]

doNotation1 :: Page
doNotation1 = pageTitle "do記法" :| [
	text "演算子(>>)で動作を組み合わせて",
	itext 4 "より複雑な動作を組み立てていく",
	text "もちろん、それは「いい考え」だ",
	text "しかし、たとえばレシピを考えてみよう",
	itext 4 "鍋を火にかける",
	itext 4 "沸騰したらパスタを入れる",
	itext 4 "パスタが、やわらかくなったらザルにあげる",
	text "このように、順番に書かれた内容は",
	itext 4 "順番に実行されることが期待される",
	text "Haskellでは、明示的に演算子(>>)を書かなくてすむ",
	itext 4 "「do記法」という書きかたが用意されている"
	]

doNotation2 :: Page
doNotation2 = pageTitle "do記法" :| [
	text "do記法でaction.hsの関数helloを書き換えてみよう",
	itext 4 "hello = do",
	itext 4 "        putStrLn \"hello\"",
	itext 4 "        putStrLn \"world\"",
	text "このように明示的に演算子(>>)を書くかわりに",
	itext 4 "動作を並べて書くことができる",
	text "注意する点は",
	itext 4 "列挙される動作は",
	itext 8 "予約語doのある行よりも深くインデントし",
	itext 4 "それぞれの「列挙される動作」どうしの",
	itext 8 "インデントは「そろえる」ということだ",
	text "どうだろうか",
	text "「ふつうの言語」の書きかたに近くなったと思う"
	]
