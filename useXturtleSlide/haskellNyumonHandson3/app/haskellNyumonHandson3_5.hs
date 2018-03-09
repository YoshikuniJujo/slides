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
	expressionCase1, expressionCase2, expressionCase3,
	expressionCase4, expressionCase5, expressionCase6,
	ioCalc1, ioCalc2, ioCalc3, ioCalc4, ioCalc5, ioCalc6, ioCalc7,
	standalone1, standalone2, summary
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
	text "「入出力」の「入力」のところはどうだろうか",
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

expressionCase2 :: Page
expressionCase2 = pageTitle "case式" :| [
	text "特定の人にだけ、ていねいにあいさつする関数",
	itext 4 "% vim case.hs",
	itext 4 "helloTo :: String -> String",
	itext 4 "helloTo n = case n of",
	itext 4 "        \"Yoshikuni\" -> \"Good morning, sir.\"",
	itext 4 "        _ -> \"Hello, \" ++ n ++ \"!\"",
	text "予約語caseとofのあいだに式を置く",
	text "その式の評価された結果を",
	itext 4 "予約語->の左側のパターンとマッチさせる",
	itext 4 "最初にマッチしたパターンの右側の式が全体の結果"
	]

expressionCase3 :: Page
expressionCase3 = pageTitle "case式" :| [
	text "試してみる",
	itext 4 "*Main> :load case.hs",
	itext 4 "*Main> helloTo \"Yoshikuni\"",
	itext 4 "\"Good morning, sir.\"",
	itext 4 "*Main> helloTo \"Ichiro\"",
	itext 4 "\"Hello, Ichiro!\"",
	text "Yoshikuniにだけ、ていねいにあいさつしている"
	]

expressionCase4 :: Page
expressionCase4 = pageTitle "case式" :| [
	text "ユーザのIDを調べる関数の例",
	itext 4 "% vim case.hs",
	itext 4 "users :: [(String, Int)]",
	itext 4 "users = [",
	itext 4 "        (\"Taro\", 3),",
	itext 4 "        (\"Saburo\", 9),",
	itext 4 "        (\"Keiko\", 5) ]",
	itext 4 "",
	itext 4 "getId :: String -> String",
	itext 4 "getId n = case lookup n users of",
	itext 4 "        Just i -> \"ID: \" ++ show i",
	itext 4 "        Nothing -> \"No such user\""
	]

expressionCase5 :: Page
expressionCase5 = pageTitle "case式" :| [
	text "関数lookupについて",
	text "型は、つぎのようになる",
	itext 4 "lookup :: a -> [(a, b)] -> Maybe b",
	text "タプルのリストを辞書として",
	itext 4 "タプルの第1要素で検索し",
	itext 4 "検索が成功すれば第2要素をJust値としてかえし",
	itext 4 "失敗すればNothing値をかえす",
	text "関数lookupの結果に対してcase式を使用",
	itext 4 "Just値とNothing値とで処理をわけている"
	]

expressionCase6 :: Page
expressionCase6 = pageTitle "case式" :| [
	text "試してみる",
	itext 4 "*Main> :reload",
	itext 4 "*Main> getId \"Keiko\"",
	itext 4 "\"ID: 5\"",
	itext 4 "*Main> getId \"Yoshio\"",
	itext 4 "\"No such user\""
	]

ioCalc1 :: Page
ioCalc1 = pageTitle "電卓" :| [
	text "さて、ここまで対話環境で試してきた電卓を",
	itext 4 "スタンドアロンなプログラムにしていこう",
	text "ターミナルに打ち込んだ式を評価して表示する",
	text "これを、くりかえすようにする"
	]

ioCalc2 :: Page
ioCalc2 = pageTitle "電卓" :| [
	text "まずは必要な関数などを導入する",
	text "ファイルcalc.hsの先頭に、つぎのように追加する",
	itext 4 "% vim calc.hs",
	itext 4 "import System.IO (hFlush, stdout)",
	itext 4 "import Data.Bool (bool)"
	]

ioCalc3 :: Page
ioCalc3 = pageTitle "電卓" :| [
	text "関数boolを試してみよう",
	itext 4 "*Main> :load calc.hs",
	itext 4 "*Main> bool \"else\" \"then\" False",
	itext 4 "\"else\"",
	itext 4 "*Main> bool \"else\" \"then\" True",
	itext 4 "\"then\"",
	itext 4 "*Main> bool \"odd\" \"even\" (even 8)",
	itext 4 "\"even\"",
	text "第3引数のブール値が値Falseなら第1引数の値を",
	itext 4 "値Trueなら第2引数の値をかえす"
	]

ioCalc4 :: Page
ioCalc4 = pageTitle "電卓" :| [
	text "つぎの「入出力」にブール値をわたす「入出力」を",
	itext 4 "引数として",
	itext 4 "その「入出力」をくりかえす「入出力」を作る関数",
	itext 4 "% vim calc.hs",
	itext 4 "doWhile_ :: IO Bool -> IO ()",
	itext 4 "doWhile_ act = do",
	itext 4 "        c <- act",
	itext 4 "        bool (return ()) (doWhile_ act) c",
	text "わたされるブール値で変数cを束縛し",
	itext 4 "そのブール値の値によって",
	itext 4 "値Falseならreturn ()とし",
	itext 4 "値TrueならdoWhile_ actを再帰的に呼び出す",
	text "return ()はユニット値をわたすだけで「なにもしない」"
	]

ioCalc5 :: Page
ioCalc5 = pageTitle "電卓" :| [
	itext (- 4) "電卓の動作を行う「入出力」で変数mainを束縛する",
	itext (- 4) "% vim calc.hs",
	itext (- 4) "main :: IO ()",
	itext (- 4) "main = doWhile_ $ do",
	itext (- 4) "        putStr \"> \"",
	itext (- 4) "        hFlush stdout",
	itext (- 4) "        l <- getLine",
	itext (- 4) "        case l of",
	itext (- 4) "                \":q\" -> return False",
	itext (- 4) "                _ -> do case calc l of",
	itext (- 4) "                                Just n -> print n",
	itext (- 4) "                                Nothing -> putStrLn \"parse error\"",
	itext (- 4) "                        return True"
	]

ioCalc6 :: Page
ioCalc6 = pageTitle "電卓" :| [
	text "doWhile_ $ doの演算子($)は",
	itext 4 "do以降の「入出力」が",
	itext 4 "関数doWhile_の引数であることをしめす",
	text "putStr \"> \"のあとにある",
	itext 4 "hFlush stdoutは、改行を待たずに表示するため",
	text "入出力getLineがわたす値lについて",
	itext 4 "\":q\"であればreturn Falseによって終了",
	itext 4 "そうでなければ関数calcで数式として評価",
	itext 4 "構文エラーかどうかで処理をわけ",
	itext 4 "return Trueによって、くりかえす"
	]

ioCalc7 :: Page
ioCalc7 = pageTitle "電卓" :| [
	text "対話環境で試してみよう",
	itext 4 "*Main> :reload",
	itext 4 "*Main> main",
	itext 4 "> 3+5",
	itext 4 "8",
	itext 4 "> (11-9)*2",
	itext 4 "4",
	itext 4 "> (21*3)/(7+4)",
	itext 4 "5",
	itext 4 "> :q",
	itext 4 "*Main>"
	]

standalone1 :: Page
standalone1 = pageTitle "電卓" :| [
	text "Haskellで実行可能ファイルを作るには",
	itext 4 "実行したい入出力で特別な変数mainを束縛する",
	text "ファイルcalc.hsでは、すでに変数mainは定義ずみなので",
	itext 4 "つぎのようにして、実行可能ファイルを作る",
	itext 4 "% stack ghc -- calc.hs -o calc",
	text "タブ文字に対する警告を消したければ",
	itext 4 "% stack ghc -- calc.hs -o calc -fno-warn-tabs"
	]

standalone2 :: Page
standalone2 = pageTitle "電卓" :| [
	text "試してみよう",
	itext 4 "% ./calc",
	itext 4 "> 3+5",
	itext 4 "8",
	itext 4 "> (3+5)*9",
	itext 4 "72",
	itext 4 "> ((3+5)*9)/(3+4)",
	itext 4 "10",
	itext 4 "> :q"
	]

summary :: Page
summary = pageTitle "まとめ" :| [
	text "打ち込んだ式を評価している電卓を作った",
	text "作りながら、そのなかで使われている構文や技法を学んだ",
	text "",
	text "Slackやってます",
	itext 4 "https://haskelldojo.slack.com",
	text "登録は以下から",
	itext 4 "http://haskelldojo.herokuapp.com",
	text "",
	text "メールでの質問は以下まで",
	itext 4 "funpaala@gmail.com"
	]
