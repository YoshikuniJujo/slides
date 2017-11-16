import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude, makeModule1, makeModule2,
	main1
	]

titlePage :: Page
titlePage = writeTitle
	"Haskell入門ハンズオン! #2" "9. モジュールと実行可能ファイル" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "プログラムを組むうえで",
	itext 4 "モジュール分割という考えかたは重要",
	text "Haskellでは1モジュール、1ファイルとなる",
	text "モジュールの作りかたをみる",
	text "また、単独で実行可能なファイルの作りかたをみる"
	]

makeModule1 :: Page
makeModule1 = pageTitle "モジュールを作る" :| [
	text "適当なモジュールを作ってみる",
	text "つぎのようなファイルSome.hsを作る",
	itext 4 "module Some where",
	itext 4 "",
	itext 4 "fun x = x * x",
	text "対話環境に読み込む",
	itext 4 "> :load Some.hs",
	itext 4 "*Some> fun 8",
	itext 4 "64",
	text "プロンプトに、そのモジュールの名前が表示される"
	]

makeModule2 :: Page
makeModule2 = pageTitle "モジュールを作る" :| [
	text "自分で作ったモジュールを",
	itext 4 "定義ファイルのなかで、使うことができる",
	text "ファイルother.hsを作成する",
	itext 4 "import Some",
	itext 4 "",
	itext 4 "f = fun . fun",
	text "対話環境で試してみよう",
	itext 4 "> :load other.hs",
	itext 4 "> f 3",
	itext 4 "81"
	]

main1 :: Page
main1 = pageTitle "実行可能ファイルの作りかた" :| [
	text "実行可能ファイルを作るには",
	itext 4 "動作で特別な変数mainを束縛する",
	text "つぎのようなファイルhello.hsを作る",
	itext 4 "main = putStrLn \"Hello, world!\"",
	text "つぎのようなコマンドを実行する",
	itext 4 "% stack ghc -- hello.hs -o hello",
	text "すると実行可能ファイルhelloが作成される",
	itext 4 "% ./hello",
	itext 4 "Hello, world!"
	]
