import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	prelude,
	calculatorSpecification,
	parser, parser2, parser3, parser4,
	parser5, parser6, parser7, parser8,
	parser9, parser10, parser11, parser12, parser13,
	calculator, calculator2, calculator3, calculator4,
	calculator5, calculator6, calculator7, calculator8,
	doWhileFunction, calculatorMain, systemIOModule,
	tryCalculator,
	guess, doWhileFunctionGuess,
	getRandomFunction, hFlushFunction, readMaybeFunction,
	guessImports, guessMain, guessMain2, compileTryGuess, tryGuess
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン!" "5. 作ってみよう" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "数十行の小さなアプリケーションを作ってみる",
	itext 4 "ひとつめは電卓",
	itext 4 "もうひとつは、数当てゲーム"
	]

calculatorSpecification :: Page
calculatorSpecification = pageTitle "電卓" :| [
	text "電卓の仕様はつぎのようにする",
	itext 4 "* 整数の四則演算をあつかう",
	itext 4 "* 式を入力すると答えを表示する",
	itext 4 "* 式には空白文字はなく、丸括弧を明示する",
	itext 4 "* 構文解析の失敗にはエラーメッセージを出力",
	itext 4 "* 正確にquitまたはexitと入力すると終了する",
	text "まずはパーサを作っていく"
	]

parser :: Page
parser = pageTitle "パーサ" :| [
	text "一般的なパーサの組み立てに使える関数群を作る",
	text "まずは、パーサの型を作ろう",
	text "文字列を取って、何らかの値を返すことを考えると",
	itext 4 "String -> a",
	text "パーサをつなげていくことを考えると",
	itext 4 "「残りの文字列」が必要になるので",
	itext 4 "String -> (a, String)",
	text "パースの結果に複数の候補が必要になることがあるので",
	itext 4 "String -> [(a, String)]",
	text "これを定義する",
	itext 4 "% vim calculator.hs",
	itext 4 "type Parse a = String -> [(a, String)]"
	]

parser2 :: Page
parser2 = pageTitle "パーサ" :| [
	text "何に使うのか、今は疑問に思うと思うが、つぎを考える",
	itext 4 "「文字列を消費せず、何らかの値をかえすパーサ」",
	text "いちばん単純なパーサである、それを作る関数",
	itext 4 "% vim calculator.hs",
	itext 4 "succeed :: a -> Parse a",
	itext 4 "succeed v inp = [(v, inp)]",
	text "「パーサ」と呼んでいるものは、単数をひとつとる関数",
	text "引数をひとつとり「パーサ」をかえす関数は",
	itext 4 "引数をふたつとる関数とおなじこと",
	text "つぎのように書いてもいい",
	itext 4 "succeed v = \\inp -> [(v, inp)]"
	]

parser3 :: Page
parser3 = pageTitle "パーサ" :| [
	text "つぎの、ふたつは、おなじもの",
	itext 4 "「引数をふたつとる関数」",
	itext 4 "「引数をひとつとり、関数をかえす関数」",
	text "関数succeedを試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "Prelude> succeed 123 \"hello\"",
	itext 4 "(123,\"hello\")",
	text "これは「文字列を消費せず整数123をかえすパーサ」で",
	itext 4 "文字列\"hello\"を解析したということ",
	text "結果として整数123がかえり",
	itext 4 "つぎのパーサにわたすのは文字列\"hello\""
	]

parser4 :: Page
parser4 = pageTitle "パーサ" :| [
	text "条件を満たす1文字をパースする関数",
	itext 4 "% vim calculator.hs",
	itext 4 "check :: (Char -> Bool) -> Parse Char",
	itext 4 "check p (c : cs) | p c = [(c, cs)]",
	itext 4 "check _ _ = []",
	text "試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> :module + Data.Char",
	itext 4 "*Main Data.Char> check isDigit \"123\"",
	itext 4 "[('1',\"23\")]",
	itext 4 "*Main Data.Char> check isDigit \"abc\"",
	itext 4 "[]"
	]

parser5 :: Page
parser5 = pageTitle "パーサ" :| [
	text "特定の1文字をパースする関数",
	text "これは、関数checkの条件を「その文字と等しい」とする",
	itext 4 "% vim calculator.hs",
	itext 4 "char :: Char -> Parse Char",
	itext 4 "char c0 = check $ \\c1 -> c1 == c0",
	text "試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> char 'a' \"abc\"",
	itext 4 "[('a',\"bc\")]",
	itext 4 "*Main> char 'a' \"123\"",
	itext 4 "[]"
	]

parser6 :: Page
parser6 = pageTitle "パーサ" :| [
	text "ふたつのパーサの、それぞれを候補とするパーサを作成",
	itext 4 "% vim calculator.hs",
	itext 4 "alt :: Parse a -> Parse a -> Parse a",
	itext 4 "(p1 `alt` p2) inp = p1 inp ++ p2 inp",
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> :module + Data.char",
	itext 4 "*Main> (check isDigit `alt` char 'a') \"123\"",
	itext 4 "[('1',\"23\")]",
	itext 4 "*Main> (check isDigit `alt` char 'a') \"abc\"",
	itext 4 "[('a',\"bc\")]"
	]

parser7 :: Page
parser7 = pageTitle "パーサ" :| [
	text "解析の結果に関数を適用する関数",
	itext 4 "% vim calculator.hs",
	itext 4 "build :: Parse a -> (a -> b) -> Parse b",
	itext 4 "build p f inp =",
	itext 8 "[ (f x, r) | (x, r) <- p inp ]",
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> :module + Data.Char",
	itext 4 "*Main Data.Char>",
	itext 4 "(check isDigit `build` digitToInt) \"123\"",
	itext 4 "[(1,\"23\")]"
	]

parser8 :: Page
parser8 = pageTitle "パーサ" :| [
	text "「...のつぎに...」のようにパーサをつなげる",
	itext 4 "% vim calculator.hs",
	itext 4 "(>@>) :: Parse a -> Parse b -> Parse (a, b)",
	itext 4 "(p1 >@> p2) inp = [ ((x, y), r') |",
	itext 8 "(x, r) <- p1 inp, (y, r') <- p2 r ]",
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> :module + Data.Char",
	itext 4 "*Main> (char 'a' >@> check isDigit) \"a123\"",
	itext 4 "[(('a','1'),\"23\")]"
	]

parser9 :: Page
parser9 = pageTitle "パーサ" :| [
	text "後ろのパーサの結果を無視する関数",
	itext 4 "% vim calculator.hs",
	itext 4 "(>@) :: Parse a -> Parse b -> Parse a",
	itext 4 "p1 >@ p2 = (p1 >@> p2) `build` fst",
	text "前のパーサの結果を無視する関数",
	itext 4 "% vim calculator.hs",
	itext 4 "(@>) :: Parse a -> Parse b -> Parse b",
	itext 4 "p1 @> p2 = (p1 >@> p2) `build` snd"
	]

parser10 :: Page
parser10 = pageTitle "パーサ" :| [
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> :module + Data.Char",
	itext 4 "*Main Data.Char>",
	itext 4 "(char 'a' >@ check isDigit) \"a123\"",
	itext 4 "[('a',\"23\")]",
	itext 4 "*Main Data.Char>",
	itext 4 "(char 'a' @> check isDigit) \"a123\"",
	itext 4 "[('1',\"23\")]"
	]

parser11 :: Page
parser11 = pageTitle "パーサ" :| [
	text "入力の終わりを検出する",
	itext 4 "% vim calculator.hs",
	itext 4 "eof :: Parse ()",
	itext 4 "eof \"\" = [((), \"\")]",
	itext 4 "eof _ = []",
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> (char 'a' >@ eof) \"a123\"",
	itext 4 "*Main> []",
	itext 4 "*Main> (char 'a' >@ eof) \"a\"",
	itext 4 "*Main> [('a',\"\")]"
	]

parser12 :: Page
parser12 = pageTitle "パーサ" :| [
	text "おなじパーサを何回も適用してリストを作る",
	itext 4 "% vim calculator.hs",
	itext 4 "list, list1 :: Parse a -> Parse [a]",
	itext 4 "list p = succeed [] `alt` list1 p",
	itext 4 "list1 p = (p >@> list p) `build`",
	itext 8 "(\\(x, xs) -> x : xs)",
	text "考えかたは、つぎのようになる",
	text "0回をゆるすリストをかえすには",
	itext 4 "1回以上のリストに0回のくりかえしの候補を追加",
	text "1回以上のリストについては",
	itext 4 "0回をゆるすリストの前に、1回ぶん追加する"
	]

parser13 :: Page
parser13 = pageTitle "パーサ" :| [
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> :module + Data.Char",
	itext 4 "*Main Data.Char> list (check isDigit) \"123\"",
	itext 4 "[(\"\",\"123\"),(\"1\",\"23\"),(\"12\",\"3\"),(\"123\",\"\")]",
	itext 4 "*Main Data.Char> list1 (check isDigit) \"123\"",
	itext 4 "[(\"1\",\"23\"),(\"12\",\"3\"),(\"123\",\"\")]"
	]

calculator :: Page
calculator = pageTitle "式のパーサ" :| [
	text "ここまでで、一般的なパーサを作成する仕組みができた",
	text "この「仕組み」を使って、式を解析するパーサを作っていく",
	text "まずは数値を解析するパーサを作る",
	itext 4 "% vim calculator.hs",
	itext 4 "number :: Parse Integer",
	itext 4 "number = list1 (check isDigit) `build` read",
	text "モジュールData.Charの関数isDigitを使うので、先頭に",
	itext 4 "% vim calculator.hs",
	itext 4 "import Data.Char (isDigit)"
	]

calculator2 :: Page
calculator2 = pageTitle "式のパーサ" :| [
	text "試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> number \"123\"",
	itext 4 "[(1,\"23\"),(12,\"3\"),(123,\"\")]",
	itext 4 "*Main> number >@ eof $ \"123\"",
	itext 4 "[(123,\"\")]",
	itext 4 "*Main> map fst . (number >@ eof) $ \"123\"",
	itext 4 "[123]",
	itext 4 "*Main> :load + Data.Maybe",
	itext 4 "*Main Data.Maybe>",
	itext 4 "listToMaybe . map fst . (number >@ eof) $ \"123\"",
	itext 4 "Just 123"
	]

calculator3 :: Page
calculator3 = pageTitle "式のパーサ" :| [
	text "対話環境で、みたように",
	itext 4 "パーサをそのまま適用するよりも",
	itext 4 "あるていど、結果を整理したほうがわかりやすい",
	text "結果を整理された形で取得する関数",
	itext 4 "% vim calculator.hs",
	itext 4 "parse :: Parse a -> Streing -> Maybe a",
	itext 4 "parse p = listToMaybe . map fst . (p >@ eof)",
	text "モジュールData.Maybeの関数listToMaybeが必要なので",
	itext 4 "ファイルの先頭に、つぎのように追加する",
	itext 4 "% vim calculator.hs",
	itext 4 "import Data.Maybe (listToMaybe)"
	]

calculator4 :: Page
calculator4 = pageTitle "式のパーサ" :| [
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> parse number \"123\"",
	itext 4 "Just 123"
	]

calculator5 :: Page
calculator5 = pageTitle "式のパーサ" :| [
	text "演算子をパースするパーサを作る",
	text "まずは「演算子」の型を定義する",
	itext 4 "% vim calculator.hs",
	itext 4 "type Op = Integer -> Integer -> Integer",
	text "演算子をパースする関数を定義する",
	itext 4 "% vim calculator.hs",
	itext 4 "op, ad, sb, ml, dv :: Parse Op",
	itext 4 "op = ad `alt` sb `alt` ml `alt` dv",
	itext 4 "ad = char '+' `build` const (+)",
	itext 4 "sb = char '-' `build` const (-)",
	itext 4 "ml = char '*' `build` const (*)",
	itext 4 "dv = char '/' `build` const div"
	]

calculator6 :: Page
calculator6 = pageTitle "式のパーサ" :| [
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> Just o = parse op \"+\"",
	itext 4 "*Main> o 3 4",
	itext 4 "7",
	itext 4 "*Main> Just o = parse op \"/\"",
	itext 4 "*Main> o 125 4",
	itext 4 "31"
	]

calculator7 :: Page
calculator7 = pageTitle "式のパーサ" :| [
	text "数値のパーサと演算子のパーサとを作った",
	text "いよいよ「式」のパーサを作る",
	text "ここで「項」という単位を導入する",
	itext 4 "式は、ふたつの項を演算子でつないだもの",
	itext 4 "項は、整数値または式を丸括弧でかこったもの",
	text "このように定義すれば良い",
	itext 4 "% vim calculator.hs",
	itext 4 "expr, term :: Parse Integer",
	itext 4 "expr = (term >@> op >@> term) `build`",
	itext 8 "\\((x, o), y) -> x `o` y",
	itext 4 "term = number `alt`",
	itext 8 "(char '(' @> expr >@ char ')')"
	]

calculator8 :: Page
calculator8 = pageTitle "式のパーサ" :| [
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load calculator.hs",
	itext 4 "*Main> parse expr \"3+(2*5)\"",
	itext 4 "Just 13",
	itext 4 "*Main> parse expr \"(3+2)*(4+5)\"",
	itext 4 "Just 45"
	]

doWhileFunction :: Page
doWhileFunction = pageTitle "入出力のくりかえし" :| [
	text "「入出力をくりかえす」という「わくぐみ」",
	itext 4 "% vim calculator.hs",
	itext 4 "doWhile_ :: IO Bool -> IO ()",
	itext 4 "doWhile_ act = do",
	itext 8 "c <- act",
	itext 8 "if c then doWhile_ act else return ()",
	text "つぎに、関数mainを定義する"
	]

calculatorMain :: Page
calculatorMain = ((>>) <$> backLine <*> itext (- 4)  "main :: IO ()") :| [
--	(>>) <$> backLine <*> itext 4 "main :: IO ()",
	itext (- 4) "main = doWhile_ $ do",
	itext 0 "putStr \"> \"",
	itext 0 "hFlush stdout",
	itext 0 "l <- getLine",
	itext 0 "case l of",
	itext 4 "\"quit\" -> return False" ,
	itext 4 "\"exit\" -> return False" ,
	itext 4 "_ -> do",
	itext 8 "let",
	(>>) <$> backLine <*> itext 12 "me = parse expr l",
	itext 12 "rslt = case me of",
	itext 16 "Just n -> show n",
	itext 16 "Nothing -> \"parse error\"",
	itext 8 "putStrLn rslt",
	itext 8 "return True"
	]

systemIOModule :: Page
systemIOModule = pageTitle "関数hFlush" :| [
	text "関数hFlushとファイルハンドルstdoutが必要なので",
	itext 4 "ファイルの先頭に、つぎのように追加",
	itext 4 "% vim calculator.hs",
	itext 4 "import System.IO (hFlush, stdout)"
	]

tryCalculator :: Page
tryCalculator = pageTitle "コンパイル、実行" :| [
	text "コンパイルする",
	itext (- 4) "% stack ghc -- -fno-warn-tabs calculator.hs -o calculator",
	text "これで実行可能ファイルcalculatorができた",
	itext 4 "% ./calculator",
	itext 4 "> (3+4)*2",
	itext 4 "14",
	itext 4 "> oops!",
	itext 4 "parse error",
	itext 4 "> exit"
	]

guess :: Page
guess = pageTitle "数当て" :| [
	text "もうひとつ、コードの例を挙げる",
	text "こんどは、もうすこし短い例",
	text "定番の数当てゲームの例だ",
	itext 4 "コンピュータが1から100までの数と選ぶ",
	itext 4 "ユーザはどの数かを予想して打ち込む",
	itext 4 "予想した数が当たれば、ユーザの勝ち",
	itext 4 "当たらなければ",
	itext 8 "「小さすぎる」や「大きすぎる」を知らせる"
	]

doWhileFunctionGuess :: Page
doWhileFunctionGuess = pageTitle "入出力をくりかえす" :| [
	text "まずは、さっきと、おなじ関数doWhile_を定義する",
	itext 4 "% vim kazuate.hs",
	itext 4 "doWhile_ :: IO Bool -> IO ()",
	itext 4 "doWhile_ act = do",
	itext 8 "c <- act",
	itext 8 "if c then doWhile_ act else return ()"
	]

getRandomFunction :: Page
getRandomFunction = pageTitle "乱数を取得する" :| [
	text "乱数を取得するのも、わりと奥が深いのだけど",
	text "ここでは、ひとつの関数を紹介するだけ",
	text "つぎのような型をもつ(と考える)",
	itext 4 "randomRIO :: (Integer, Integer) -> IO Integer",
	text "試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :module System.Random",
	itext 4 "Prelude System.Random> randomRIO (1, 100)",
	itext 4 "91",
	itext 4 "Prelude System.Random> randomRIO (1, 100)",
	itext 4 "22",
	itext 4 "Prelude System.Random> randomRIO (1, 100)",
	itext 4 "17"
	]

hFlushFunction :: Page
hFlushFunction = pageTitle "出力をフラッシュする" :| [
	text "多くのシステムで出力は行単位",
	text "つまり、プロンプトを表示しようとしても",
	itext 4 "改行がくるまで表示されない",
	text "改行なしで表示したいときは",
	itext 4 "hFlush stdoutのようにする",
	text "試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :module System.IO",
	itext 4 "(省略)> putStr \"hello\" >> hFlush stdout",
	itext 4 "helloPrelude System.IO>",
	text "改行なしで表示される",
	text "ただし、対話環境ではフラッシュしなくても、おなじこと"
	]

readMaybeFunction :: Page
readMaybeFunction = pageTitle "文字列を値に変換" :| [
	text "文字列を値に変換する関数readを使ってきた",
	text "しかし、この関数readは「危険な関数」だ",
	itext 4 "% stack ghci",
	itext 4 "Prelude> read \"hoge\" :: Integer",
	itext 4 "*** Exception: Prelude.read: no parse",
	text "関数readMaybeを使おう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :module Text.Read",
	itext 4 "(省略)> readMaybe \"hoge\" :: Maybe Integer",
	itext 4 "Nothing",
	itext 4 "(省略)> readMaybe \"123\" :: Maybe Integer",
	itext 4 "Just 123"
	]

guessImports :: Page
guessImports = pageTitle "モジュールの導入" :| [
	text "必要な関数を導入する",
	text "ファイルの先頭に、つぎのように追加する",
	itext 4 "% vim kazuate.hs",
	itext 4 "import System.IO (stdout, hFlush)",
	itext 4 "import System.Random (randomRIO)",
	itext 4 "import Text.Read (readMaybe)",
	text "つぎのように、関数mainを定義する",
	itext 4 "% vim kazuate.hs"
	]

guessMain :: Page
guessMain = ((>>) <$> backLine <*> itext (- 4) "main :: IO ()") :| [
	itext (- 4) "main = do",
	text "n0 <- randomRIO (1, 100 :: Integer)",
	text "putStr \"Guess! (1..100): \"",
	text "hFlush stdout",
	text "doWhile_ $ do",
	itext 4 "l <- getLine",
	itext 4 "case readMaybe l of",
	itext 8 "Just n",
	(>>) <$> backLine <*> itext 12 "| n == n0 -> do",
	itext 16 "putStrLn \"You Win!\"",
	itext 16 "return False",
	itext 12 "| n < n0 -> do",
	itext 16 "putStrLn $ \"Your guess, \" ++",
	itext 20 "show n ++ \", is too low.\"",
	itext 16 "return True",
	itext 8 "(しばらく待つ、それから説明)"
	]

guessMain2 :: Page
guessMain2 = ((>>) <$> backLine <*> itext 12 "| n > n0 -> do") :| [
	itext 16 "putStrLn $ \"Your guess, \" ++",
	itext 20 "show n ++ \", is too high.\"",
	itext 16 "return True",
	itext 8 "Nothing -> do",
	itext 12 "putStr \"Oops! Guess again! (1..100): \"",
	itext 12 "hFlush stdout",
	itext 12 "return True"
	]

compileTryGuess :: Page
compileTryGuess = pageTitle "コンパイルして試す" :| [
	text "コンパイルする",
	itext 0 "% stack ghc -- -fno-warn-tabs kazuate.hs -o kazuate",
	text "試してみよう",
	itext 4 "% ./kazuate",
	itext 4 "Guess! (1..100): (数値を入力)50",
	itext 4 "Your guess, 50, is too low.",
	itext 4 "(数値を入力)75",
	itext 4 "Your guess, 75, is too high.",
	itext 4 "(数値を入力)62",
	itext 4 "Your guess, 62, is too low.",
	itext 4 "(数値を入力)68",
	itext 4 "Your guess, 68, is too low." ]

tryGuess :: Page
tryGuess = pageTitle "試す (続き)" :| [
	itext 4 "(数値を入力)71",
	itext 4 "Your guess, 71, is too high.",
	itext 4 "(数値を入力)69",
	itext 4 "Your guess, 69, is too low.",
	itext 4 "(数値を入力)70",
	itext 4 "You Win!"
	]
