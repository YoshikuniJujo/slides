import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	otherLanguage, separate, replFunction, replFunction2,
	putStrFunction, putStrFunction2, oneAfterAnother, inputMachine,
	getLineFunction, inputToOutput, inputToOutput2,
	preDo, preDo2, doNotation,
	tryAddition, standalone, standalone2,
	returnFunction, returnFunction2,
	typing, typing2, typing3, typing4, typing5, typing6,
	doLet, doLet2
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン!" "4. IOモナド" :| []

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
	itext 4 "*Main Hndsn> 123",
	itext 4 "123",
	itext 4 "*Main Hndsn> putStrLn (show 123)",
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
	itext 4 "FalseまたはTrueのどっちかという情報を持つ",
	text "ユニット型はユニット値ひとつしか値を持たない",
	itext 4 "つまり、この型の値は情報を持たない"
	]

putStrFunction2 :: Page
putStrFunction2 = pageTitle "文字列を表示する機械" :| [
	text "文字列の表示を試してみよう",
	itext 4 "*Main Hndsn> putStrLn \"hello\"",
	itext 4 "hello",
	text "関数putStrLnに文字列\"hello\"が、あたえられ",
	itext 4 "かえされたIO ()型の機械を、対話環境が実行する"
	]

oneAfterAnother :: Page
oneAfterAnother = pageTitle "順に出力する" :| [
	text "部品となる入出力を組み合わせることができる",
	text "「これをして、つぎにそれをして」という",
	itext 4 "組み合わせには、演算子(>>)を使う",
	text "試してみよう",
	itext 4 "*Main Hndsn>",
	itext 4 "putStrLn \"hello\" >> putStrLn \"world\"",
	itext 4 "hello",
	itext 4 "world",
	text "入出力のうち、「出力」を組み合わせることができた",
	text "それでは、入力した値を出力するには、どうすればいい?"
	]

inputMachine :: Page
inputMachine = pageTitle "つぎの機械に値をわたす機械" :| [
	text "文字列を出力する機械の型を思い出してみよう",
	itext 4 "putStrLn \"hello\" :: IO ()",
	text "()型の値は情報を持たない",
	text "IO ()型の値は、つぎの機械にわたす値を持たない機械",
	text "この()型のところに、他の型をいれた型が作れる",
	itext 4 "IO String",
	itext 4 "IO Integer",
	itext 4 "IO Bool",
	text "つぎの機械に、文字列/整数値/真偽値をわたす機械",
	text "ここでは、ユーザのキー入力を1行、取得する機械を考える",
	itext 4 "getLine :: IO String"
	]

getLineFunction :: Page
getLineFunction = pageTitle "キー入力を1行、取得する" :| [
	text "ここで対話環境の機能について補足する",
	text "評価された値が「機械」だったとき",
	itext 4 "その機械を実行する",
	itext 4 "そして、その機械が()ではない値をわたす機械なら",
	itext 8 "わたされた値を表示する",
	text "試してみよう",
	itext 4 "*Main Hndsn> getLine",
	itext 4 "(fooと打ち込む)foo",
	itext 4 "\"foo\""
	]

inputToOutput :: Page
inputToOutput = pageTitle "打ち込んだ文字列をコンソールに書き出す" :| [
	text "ある機械から別の機械に値をわたすには",
	itext 4 "演算子(>>=)を使う",
	text "つぎの型を、みてみよう",
	itext 4 "String -> IO ()",
	text "これを「文字列をとって、機械をかえす関数」と考えた",
	text "ここでは、これ全体を「ひとつの機械」と考えよう",
	text "これは「文字列をわたされて、何もわたさない機械」",
	text "演算子(>>)と(>>=)の型を、みてみよう",
	itext 4 "(>>) :: IO a -> IO b -> IO b",
	itext 4 "(>>=) :: IO a -> (a -> IO b) -> IO b",
	text "のようになる(すこし、うそがあるが)"
	]

inputToOutput2 :: Page
inputToOutput2 = pageTitle "打ち込んだ文字列をコンソールに書き出す" :| [
	text "演算子(>>=)の型は、つぎのようになっている",
	itext 4 "(>>=) :: IO a -> (a -> IO b) -> IO b",
	text "型変数aに型Stringを、bに()をいれると",
	itext 4 "(>>=) ::",
	itext 8 "IO String -> (String -> IO ()) -> IO ()",
	text "関数getLineと関数putStrLnの型は、それぞれ",
	itext 4 "getLine :: IO String",
	itext 4 "putStrLn :: String -> IO ()",
	text "これらは、演算子(>>=)でつなげられる",
	itext 4 "*Main Hndsn> getLine >>= putStrLn",
	itext 4 "(foo)と入力",
	itext 4 "foo"
	]

preDo :: Page
preDo = pageTitle "読みやすい書きかた" :| [
	text "たとえば、入力してもらった数値を足し算するとき",
	text "つぎのような書きかたをすると、わかりやすい",
	itext 4 "% vim addition.hs",
	itext 4 "addition :: IO ()",
	itext 4 "addition =",
	itext 8 "putStrLn \"Please input two numbers:\" >>",
	itext 8 "getLine >>= \\x ->",
	itext 8 "getLine >>= \\y ->",
	itext 8 "putStrLn (show (read x + read y))",
	text "これは、getLineがわたす値でxを束縛して",
	itext 4 "ふたつめのgetLineがわたす値でyを束縛して...",
	text "のように読むことができる"
	]

preDo2 :: Page
preDo2 = pageTitle "読みやすい書きかた" :| [
	text "試してみよう",
	itext 4 "*Main Hndsn> :load addition.hs",
	itext 4 "*Main> addition",
	itext 4 "Please input two numbers:",
	itext 4 "(15と入力)15",
	itext 4 "(24と入力)24",
	itext 4 "39"
	]

doNotation :: Page
doNotation = pageTitle "構文糖" :| [
	text "Haskellには、さらに読みやすくする構文糖がある",
	text "do記法と呼ばれる",
	itext 4 "additionDo = do",
	itext 8 "putStrLn \"Please input two numbers:\"",
	itext 8 "x <- getLine",
	itext 8 "y <- getLine",
	itext 8 "putStrLn (show (read x + read y))",
	text "do記法は予約語doではじまり、演算子(>>)や(>>=)や",
	itext 4 "関数リテラルを機械的に置き換えている"
	]

tryAddition :: Page
tryAddition = pageTitle "加算を試してみる" :| [
	text "ここで定義した機械additionDoを試してみよう",
	itext 4 "*Main> :reload",
	itext 4 "*Main> additionDo",
	itext 4 "Please input two numbers:",
	itext 4 "(好きな数値を入力)35",
	itext 4 "(好きな数値を入力)42",
	itext 4 "77"
	]

standalone :: Page
standalone = pageTitle "実行可能ファイル" :| [
	text "そろそろ「対話環境で」ではなく独立した",
	itext 4 "実行可能ファイルを作りたくなってきたはず",
	text "実行可能ファイルにするためには",
	itext 4 "まず、変数mainを機械で束縛する",
	text "ここでは、変数additionDoをmainに置き換える",
	itext 0 "(実際には置き換えずみのファイルadditionMain.hsがある)",
	itext 4 "% vim additionMain.hs",
	itext 4 "main :: IO ()",
	itext 4 "main = do ...",
	text "このように置き換えよう"
	]

standalone2 :: Page
standalone2 = pageTitle "実行可能ファイル" :| [
	text "そのうえで、つぎのようにする",
	itext 4 "% stack ghc -- -fno-warn-tabs additionMain.hs \\",
	itext 8 "-o addition",
	text "-fno-warn-tabsはタブ文字に対する警告を表示しないため",
	text "作られた実行可能ファイルを試す",
	itext 4 "% ./addition",
	itext 4 "..."
	]

returnFunction :: Page
returnFunction = pageTitle "関数return" :| [
	text "打ち込んだ文字列を確認するメッセージを表示する",
	itext 4 "機械getLineWithMsgを考える",
	itext 4 "% vim withMsg.hs",
	itext 4 "getLineWithMsg :: IO String",
	itext 4 "getLineWithMsg = do",
	itext 8 "l <- getLine",
	itext 8 "putStrLn $ \"Your input: \" ++ l",
	itext 8 "return l",
	text "do記法で、つなげていけるのはIO ...型の機械だけ",
	itext 4 "(すこし、うそだけど...)",
	text "関数returnは、X型の値をIO X型の機械にする"
	]

returnFunction2 :: Page
returnFunction2 = pageTitle "関数return" :| [
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "*Main Hndsn> :load withMsg.hs",
	itext 4 "*Main> getLineWithMsg",
	itext 4 "(helloと入力)hello",
	itext 4 "Your input: hello",
	itext 4 "\"hello\""
	]

typing :: Page
typing = pageTitle "タイピングの練習" :| [
	text "タイピングの練習用のアプリケーションを作る",
	itext 4 "* ファイルから1行ずつ表示する",
	itext 4 "* その文字列をタイプする",
	itext 4 "* まちがっていたら再度タイプ",
	text "機械getArgs, 関数openFile, hIsEOF, hGetLineを使う",
	itext 4 "getArgs :: IO [String]",
	itext 4 "openFile :: String -> IO Handle",
	itext 4 "hIsEOF :: Handle -> IO Bool",
	itext 4 "hGetLine :: Handle -> IO String"
	]

typing2 :: Page
typing2 = pageTitle "タイピングの練習" :| [
	text "必要なモジュールを導入する",
	itext 4 "% vim typing.hs",
	itext 4 "import System.Environment (getArgs)",
	itext 4 "import System.IO (",
	itext 8 "Handle, IOMode(..),",
	itext 8 "openFile, hIsEOF, hGetLine )"
	]

typing3 :: Page
typing3 = pageTitle "タイピングの練習" :| [
	text "ここで関数をひとつ定義する",
	itext 4 "% vim typing.hs",
	itext 4 "doWhile_ :: IO Bool -> IO ()",
	itext 4 "doWhile_ act = do",
	itext 8 "b <- act",
	itext 8 "if b then doWhile_ act else return ()",
	text "機械actを引数としてとり、それを実行して",
	itext 4 "結果としてわたされる値がTrueならdoWhile_ actを",
	itext 4 "そうでなければreturn ()を実行する",
	text "そういう機械を作る関数",
	text "引数としてとった機械のわたす値がFalseになるまで",
	itext 4 "その機械の実行をくりかえす機械となる"
	]

typing4 :: Page
typing4 = pageTitle "タイピングの練習" :| [
	text "1行について実行する機械を定義する",
	itext 4 "% vim typing.hs",
	itext 4 "runLine :: Handle -> IO ()",
	itext 4 "runLine h = do",
	itext 8 "l0 <- hGetLine h",
	itext 8 "putStrLn l0",
	itext 8 "doWhile_ $ do",
	itext 12 "l1 <- getLine",
	itext 12 "return $ l1 /= l0",
	text "これは1行を表示して、そのあと",
	itext 4 "おなじ文字列が打ち込まれるまで、くりかえす機械"
	]

typing5 :: Page
typing5 = pageTitle "タイピングの練習" :| [
	text "機械mainを定義する",
	itext 4 "% vim typing.hs",
	itext 4 "main :: IO ()",
	itext 4 "main = do",
	itext 8 "fp : _ <- getArgs",
	itext 8 "h <- openFile fp ReadMode",
	itext 8 "doWhile_ $ do",
	itext 12 "e <- hIsEOF h",
	itext 12 "if e then return False else",
	itext 16 "runLine h >> return True",
	text "コマンドライン引数のひとつめで、変数fpを束縛し",
	itext 4 "それを開いて、ファイルの終わりになるまで",
	itext 4 "機械runLine hをくりかえす機械となる"
	]

typing6 :: Page
typing6 = pageTitle "タイピングの練習" :| [
	text "コンパイルして、試してみる",
	itext (- 0) "% stack ghc -- -fno-warn-tabs typing.hs -o typing",
	itext 0 "% ./typing some.txt",
	itext 0 "I love Haskell!",
	itext 0 "(入力する)I love Haskell!",
	itext 0 "I love functional programming!",
	itext 0 "(入力する)I love procedural programming!",
	itext 0 "(入力する)I love functional programming!"
	]

doLet :: Page
doLet = pageTitle "do-let構文" :| [
	text "便利な構文として「do記法のなかのlet構文」がある",
	text "do記法のなかで、ローカルな変数が定義できる",
	itext 4 "% vim doLet.hs",
	itext 4 "helloTo :: IO ()",
	itext 4 "helloTo = do",
	itext 8 "putStrLn \"May I ask your name?\"",
	itext 8 "n <- getLine",
	itext 8 "let",
	(>>) <$> backLine <*> itext 12 "name = \"Mr./Ms. \" ++ n",
	itext 8 "putStrLn $ \"Hello, \" ++ name ++ \"!\"",
	itext 8 "putStrLn",
	itext 12 "$ name ++ \", please be my friend.\""
	]

doLet2 :: Page
doLet2 = pageTitle "do-let構文" :| [
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "*Main Hndsn> :load doLet.hs",
	itext 4 "*Main> helloTo",
	itext 4 "May I ask your name?",
	itext 4 "(名前を入力)Yoshikuni Jujo",
	itext 4 "Hello, Mr./Ms. Yoshikuni Jujo!",
	itext 4 "Mr./Ms. Yoshikuni Jujo, please be my friend."
	]
