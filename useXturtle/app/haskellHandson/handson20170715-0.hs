import Control.Monad
import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	greeting, selfIntroduction, installStack,
	prelude, mokuji, mokuji2,
	checkStack,
	startup, input,
	calc, useIt, history, forcedTermination, showType,
	getSamples, getSamples2, getSamples3, notEdit, tab,
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
	text "今回のハンズオンについて、いくつか話します"
	]

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "Stackのインストールの仕方のアドレスを再掲します",
	itext 4 "https://goo.gl/kqh2TB",
	text "今回のハンズオンですが、かなり苦心しました",
	text "完全な初心者向けと考えて作りました",
	text "でも、Haskellの面白さをつたえたい",
	text "どの程度の速度でハンズオンればいいのか、も",
	text "結果として、きちきちに最適化されたレクチャーです",
	text "ちゃんと理解したいかたは、ぜひ、拙書を!!!"
	]

mokuji :: Page
mokuji = pageTitle "ハンズオンの流れ" :| [
	text "ハンズオンの項目はつぎのようになります",
	itext 4 "0. 事前資料のおさらい (このスライド) (47)",
	itext 4 "1. 便利な多相関数を2, 3紹介 (20)",
	itext 4 "2. リストを使って「くりかえし」を実装する (21)",
	itext 4 "3. 再帰関数を定義する (15)",
	itext 4 "4. IOモナドによる入出力のやりかた (28)",
	itext 4 "5. 自分で新しい型を定義する (23)",
	itext 4 "6. 電卓の例と、数当てゲームの例 (38)",
	itext 4 "I. 対話的アプリ作成用の「わくぐみ」紹介 (14)",
	text "時間が足りなくなりしだい、つぎの順に省略していきます",
	itext 4 "5 -> 6 -> 4"
	]

mokuji2 :: Page
mokuji2 = pageTitle "ハンズオンの流れ" :| [
	text "できればIOモナドまでは説明したい",
	text "最悪、そこまで行かなくても「わくぐみ」を使って",
	itext 4 "自作アプリが作成できるようにしてありますが"
	]

checkStack :: Page
checkStack = pageTitle "Stackある?" :| [
	itext 4 "% stack --version",
	itext 4 "Version 1.3.2, Git ...",
	text "僕の環境では、こうなります。",
	text "みなさんの環境は?あまり古いと動かないかも、です"
	]

startup :: Page
startup = pageTitle "対話環境の起動と終了" :| [
	text "それでは始めましょう",
	text "事前資料の内容のおさらいから",
	text "まずは、対話環境の起動と終了",
	itext 4 "% stack ghci",
	itext 4 "Prelude>",
	text "新しい言語を学ぶときの",
	itext 4 "一番はじめの壁は「インストール」かも",
	text "対話環境は立ち上がったかな",
	text "ここまで、できれば最初の壁は、こえたということ",
	text "さて、ソフトを立ち上げたときに、はじめに知りたいのは",
	itext 4 "僕だったら、その終わらせかた",
	text "終わらせかたを知らないと、不安になる",
	itext 4 "Prelude> :quit"
	]

input :: Page
input = pageTitle "値や式の打ちこみ" :| [
	text "対話環境に、いろいろな値を打ちこんでみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> 4492",
	itext 4 "4492",
	itext 4 "Prelude> 'c'",
	itext 4 "'c'",
	itext 4 "Prelude> pi",
	itext 4 "3.141592653589793",
	text "整数や文字はリテラル。そのまま表示される",
	text "piは変数。それが束縛されている値が表示される"
	]

calc :: Page
calc = pageTitle "電卓" :| [
	text "計算もできる",
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
	text "計算の結果を、つぎの計算で使いたいとする",
	itext 4 "Prelude> 123456789 * 123456789",
	itext 4 "1524159121932621",
	text "これを、もう1回、打ちこむのはめんどくさい",
	text "変数itを使う",
	itext 4 "Prelude> it * 123456789",
	itext 4 "188167791118860863013969",
	text "対話環境は評価した値を変数itに束縛しておいてくれる"
	]

history :: Page
history = pageTitle "履歴" :| [
	text "対話環境を快適に使うには、履歴機能もかかせない",
	text "以下を順に打ちこんでみる",
	itext 4 "Prelude> 12345 * 6789",
	itext 4 "Prelude> \"Haskell Language\"",
	itext 4 "Prelude> pi",
	text "上矢印キーを3回、下矢印キーを1回、押す",
	itext 4 "Prelude> \"Haskell Language\"",
	text "左矢印キーを1回、バックスペースキーを8回押す",
	text "Brooks Curryと打ちこみ、エンターキーを押す",
	itext 4 "Prelude> \"Haskell Brooks Curry\"",
	itext 4 "\"Haskell Brooks Curry\""
	]

forcedTermination :: Page
forcedTermination = pageTitle "強制終了" :| [
	text "対話環境に、つぎのように打ち込んでみる",
	itext 4 "Prelude> repeat \"Haskell\"",
	itext 4 "[\"Haskell\",\"Haskell\",\"Haskell\",...",
	text "「うわぁぁぁぁ」",
	text "大丈夫、何事もなかったようにCtrl-Cを押す",
	text "強制終了にはCtrl-C",
	text "プロンプトが、かえってくる",
	text "さらに、つぎのように打ち込む",
	itext 4 "Prelude> x = x",
	itext 4 "Prelude> x",
	text "「...おいっ...どうした...死んでる?」",
	text "大丈夫、Ctrl-Cで意識を取りもどす"
	]

showType :: Page
showType = pageTitle "対話環境で型を確認" :| [
	text "対話環境は、コマンド:typeで型を表示してくれる",
	itext 4 "Prelude> :type 'c'",
	itext 4 "'c' :: Char",
	itext 4 "Prelude> :type False",
	itext 4 "False :: Bool",
	text "対話環境からぬけておく",
	itext 4 "Prelude> :quit"
	]

getSamples :: Page
getSamples = pageTitle "サンプルコードの入手" :| [
	text "本当はコードを手打ちしたほうが勉強になる",
	text "しかし、時間に限りがあるので",
	itext 4 "サンプルコードをダウンロードしてもらう",
	text "ハンズオンのあいだは、サンプルコードを使うが",
	itext 4 "自分で打ち込んだつもりで、みていってほしい",
	text "システムにgitが入っている人は",
	itext (- 4) "git clone \\",
	itext (- 2) "https://github.com/YoshikuniJujo/haskell-nyumon-handson",
	text "作られたディレクトリ下のディレクトリsamplesに移動",
	itext 4 "% cd haskell-nyumon-handson/samples",
	text "(1分ほど待つ)",
	text "つぎのスライドにもリポジトリのアドレスはありますので"
	]

getSamples2 :: Page
getSamples2 = pageTitle "サンプルコードの入手" :| [
	text "リポジトリのアドレスを再掲する",
	itext (- 2) "https://github.com/YoshikuniJujo/haskell-nyumon-handson",
	text "「gitって何?」という人は圧縮ファイルをダウンロード",
	text "ブラウザに、つぎのアドレスを入力",
	itext 4 "https://git.io/vQIKd",
	text "つぎのファイルがダウンロードされる",
	itext 4 "haskell-nyumon-handson-master.zip",
	text "これを解凍する",
	text "できたディレトリ下のディレクトリsamplesに移動",
	itext 4 "(2分ほど)",
	text "何か、問題のあるかたはいらっしゃいますか?",
	itext 4 "(3分ほど)",
	text "まだ、ダウンロードできていないかたはいますか?"
	]

getSamples3 :: Page
getSamples3 = pageTitle "サンプルコードの入手" :| [
	text "どちらの方法でダウンロードしたかたも",
	text "Unix系のOSのかたは",
	itext 4 "% pwd",
	itext 4 ".../samples",
	text "Windowsのかたは",
	itext 4 "% cd",
	itext 4 ".../samples",
	text "どちらのOSのかたも",
	itext 4 "% stack ghci",
	itext 4 "*Main Hndsn>",
	text "つぎのことを確認する",
	itext 4 "ディレクトリsamplesにいること",
	itext 4 "プロンプトが\"*Main Hndsn\"になっている"
	]

notEdit :: Page
notEdit = pageTitle "ファイルを編集" :| [
	text "サンプルコードは用意してある",
	text "しかし、スライドでは、つぎのように表現する",
	itext 4 "「ファイルを作成する」",
	itext 4 "「ファイルに書き込む」など",
	text "そのようなときは、ファイルの該当する部分を",
	itext 4 "お好きなエディタで参照してほしい",
	text "ただし、1ヶ所だけ、本当に編集してもらうところがある",
	text "ソースファイルの再読み込みを試すところだ",
	text "そのときは「本当に」と書くので、そのつもりで",
	text "また、スライドで\"% vim\"のように書くのは",
	itext 4 "エディタで編集を示す標識",
	text "好きなエディタを使ってほしい"
	]

tab :: Page
tab = pageTitle "タブ幅" :| [
	text "お行儀の良いHaskellerはコードにタブを使わない",
	text "僕は、そんなにお行儀の良いタイプではないので",
	itext 4 "「行儀よくまじめなんて出来やしなかった」",
	itext 4 "校舎の「窓ガラス壊してまわ」りはしませんが",
	text "タブを使う",
	text "このハンズオンでは",
	itext 4 "タブは8文字幅と考えます",
	text "エディタの設定ができるかたはタブ幅を8文字ぶんに",
	itext 4 "よろしくおねがいします",
	itext 4 "(1分ほど)"
	]

fruits :: Page
fruits = pageTitle "ファイルからの読み込み" :| [
	text "ファイルに保存した定義を読み込んでみる",
	text "まずは、お好きなエディタでファイルを作成",
	itext 4 "(実際には、該当する部分を参照)",
	text "エディタは対話環境とは別のターミナルで開こう",
	itext 4 "% vim fruits.hs",
	itext 4 "myFavoriteFruit = \"apple\"",
	text "対話環境に読み込む",
	itext 4 "*Main Hndsn> :load fruits.hs",
	itext 4 "*Main>",
	text "値を表示してみる",
	itext 4 "*Main> myFavoriteFruit",
	itext 4 "\"apple\"",
	text "できたでしょうか?基本、こんな感じで進めていきます"
	]

reload :: Page
reload = pageTitle "再読み込み" :| [
	text "対話環境は、そのままにして",
	itext 4 "エディタ用のターミナルでファイルを「本当に」編集",
	itext 4 "(エディタを開きっぱなしにしておいても良い)",
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
	text "かんたんな関数を定義する",
	itext 4 "% vim functions.hs",
	itext 4 "double x = x * 2",
	text "関数doubleを使ってみる",
	itext 4 "*Main> :load functions.hs",
	itext 4 "*Main> double 8",
	itext 4 "16"
	]

functionLiteral :: Page
functionLiteral = pageTitle "関数リテラル" :| [
	text "関数リテラルを使うと、名前のない関数が作れる",
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
	itext 4 "*Main> div 128 5",
	itext 4 "25",
	itext 4 "*Main> 128 `div` 5",
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
	itext 4 "123.0",
	text "いかがでしょうか?",
	text "ちゃんと、整数や実数に、評価されたでしょうか"
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
	itext 4 "*Main> :reload",
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
	itext 4 "*Main> :reload",
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
	itext 4 "*Main> :reload",
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
	itext 4 "*Main> :load functions.hs",
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
