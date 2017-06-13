import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	otherLanguage, separate, replFunction, replFunction2,
	putStrFunction, putStrFunction2
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン!" "3. IOモナド" :| []

otherLanguage :: Page
otherLanguage = pageTitle "一般的な言語での入出力のやりかた" :| [
	text "Haskell以外の言語のほとんどで",
	itext 4 "入出力と関数の評価とはわけられていない",
	text "これは本来は、おかしなこと",
	text "たとえば3 + 5を評価して8という結果を出したら",
	itext 4 "どこかの他の変数xの値が10から100になってしまう",
	itext 4 "あるいは、誰かの口座の残高が0になったりする",
	text "そういう世界",
	text "Haskellでは、そういうことは起こらない",
	text "評価と入出力は、ぜんぜん別のこと"
	]

separate :: Page
separate = pageTitle "評価と実行とをわける" :| [
	text "「評価と実行とをわける」",
	text "この言いかたは、他の言語を学んだことのある人向け",
	text "本来、まったく違うものなので、「わける」とは言えない",
	text "Haskellでは、式が、ひとつの機械に評価されて",
	itext 4 "その機械を別のシステムで実行する、というモデル"
	]

replFunction :: Page
replFunction = pageTitle "対話環境の機能" :| [
	text "「評価と実行はわかれている」",
	text "ただし、対話環境の機能が、それを隠してしまう",
	text "なので、今まで細かく考えなかった対話環境の機能について",
	itext 4 "よく考えてみよう",
	text "対話環境にあたえられた式は、評価されて値をかえし",
	itext 4 "その値が表示される",
	text "「表示される」の部分は実は、「文字列に変換される」と",
	itext 4 "その文字列を「コンソールに出力する」という処理",
	text "つまり、今まで「対話環境で評価」していたつもりが",
	itext 4 "「評価」し、さらに「実行」していたということ",
	text "これは「評価された値」が",
	itext 4 "「入出力する機械」でないときだけ"
	]

replFunction2 :: Page
replFunction2 = pageTitle "対話環境の機能" :| [
	text "「評価された値」が「機械」だったときは?",
	text "そのときは、その機械を実行する",
	text "そして、実行した結果が、値を持てば",
	itext 4 "その値の表示を「実行」する",
	text "試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> 123",
	itext 4 "123",
	itext 4 "Prelude> putStrLn (show 123)",
	itext 4 "123",
	text "前者のように機械でない値に評価されたとき",
	itext 4 "対話環境は後者のような機械を作って実行する"
	]

putStrFunction :: Page
putStrFunction = pageTitle "文字列を表示する機械" :| [
	text "関数putStrLnは、文字列を引数としてとり",
	itext 4 "その文字列を表示する機械をかえす",
	text "型はつぎのようになる",
	itext 4 "putStrLn :: String -> IO ()",
	text "機械の型はIO ()のようになっている",
	text "()はユニット型という型",
	text "ユニット型はユニット値という",
	itext 4 "これも()で表される値を持つ",
	text "Bool型はFalseとTrueのどちらかの値を持つ",
	itext 4 "FalseまたはTrueのどったかという情報を持つ",
	text "ユニット型はユニット値ひとつしか値を持たない",
	itext 4 "つまり、この型の値は情報を持たない"
	]

putStrFunction2 :: Page
putStrFunction2 = pageTitle "文字列を表示する機械" :| [
	text "文字列の表示を試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> putStrLn \"hello\"",
	itext 4 "hello",
	text "関数putStrLnに文字列\"hello\"が、あたえられ",
	itext 4 "かえされたIO ()型の機械を、対話環境が実行する"
	]
