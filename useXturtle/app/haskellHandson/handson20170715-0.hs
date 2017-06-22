import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	greeting, selfIntroduction, installStack, startup, input,
	calc, useIt, history, forcedTermination, showType,
	fruits, reload,
	simpleFunction, functionLiteral, operatorFunction,
	typeDeclaration, typeDeclaration2, numberTypes,
	typeAnnotation,
	boolValue, maybeValue,
	tuple, patternMatch, patternMatch2, patternMatch3,
	wildCard, atPattern,
	guardSyntax, guardSyntax2, ifFormula, caseFormula,
	generics, typeSynonym, typeSynonym2,
	importSyntax, comment, comment2, epilogue
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン!" "0. 文法等おさらい" :| []

greeting :: Page
greeting = pageTitle "ごあいさつ" :| [
	text "お集まりいただき、ありがとうございます",
	(>>)
		<$> writeImageCenter
			(515 * 22 / 60, 654 * 22 / 60, "images/cover.png")
		<*> replicateM_ 10 . nextLine,
	text "「Haskell 教養としての関数型プログラミング」の著者",
	itext 4 "です"
	]

selfIntroduction :: Page
selfIntroduction = pageTitle "自己紹介" :| [
	text "この人は、こういう人",
	itext 4 "OS: Gentoo on KVM on Gentoo",
	itext 4 "言語: 日本語、Haskell",
	itext 4 "エディタ: Vim",
	itext 4 "日本語入力: TUT-code(漢字直接入力)",
	itext 4 "GUI: Xmonad",
	itext 4 "ターミナルエキュレータ: rxvt-unicode",
	itext 4 "仮想端末: Tmux",
	itext 4 "シェル: zsh",
	itext 4 "ブラウザ: Firefox + Vimperator",
	itext 4 "メールソフト: Mutt",
	itext 4 "キーボード: HHKB"
	]

installStack :: Page
installStack = pageTitle "Stackある?" :| [
	text "みなさま、もちろん処理系はインストールしてありますね!",
	text "対話環境やコンパイラを導入しないと",
	itext 4 "今日1日、指をくわえて見ていることになります",
	text "まにあうかはわかりませんが、つぎのアドレスを参考に",
	itext 4 "がんばってインストールしてみてください",
	itext 4 "「ハンズオン!」事前資料 - 2/3",
	itext 4 "https://goo.gl/kqh2TB",
	text "さきに進ませていただきます",
	text "まずは、Stackのバージョンを確認してみましょう",
	itext 4 "% stack --version",
	itext 4 "Version 1.3.2, Git ...",
	text "僕の環境では、こうなります。",
	text "みなさんの環境は?あまり古いと動かないかも、です"
	]

startup :: Page
startup = pageTitle "対話環境の起動と終了" :| [
	text "事前資料の内容を、もういちど、おさらいしましょう",
	text "まずは、対話環境の起動と終了です",
	itext 4 "% stack ghci",
	itext 4 "Prelude>",
	text "新しい言語を学ぶときの",
	itext 4 "一番はじめの壁は「インストール」かもしれません",
	text "対話環境は立ち上がったでしょうか",
	text "ここまで、できれば最初の壁は、こえたことになります",
	text "さて、ソフトを立ち上げたときに、はじめに知りたいのは",
	itext 4 "僕だったら、その終わらせかたです",
	text "終わらせかたを知らないと、不安になります",
	itext 4 "Prelude> :quit"
	]

input :: Page
input = pageTitle "値や式の打ちこみ" :| [
	text "対話環境に、いろいろな値を打ちこんでみます",
	itext 4 "% stack ghci",
	itext 4 "Prelude> 4492",
	itext 4 "4492",
	itext 4 "Prelude> 'c'",
	itext 4 "'c'",
	itext 4 "Prelude> pi",
	itext 4 "3.141592653589793",
	text "整数や文字はリテラルです。そのまま表示されます",
	text "piは変数です。それが束縛されている値が表示されます"
	]

calc :: Page
calc = pageTitle "電卓" :| [
	text "計算もできます",
	itext 4 "Prelude> 2 + 3",
	itext 4 "5",
	itext 4 "Prelude> 3 * 10 + 5 * 7",
	itext 4 "65",
	itext 4 "Prelude> 2 ^ 8",
	itext 4 "256",
	itext 4 "Prelude> 3 + 4 - 5",
	itext 4 "2",
	text "「Haskell 電卓としての関数型プログラミング」",
	itext 4 "です"
	]

useIt :: Page
useIt = pageTitle "変数it" :| [
	text "計算の結果を、つぎの計算で使いたいとします",
	itext 4 "Prelude> 123456789 * 123456789",
	itext 4 "1524159121932621",
	text "これを、もう1回、打ちこむのはめんどくさいですね",
	text "変数itを使いましょう",
	itext 4 "Prelude> it * 123456789",
	itext 4 "188167791118860863013969",
	text "対話環境は評価した値を変数itに束縛しておいてくれます"
	]

history :: Page
history = pageTitle "履歴" :| [
	text "対話環境を快適に使うには、履歴機能もかかせません",
	text "以下を順に打ちこんでください",
	itext 4 "Prelude> 12345 * 6789",
	itext 4 "Prelude> \"Haskell Language\"",
	itext 4 "Prelude> pi",
	text "上矢印キーを3回、下矢印キーを1回、押してください",
	itext 4 "Prelude> \"Haskell Language\"",
	text "左矢印キーを1回、バックスペースキーを8回押します",
	text "Brooks Curryと打ちこみ、エンターキーを押します",
	itext 4 "Prelude> \"Haskell Brooks Curry\"",
	itext 4 "\"Haskell Brooks Curry\""
	]

forcedTermination :: Page
forcedTermination = pageTitle "強制終了" :| [
	text "対話環境に、つぎのように打ち込んでください",
	itext 4 "Prelude> repeat \"Haskell\"",
	itext 4 "[\"Haskell\",\"Haskell\",\"Haskell\",...",
	text "「うわぁぁぁぁ」",
	text "大丈夫、何事もなかったようにCtrl-Cを押しましょう",
	text "強制終了にはCtrl-Cです",
	text "プロンプトが、かえってきます",
	text "さらに、つぎのように打ち込んでください",
	itext 4 "Prelude> x = x",
	itext 4 "Prelude> x",
	text "「...おいっ...どうした...死んでる?」",
	text "大丈夫、Ctrl-Cで意識を取りもどします"
	]

showType :: Page
showType = pageTitle "対話環境で型を確認" :| [
	text "対話環境は、コマンド:typeで型を表示してくれる",
	itext 4 "Prelude> :type 'c'",
	itext 4 "'c' :: Char",
	itext 4 "Prelude> :type False",
	itext 4 "False :: Bool"
	]

fruits :: Page
fruits = pageTitle "ファイルからの読み込み" :| [
	text "ファイルに保存した定義を読み込んでみます",
	text "まずは、お好きなエディタでファイルを作成",
	itext 4 "% vim fruits.hs",
	itext 4 "myFavoriteFruit = \"apple\"",
	text "対話環境に読み込みましょう",
	itext 4 "Prelude> :load fruits.hs",
	itext 4 "*Main>",
	text "値を表示してみます",
	itext 4 "*Main> myFavoriteFruit",
	itext 4 "\"apple\""
	]

reload :: Page
reload = pageTitle "再読み込み" :| [
	text "対話環境は、そのままにして",
	itext 4 "別のターミナルでファイルを編集",
	itext 4 "% vim fruits.hs",
	itext 4 "myFavoriteFruit = \"banana\"",
	text "これだけでは、新しい定義は使われない",
	itext 4 "*Main> myFavoriteFruit",
	itext 4 "\"apple\"",
	text "コマンド:reloadが必要",
	itext 4 "*Main> :reload",
	itext 4 "*Main> myFavoriteFruit",
	itext 4 "\"banana\""
	]

simpleFunction :: Page
simpleFunction = pageTitle "関数の定義と使用" :| [
	text "かんたんな関数を定義しましょう",
	itext 4 "% vim functions.hs",
	itext 4 "double x = x * 2",
	text "関数doubleを使ってみましょう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load functions.hs",
	itext 4 "*Main> double 8",
	itext 4 "16"
	]

functionLiteral :: Page
functionLiteral = pageTitle "関数リテラル" :| [
	text "関数リテラルを使うと、名前のない関数が作れる",
	itext 4 "*Main> :reload",
	itext 4 "*Main> (\\x -> x * 2) 8",
	itext 4 "16",
	text "\\x -> x * 2という関数を作って",
	itext 4 "すぐに整数8に適用している",
	text "関数定義は、ふたつのことをしている",
	itext 4 "1. 関数を作成(関数リテラルの機能)",
	itext 4 "2. できた関数で変数を束縛"
	]

operatorFunction :: Page
operatorFunction = pageTitle "演算子と関数" :| [
	text "演算子と関数とには、見た目のちがいだけしかない",
	text "演算子は",
	itext 4 "記号列を使う",
	itext 4 "中置記法である",
	text "演算子と関数とは、``や()でたがいに変換できる",
	itext 4 "*Main> 3 + 5",
	itext 4 "8",
	itext 4 "*Main> (+) 3 5",
	itext 4 "8",
	itext 4 "*Main> mod 128 5",
	itext 4 "25",
	itext 4 "*Main> 123 `mod` 5",
	itext 4 "25"
	]

typeDeclaration :: Page
typeDeclaration = pageTitle "型宣言" :| [
	text "変数luckyを定義します",
	itext 4 "% vim functions.hs",
	itext 4 "lucky :: Integer",
	itext 4 "lucky = 7",
	text "変数luckyの値をInteger型として明示的に宣言しました",
	text "関数douleにも型宣言をつけてみましょう",
	itext 4 "% vim functions.hs",
	itext 4 "double :: Integer -> Integer",
	itext 4 "double x = x * 2" ]

typeDeclaration2 :: Page
typeDeclaration2 = pageTitle "型宣言" :| [
	text "対話環境に読みこみます",
	itext 4 "*Main> :reload",
	itext 4 "*Main> lucky",
	itext 4 "7",
	itext 4 "*Main> :type lucky",
	itext 4 "lucky :: Integer",
	itext 4 "*Main> double lucky",
	itext 4 "14",
	itext 4 "*Main> :type double",
	itext 4 "double :: Integer -> Integer"
	]

numberTypes :: Page
numberTypes = pageTitle "数値型" :| [
	text "数値をあらわす値の型は、数値の種類に応じて、さまざま",
	text "たとえば、つぎのようなものがある",
	itext 4 "多倍長整数: Integer",
	itext 4 "浮動小数点数: Double"
	]

typeAnnotation :: Page
typeAnnotation = pageTitle "型注釈" :| [
	text "さまざまな型の値に解釈される、多相的な式がある",
	text "数値リテラルもそのような多相的な式のひとつ",
	text "変数に束縛されない式では、型宣言はつけられない",
	text "式に対して直接、型を明示する書きかたがある",
	itext 4 "*Main> 123 :: Integer",
	itext 4 "123",
	itext 4 "*Main> 123 :: Double",
	itext 4 "123.0"
	]

boolValue :: Page
boolValue = pageTitle "Bool値" :| [
	text "Bool値は偽(そうでない)と真(そうである)をあらわす",
	text "FalseとTrueの、ふたつの値",
	itext 4 "*Main> False",
	itext 4 "False",
	itext 4 "*Main> True",
	itext 4 "True"
	]

maybeValue :: Page
maybeValue = pageTitle "Maybe値" :| [
	text "Maybe値とは、値がないかもしれない値",
	itext 4 "値がない: Nothing",
	itext 4 "値がある: Just 値",
	text "試してみる",
	itext 4 "*Main> Nothing",
	itext 4 "Nothing",
	itext 4 "*Main> Just 8",
	itext 4 "Just 8"
	]

tuple :: Page
tuple = pageTitle "タプル" :| [
	text "いくつかの値を組み合わせた構造がタプル",
	text "タプルを定義してみましょう",
	itext 4 "% vim functions.hs",
	itext 4 "taro :: (String, Integer)",
	itext 4 "taro = (\"Taro Yamada\", 35)",
	text "対話環境で、みてみましょう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load functions.hs",
	itext 4 "*Main> taro",
	itext 4 "(\"Taro Yamada\",35)",
	itext 4 "*Main> :type taro",
	itext 4 "(String,Integer)"
	]

patternMatch :: Page
patternMatch = pageTitle "パターンマッチ" :| [
	text "パターンマッチは、Haskellでは本質的な機能のひとつ",
	text "分岐と、複合的な値からの値のとりだし",
	text "失敗するかもしれない計算の結果を使う例",
	itext 4 "% vim functions.hs",
	itext 4 "helloTo :: Maybe String -> String",
	itext 4 "helloTo (Just n) = \"Hello, \" ++ n ++ \"!\"",
	itext 4 "helloTo Nothing = \"Hello, customer!\"",
	text "タプルの、それぞれの要素の取り出し",
	itext 4 "human :: (String, Integer) -> String",
	itext 4 "human (n, a) = n ++ \"(\" ++ show a ++ \")\""
	]

patternMatch2 :: Page
patternMatch2 = pageTitle "パターンマッチ" :| [
	text "リテラルもパターンとして使える",
	itext 4 "safeRecip :: Double -> Maybe Double",
	itext 4 "safeRecip 0 = Nothing",
	itext 4 "safeRecip x = Just (1 / x)" ]

patternMatch3 :: Page
patternMatch3 = pageTitle "パターンマッチ" :| [
	text "定義した関数を試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load functions.hs",
	itext 4 "*Main> helloTo (Just \"Yoshikuni\")",
	itext 4 "\"Hello, Yoshikuni!\"",
	itext 4 "*Main> helloTo Nothing",
	itext 4 "\"Hello, customer!\"",
	itext 4 "*Main> human (\"Taro Yamada\", 32)",
	itext 4 "\"Taro Yamada(32)\"",
	itext 4 "*Main> safeRecip 8",
	itext 4 "Just 0.125",
	itext 4 "*Main> safeRecip 0",
	itext 4 "Nothing"
	]

wildCard :: Page
wildCard = pageTitle "ワイルドカード" :| [
	text "値に束縛された変数を使わないとき",
	text "パターンに、変数を使うかわりに、ワイルドカードを使う",
	itext 4 "% vim functions.hs",
	itext 4 "isNothing Nothing = True",
	itext 4 "isNothing (Just _) = False",
	text "試してみよう",
	itext 4 "*Main> :reload",
	itext 4 "*Main> isNothing Nothing",
	itext 4 "True",
	itext 4 "*Main> isNothing (Just 8)",
	itext 4 "False"
	]

atPattern :: Page
atPattern = pageTitle "@パターン" :| [
	text "@パターンを使うと、変数束縛したうえで",
	itext 4 "さらに細かいパターンにマッチさせられる",
	itext 4 "atPattern :: Maybe Integer -> String",
	itext 4 "atPattern jx@(Just x) =",
	itext 8 "show jx ++ \": \" ++ show x",
	itext 4 "atPattern Nothing = \"\"",
	text "試してみよう",
	itext 4 "*Main> :reload",
	itext 4 "*Main> atPattern (Just 8)",
	itext 4 "\"Just 8: 8\"",
	itext 4 "*Main> atPattern Nothing",
	itext 4 "\"\""
	]

guardSyntax :: Page
guardSyntax = pageTitle "ガード構文" :| [
	text "Bool値に対するパターンマッチは頻出なので",
	itext 4 "特別な構文がある",
	itext 4 "% vim functions.hs",
	itext 4 "safeSqrt :: Double -> Maybe Double",
	itext 4 "safeSqrt x",
	itext 8 "| x < 0 = Nothing",
	itext 8 "| otherwise = Just (sqrt x)"
	]

guardSyntax2 :: Page
guardSyntax2 = pageTitle "ガード構文" :| [
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "*Main> :reload",
	itext 4 "*Main> safeSqrt 9",
	itext 4 "Just 3.0",
	itext 4 "*Main> safeSqrt 2",
	itext 4 "Just 1.142135623730951",
	itext 4 "*Main> safeSqrt (- 5)",
	itext 4 "Nothing"
	]

ifFormula :: Page
ifFormula = pageTitle "if式" :| [
	text "おなじく、Bool値に対する特別な構文として",
	itext 4 "if式もある",
	text "ガード構文で、みたのと、おなじものをif式で定義する",
	itext 4 "% vim functions.hs",
	itext 4 "safeSqrt' :: Double -> Double",
	itext 4 "safeSqrt' x = if x < 0",
	itext 8 "then Nothing",
	itext 8 "else Just (sqrt x)"
	]

caseFormula :: Page
caseFormula = pageTitle "case式" :| [
	text "case式を使うと、関数定義ではなく",
	itext 4 "式のなかでパターンマッチができる",
	itext 4 "% vim functions.hs",
	itext 4 "yesNo :: Char -> Maybe Bool",
	itext 4 "yesNo c = case c of",
	itext 8 "'n' -> Just False",
	itext 8 "'y' -> Just True",
	itext 8 "_ -> Nothing"
	]

generics :: Page
generics = pageTitle "多相" :| [
	text "多相性のある関数を定義する",
	itext 4 "% vim functions.hs",
	itext 4 "ignoreSecond :: a -> b -> a",
	itext 4 "ignoreSecond x y = x",
	text "試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load functions.hs",
	itext 4 "*Main> ignoreSecond 8 \"hello\"",
	itext 4 "8",
	itext 4 "*Main> ignoreSecond False 123.45",
	itext 4 "False",
	itext 4 "*Main> :type ignoreSecond",
	itext 4 "ignoreSecond :: a -> b -> a"
	]

typeSynonym :: Page
typeSynonym = pageTitle "型シノニム" :| [
	text "予約語typeによる構文で、型の別名が定義できる",
	itext 4 "% vim functions.hs",
	itext 4 "type Human = (String, Integer)",
	itext 4 "showHuman :: Human -> String",
	itext 4 "showHuman (n, a) = n ++ \"(\" ++ show a ++ \")\"",
	text "試してみる",
	itext 4 "*Main> :reload",
	itext 4 "*Main> showHuman (\"Taro\", 39)",
	itext 4 "\"Taro(39)\""
	]

typeSynonym2 :: Page
typeSynonym2 = pageTitle "型シノニム" :| [
	text "型シノニムの定義には、型引数が使える",
	itext 4 "% vim functions.hs",
	itext 4 "type Check a = (Bool, a)",
	itext 4 "tasks :: [Check String]",
	itext 4 "tasks =",
	itext 8 "[(False, \"Shopping\"), (True, \"Walking\")]",
	text "対話環境で、みてみる",
	itext 4 "*Main> :reload",
	itext 4 "*Main> tasks",
	itext 4 "[(False,\"Shopping\"),(True,\"Walking\")]",
	itext 4 "*Main> :type tasks",
	itext 4 "tasks :: [Check String]"
	]

importSyntax :: Page
importSyntax = pageTitle "モジュールの導入" :| [
	text "モジュールの導入には、予約語importを使う",
	itext 4 "% vim useMaybe.hs",
	itext 4 "import Data.Maybe (fromMaybe)",
	itext 4 "maybe0 :: Maybe Integer -> Integer",
	itext 4 "maybe0 = fromMaybe 0",
	text "試してみる",
	itext 4 "*Main> :load useMaybe.hs",
	itext 4 "*Main> maybe0 (Just 8)",
	itext 4 "8",
	itext 4 "*Main> maybe0 Nothing",
	itext 4 "0"
	]

comment :: Page
comment = pageTitle "コメント" :| [
	text "コメントは、--から行末か、{-と-}とで、かこまれた部分",
	text "コメントを書いてみよう",
	itext 4 "% vim functions.hs",
	itext 4 "some :: Integer",
	itext 4 "some = 8        -- some is 8",
	itext 4 "",
	itext 4 "hoge :: Integer -> Integer",
	itext 4 "hoge x = x * 3",
	itext 4 "{-",
	itext 4 "hoge 3 = 9",
	itext 4 "hoge 10 = 30",
	itext 4 "...",
	itext 4 "-}"
	]

comment2 :: Page
comment2 = pageTitle "コメント" :| [
	text "試してみよう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load functions.hs",
	itext 4 "*Main> some",
	itext 4 "8",
	itext 4 "*Main> hoge 5",
	itext 4 "15"
	]

epilogue :: Page
epilogue = pageTitle "復習した" :| [
	text "ざっと基本的な知識を復習した",
	text "だいたい、わかっただろうか"
	]
