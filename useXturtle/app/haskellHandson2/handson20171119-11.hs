import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude, module1, dummyMain1, point1, key1, display1,
	noBuffering1, loop1, errorCheck1, step1, main1, compileRun1
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン! #2" "11. 迷路ゲーム(2)" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "フィールドの用意と",
	itext 4 "キャラクターを動かすインターフェースができた",
	text "これらを使って、実際にゲームを動かしていく"
	]

module1 :: Page
module1 = pageTitle "モジュールの導入" :| [
	text "ファイルmaze.hsを、つぎのように用意する",
	itext 4 "import Data.Bool",
	itext 4 "import Data.Char",
	itext 4 "import System.IO",
	itext 4 "import System.Environment",
	itext 4 "",
	itext 4 "import Field",
	text "必要なモジュールを導入している"
	]

dummyMain1 :: Page
dummyMain1 = pageTitle "関数main" :| [
	text "仮の関数mainを用意しておく",
	itext 4 "main = do",
	itext 4 "        putStrLn \"dummy\"",
	text "コンパイルしておこう",
	itext 4 "% stack ghc -- -fno-warn-tabs maze.hs -o maze",
	itext 4 "% ./maze",
	itext 4 "dummy"
	]

point1 :: Page
point1 = pageTitle "はじめのポイント" :| [
	text "100ポイントからはじめる",
	text "ポイントの初期値point0を定義する",
	itext 4 "point0 = 100"
	]

key1 :: Page
key1 = pageTitle "キーの設定" :| [
	text "キーと動きかたを関連づける関数moveを定義する",
	itext 4 "move c = case c of",
	itext 4 "        'h' -> left",
	itext 4 "        'j' -> down",
	itext 4 "        'k' -> up",
	itext 4 "        'l' -> right",
	itext 4 "        'H' -> leftf",
	itext 4 "        'J' -> downf",
	itext 4 "        'K' -> upf",
	itext 4 "        'L' -> rightf",
	itext 4 "        _ -> \\f -> f",
	text "大文字ならすりぬける",
	text "設定されていないキーでは、動かさない"
	]

display1 :: Page
display1 = pageTitle "ゲーム画面の表示" :| [
	text "ゲーム画面を表示する関数displayを定義",
	itext 4 "display p f = do",
	itext 4 "        putStrLn \"\"",
	itext 4 "        print p",
	itext 4 "        putField f",
	text "このあたりでコンパイルしてエラーをチェックする",
	itext 4 "% stack ghc -- -fno-warn-tabs maze.hs -o maze",
	itext 4 "./maze",
	itext 4 "dummy"
	]

noBuffering1 :: Page
noBuffering1 = pageTitle "バッファリング" :| [
	text "バッファリングを一時的に無効にする関数noBuffering",
	itext 4 "noBuffering act = do",
	itext 4 "        bi <- hGetBuffering stdin",
	itext 4 "        hSetBuffering stdin NoBuffering",
	itext 4 "        act",
	itext 4 "        hSetBuffering stdin bi",
	text "まずは、「現在のバッファリングモード」を取得する",
	text "それから、バッファリングを無効にしてから",
	text "引数で取った動作を実行し",
	text "バッファリングモードをもとにもどす"
	]

loop1 :: Page
loop1 = pageTitle "ループ" :| [
	text "「状態を更新しながら動作をくりかえす」関数loopを定義",
	itext 4 "loop s act = do",
	itext 4 "        ms' <- act s",
	itext 4 "        case ms' of",
	itext 4 "                Just s' -> loop s' act",
	itext 4 "                Nothing -> return ()",
	text "引数actで受け取った動作を実行する",
	text "その動作の結果はMaybe値ms'となる",
	text "ms'がJust値であるなら、なかみの「新しい状態」で",
	itext 4 "くりかえす(loop s' act)",
	text "ms'がNothing値だったら終了(return ())"
	]

errorCheck1 :: Page
errorCheck1 = pageTitle "コンパイルエラーのチェック" :| [
	text "関数mainで表示する文字を変更する",
	itext 4 "main = do",
	itext 4 "        putStrLn \"dummy 001\"",
	text "コンパイルしてエラーをチェックする",
	itext 4 "% stack ghc -- -fno-warn-tabs maze.hs -o maze",
	itext 4 "% ./maze",
	itext 4 "dummy 001",
	text "つぎに、キー入力したときの",
	itext 4 "ひとつのステップをあらわす関数stepを定義する"
	]

step1 :: Page
step1 = pageTitle "ひとつのステップ" :| [
	(>>)	<$> backLine
		<*> itext (- 4) "step c p f = do",
	itext (- 4) "        display p' f'",
	itext (- 4) "        case (goal f', p' <= 0) of",
	itext (- 4) "                (_, True) -> do",
	itext (- 4) "                        putStrLn \"YOU LOSE!\"",
	itext (- 4) "                        return Nothing",
	itext (- 4) "                (True, False) -> do",
	itext (- 4) "                        putStrLn \"YOU WIN!\"",
	itext (- 4) "                        return Noting",
	itext (- 4) "                (False, False) -> return $ Just (p', f')",
	itext (- 4) "        where",
	itext (- 4) "        p' = bool p (p - 10) (isUpper c)",
	itext (- 4) "        f' = move c f"
	]

main1 :: Page
main1 = pageTitle "関数main" :| [
	itext (- 4) "関数mainを定義する",
	itext (- 4) "main = do",
	itext (- 4) "        n : _ <- getArgs",
	itext (- 4) "        let f0 = field $ read n",
	itext (- 4) "        display point0 f0",
	itext (- 4) "        noBuffering . loop (point0, f0) $ \\(p, f) -> do",
	itext (- 4) "                c <- getChar",
	itext (- 4) "                case c of",
	itext (- 4) "                        'q' -> return Nothing",
	itext (- 4) "                        _ -> step c p f"
	]

compileRun1 :: Page
compileRun1 = pageTitle "コンパイルして、実行する" :| [
	text "仮の関数mainは消しておく",
	text "コンパイルして、実行する",
	text "コマンドライン引数にあたえる数によって",
	itext 4 "異なるフィールドが選べる",
	itext 4 "% stack ghc -- -fno-warn-tabs maze.hs -o maze",
	itext 4 "% ./maze 8"
	]
