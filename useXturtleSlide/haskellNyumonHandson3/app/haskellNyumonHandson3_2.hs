module Main where

import Data.List.NonEmpty
import Graphics.X11.Slide

version :: Version
version = [0, 0, 0, 1]

main :: IO ()
main = runSlide version someSlide

someSlide :: Slide
someSlide = title :| [
	prelude, combinator, importModules,
	typeParse1, typeParse2, typeParse3, typeParse4,
	funSucceed1, funSucceed2, funCheck1, funCheck2, funCheck3,
	funChar1, funChar2,
	funAlt1, funAlt2, funAlt3, funAlt4,
	funBuild1, funBuild2,
	funBind1, funBind2, funBind3, funBind4, funBind5,
	funEof1, funEof2, summary
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #3" "2. パーサコンビネータ(1)" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "構文解析器をつくり",
	itext 4 "それを使って四則演算の式を読み込み、評価する",
	text "たとえば、つぎのような式を読み込む",
	itext 4 "3+(5*4)",
	text "そして、この結果を計算して、つぎのように表示する",
	itext 4 "23",
	text "このように、文字列を決められたルールで解釈することを",
	itext 4 "構文解析とよぶ",
	text "今回は構文解析と、数値への評価を同時にやってしまう"
	]

combinator :: Page
combinator = pageTitle "パーサコンビネータ" :| [
	text "まず「パーサコンビネータ」を構成する関数群を定義する",
	text "「パーサコンビネータ」とは、構文解析器(パーサ)を",
	itext 4 "組み上げるための道具",
	text "この道具を対話環境で試しながら作っていく",
	text "内容としては",
	itext 2 "拙書「Haskell - 教養としての関数型プログラミング」",
	itext 2 "第20章の内容(P.298 - 310)を",
	itext 2 "「ほぼ、まるまる」といった感じ"
	]

importModules :: Page
importModules = pageTitle "モジュールの導入" :| [
	text "対話環境で使う関数をファイル内で導入する",
	itext 4 "こういうことは本番コードではあまりやらない",
	itext 4 "ハンズオンでの便宜のため",
	text "ファイルcalc.hsをつぎのように作る",
	itext 4 "% vim calc.hs",
	itext 4 "import Data.Maybe (listToMaybe, fromJust)",
	itext 4 "import Data.Char (isDigit, isSpace, digitToInt)",
	text "予約語importを使ってモジュールを導入する",
	text "対話環境に読み込んでおこう",
	itext 4 "*Main> :load calc.hs"
	]

typeParse1 :: Page
typeParse1 = pageTitle "パーサの型" :| [
	text "ここで、「パーサ」の型を考える",
	text "「文字列を読み込んで値を返す関数」だと",
	itext 4 "String -> a",
	text "Haskellで標準的な文字列はString型の値だ",
	text "String型の値とは、実はChar型のリストである",
	itext 4 "*Main> ['x', 'y', 'z']",
	itext 4 "\"xyz\"",
	text "['x', 'y', 'z']と\"xyz\"とは、おなじ",
	text "また「String -> a」の「a」は型変数",
	text "型変数は実際に型が使われるときには",
	itext 4 "具体的な型(Char, Bool, Doubleなど)に置き換える"
	]

typeParse2 :: Page
typeParse2 = pageTitle "パーサの型" :| [
	text "ふたつのパーサをつなげることを考える",
	text "前のパーサでパースしきれなかった文字列を",
	itext 4 "つぎのパーサにわたすことを考えると",
	itext 4 "パーサは結果の値だけでなく、「残りの文字列」も",
	itext 4 "返したほうがいいだろう",
	text "すると、パーサの型は、つぎのようになる",
	itext 4 "String -> (a, String)",
	text "(Foo, Bar)のような構造をタプルと呼ぶ",
	text "ふたつ以上の値をまとめるのに使うことができる"
	]

typeParse3 :: Page
typeParse3 = pageTitle "パーサの型" :| [
	text "さらに、パースの結果として",
	itext 4 "最終的には、ひとつにしぼるとしても",
	itext 4 "解析の途中では複数の候補が必要になることもある",
	text "パーサの型はさらに、つぎのようになる",
	itext 4 "String -> [(a, String)]",
	text "[Foo]という表記は「Foo型の値のリスト」の型を意味する",
	text "この型全体の意味は、つぎのようになる",
	itext 2 "文字列を引数としてとり",
	itext 2 "「パースの結果と残りの文字列」のリストを返す関数"
	]

typeParse4 :: Page
typeParse4 = pageTitle "パーサの型" :| [
	text "これから、パーサをあつかう関数をいくつか作る",
	text "そのたびにString -> [(a, String)]を書くのは冗長",
	text "このようなとき、型に別名(型シノニム)をつけられる",
	text "ファイルcalc.hsに、つぎのように追加する",
	itext 4 "% vim calc.hs",
	itext 4 "type Parse a = String -> [(a, String)]",
	text "予約語typeを使って型シノニムParseを定義した",
	text "型引数aのところには具体的な型がはいる",
	itext 4 "Parse Char ===> String -> [(Char, String)]",
	itext 4 "Parse Bool ===> String -> [(Bool, String)]",
	itext 4 "Parse Double ===> String -> [(Double, String)]"
	]

funSucceed1 :: Page
funSucceed1 = pageTitle "いつも成功するパーサ" :| [
	text "「いつも成功して",
	itext 4 "決められた値を返すパーサ」を作る関数",
	itext 4 "% vim calc.hs",
	itext 4 "succeed :: a -> Parse a",
	itext 4 "succeed v inp = [(v, inp)]",
	text "いまは「何のためにあるか」はわからなくていい"
	]

funSucceed2 :: Page
funSucceed2 = pageTitle "いつも成功するパーサ" :| [
	text "対話環境で試してみよう",
	itext 4 "*Main> :reload",
	itext 4 "*Main> (succeed 123) \"hello\"",
	itext 4 "[(123,\"hello\")]",
	text "文字列を消費せずに123を返すパーサに",
	itext 4 "文字列\"hello\"をあたえたら",
	itext 4 "ひとつの「結果の値123と残りの文字列\"hello\"」に",
	itext 8 "解析されたということ"
	]

funCheck1 :: Page
funCheck1 = pageTitle "条件つきで1文字、読み込むパーサ" :| [
	text "条件を満たす1文字を読み込むパーサを作る関数",
	itext 4 "check :: (Char -> Bool) -> Parse Char",
	itext 4 "check p (c : cs) | p c = [(c, cs)]",
	itext 4 "check _ _ = []",
	text "関数checkの定義にはパターンマッチとガードという",
	itext 4 "ふたつの構文が使われている",
	text "第2引数のところの(c : cs)はパターンマッチ",
	text "第2引数の文字列のうち、先頭の文字で変数cを束縛し",
	itext 4 "残りの文字列で変数csを束縛している",
	text "ちなみに、「値で変数を束縛する」は",
	itext 4 "「値を変数に代入する」のように",
	itext 4 "頭のなかで変換するとわかりやすいかも"
	]

funCheck2 :: Page
funCheck2 = pageTitle "条件つきで1文字、読み込むパーサ" :| [
	text "関数checkの定義を再掲する",
	itext 4 "check p (c : cs) | p c = [(c, cs)]",
	itext 4 "check _ _ = []",
	text "| p cのところがガード",
	text "これはp cを評価した結果がTrueのとき",
	itext 4 "全体が=の左辺の[(c, cs)]に評価されるということ",
	text "これらのパターンマッチとガードの",
	itext 4 "どちらかを満たさなければ2行目にうつる",
	text "定義の2行目の_(アンダースコア)は",
	itext 4 "第1引数と第2引数とが使われないということ",
	text "引数は無視されて[](空リスト)に評価される",
	text "これは、1文字目cが条件pを満たさなければ",
	itext 4 "パースは失敗するということ"
	]

funCheck3 :: Page
funCheck3 = pageTitle "条件つきで1文字、読み込むパーサ" :| [
	text "対話環境で試してみる",
	itext 4 "*Main> :reload",
	itext 4 "*Main> check isDigit \"123\"",
	itext 4 "[('1',\"23\")]",
	itext 4 "*Main> check isDigit \"abc\"",
	itext 4 "[]",
	text "1文字目が数字なら成功し",
	itext 4 "そうでなければ失敗するパーサを作り、使った"
	]

funChar1 :: Page
funChar1 = pageTitle "指定した1文字を読み込むパーサ" :| [
	text "指定した1文字を読み込むパーサを作る関数",
	itext 4 "% vim calc.hs",
	itext 4 "char :: Char -> Parse Char",
	itext 4 "char c = check (== c)",
	text "(== c)は演算子の部分適用",
	text "演算子の第1引数のところが空いている",
	text "部分適用によって作られた関数に引数をあたえると",
	itext 4 "その「空いているところ」にはいる",
	text "たとえば(== c) 'a'のようにすると",
	itext 4 "'a' == cとしたのとおなじこと",
	text "つまり、(== c)は引数と値cとを等値比較する関数になる",
	text "関数checkに「値cとの等値比較をする関数」を",
	itext 2 "あたえると指定した1文字cを読み込むパーサになる"
	]

funChar2 :: Page
funChar2 = pageTitle "指定した1文字を読み込むパーサ" :| [
	text "対話環境で試してみる",
	itext 4 "*Main> :reload",
	itext 4 "*Main> char 'a' \"abc\"",
	itext 4 "[('a',\"bc\")]",
	itext 4 "*Main> char 'a' \"bcd\"",
	itext 4 "[]",
	text "1文字目が指定した文字'a'であるとき",
	itext 4 "パースは成功し、文字'a'が消費され",
	itext 4 "文字'a'が結果となる",
	text "そうでなければ、パースは失敗する"
	]

funAlt1 :: Page
funAlt1 = pageTitle "ふたつのパーサのうち、どちらか" :| [
	text "ふたつのパーサのうちの",
	itext 4 "どちらかで解析するパーサを作る",
	text "パーサは「リストを返す関数」なので",
	itext 4 "返されたリストを結合すればいい",
	itext 4 "% vim calc.hs",
	itext 4 "alt :: Parse a -> Parse a -> Parse a",
	itext 4 "(p1 `alt` p2) inp = p1 inp ++ p2 inp",
	text "演算子(++)はリストを結合する",
	text "パーサの失敗を空リストとしたので",
	itext 4 "パーサp1が失敗したとき",
	itext 4 "パーサp2の結果が全体の結果になる",
	text "逆も成り立つ"
	]

funAlt2 :: Page
funAlt2 = pageTitle "ふたつのパーサのうち、どちらか" :| [
	text "まえに演算子は()でかこむと、関数になると説明した",
	itext 4 "*Main> 3 + 5",
	itext 4 "8",
	itext 4 "*Main> (+) 3 5",
	itext 4 "8",
	text "逆に2引数関数は``(バッククォート)でかこむと",
	itext 4 "演算子になる",
	itext 4 "*Main> mod 8 3",
	itext 4 "2",
	itext 4 "*Main> 8 `mod` 3",
	itext 4 "2"
	]

funAlt3 :: Page
funAlt3 = pageTitle "ふたつのパーサのうち、どちらか" :| [
	text "関数altの定義を再掲する",
	itext 4 "(p1 `alt` p2) inp = p1 inp ++ p2 inp",
	text "「``(バッククォート)で演算子になる」これは",
	itext 4 "関数を使うときだけでなく",
	itext 4 "関数を定義するときにも同様だ",
	text "つまり、うえの定義は、つぎとおなじことだ",
	itext 4 "alt p1 p2 inp = p1 inp ++ p2 inp",
	text "「パーサp1とp2とを足し合わせる感じ」を表現したくて",
	itext 4 "定義にも演算子の構文を使った"
	]

funAlt4 :: Page
funAlt4 = pageTitle "ふたつのパーサのうち、どちらか" :| [
	text "対話環境で試してみよう",
	itext 4 "*Main> :reload",
	itext 4 "*Main> (char 'a' `alt` check isDigit) \"123\"",
	itext 4 "[('1',\"23\")]",
	itext 4 "*Main> (char 'a' `alt` check isDigit) \"abc\"",
	itext 4 "[('a',\"bc\")]",
	text "「文字'a'、または、数字」の",
	itext 4 "1文字をパースするパーサを作り、使った"
	]

funBuild1 :: Page
funBuild1 = pageTitle "パースの結果を加工する" :| [
	text "パースした結果の値に関数を適用して",
	itext 4 "別の値に変換する関数",
	itext 4 "% vim calc.hs",
	itext 4 "build :: Parse a -> (a -> b) -> Parse b",
	itext 4 "(p `build` f) inp =",
	itext 4 "        [ (f x, r) | (x, r) <- p inp ]",
	text "ここで使っているのは、リスト内包表記だ",
	text "これは構文糖",
	text "文字列inpに関数pを適用した結果としてリストができる",
	text "そのリストの要素すべてに対して",
	itext 4 "パターン(x, r)を使って、変数x, rを束縛し",
	itext 4 "式(f x, r)によって新しい値を作る"
	]

funBuild2 :: Page
funBuild2 = pageTitle "パースの結果を加工する" :| [
	text "対話環境で試してみよう",
	itext 4 "*Main> :reload",
	itext 4 "*Main> (check isDigit `build` digitToInt) \"123\"",
	itext 4 "[(1,\"23\")]",
	text "関数digitToIntは数字の1文字を数値に変換する関数",
	text "check isDigitだけだと、結果は文字'1'になる",
	text "それを関数buildを使ってdigitToIntを適用することで",
	itext 4 "数値の1にしている"
	]

funBind1 :: Page
funBind1 = pageTitle "ふたつのパーサをつなげる" :| [
	text "ふたつのパーサをつなげる演算子",
	itext 4 "% vim calc.hs",
	itext 4 "(>@>) :: Parse a -> Parse b -> Parse (a, b)",
	itext 4 "(p1 >@> p2) inp = [ ((x, y), r') |",
	itext 4 "        (x, r) <- p1 inp, (y, r') <- p2 r ]",
	text "ここでもリスト内包表記を使っている",
	text "パーサp1で解析した結果の残りの文字列rが",
	itext 4 "パーサp2の引数としてわたされている",
	text "パーサp1の複数の結果すべてに対して",
	itext 4 "パーサp2の複数の結果すべてが計算される",
	text "全体の結果として、それぞれのパースの結果の値x, yが",
	itext 4 "タプルとして、まとめられて",
	itext 4 "それにさらに、パーサp2による解析の残りr'を追加"
	]

funBind2 :: Page
funBind2 = pageTitle "ふたつのパーサをつなげる" :| [
	text "対話環境で試す",
	itext 4 "*Main> :reload",
	itext 4 "*Main> (char 'a' >@> check isDigit) \"a123\"",
	itext 4 "[(('a','1'),\"23\")]",
	text "文字'a'をパースするパーサと",
	itext 4 "数字をパースするパーサとをつなげたパーサだ"
	]

funBind3 :: Page
funBind3 = pageTitle "ふたつのパーサをつなげる" :| [
	text "ふたつのパーサをつなげるとき",
	itext 4 "どちらかのパース結果を捨てたいときがある",
	text "たとえば「123,456」のような文字列をパースするとき",
	itext 4 ",(カンマ)はパースの結果には必要ない",
	text "まえの結果と、うしろの結果について",
	itext 4 "それぞれを残す(他方を捨てる)、結合用の関数を作る"
	]

funBind4 :: Page
funBind4 = pageTitle "ふたつのパーサをつなげる" :| [
	itext 4 "% vim calc.hs",
	itext 4 "(>@) :: Parse a -> Parse b -> Parse a",
	itext 4 "p1 >@ p2 = (p1 >@> p2) `build` fst",
	itext 4 "",
	itext 4 "(@>) :: Parse a -> Parse b -> Parse b",
	itext 4 "p1 @> p2 = (p1 >@> p2) `build` snd",
	text "関数fstとsndは、それぞれ",
	itext 4 "タプルの第1要素、第2要素を取り出す関数",
	text "これを関数buildによって、パースの結果に適用している"
	]

funBind5 :: Page
funBind5 = pageTitle "ふたつのパーサをつなげる" :| [
	text "対話環境で試す",
	itext 4 "*Main> :reload",
	itext 4 "*Main> (char 'a' >@ check isDigit) \"a123\"",
	itext 4 "[('a',\"23\")]",
	itext 4 "*Main> (char 'a' @> check isDigit) \"a123\"",
	itext 4 "[('1',\"23\")]",
	text "それぞれ、まえの値、うしろの値だけ結果として残る"
	]

funEof1 :: Page
funEof1 = pageTitle "文字列のおわりを調べる" :| [
	text "文字列のすべてを解析したことを確認するパーサ",
	itext 4 "% vim calc.hs",
	itext 4 "eof :: Parse ()",
	itext 4 "eof \"\" = [((), \"\")]",
	itext 4 "eof _ = []",
	text "型()はユニット型と呼ばれる",
	text "値()のみを値とする型",
	text "情報量は0",
	text "簡単に言うとパーサeofには返す結果がないということ"
	]

funEof2 :: Page
funEof2 = pageTitle "文字列のおわりを調べる" :| [
	text "対話環境で試す",
	itext 4 "*Main> :reload",
	itext 4 "*Main> (char 'a' >@ eof) \"a123\"",
	itext 4 "[]",
	itext 4 "*Main> (char 'a' >@ eof) \"a\"",
	itext 4 "[('a',\"\")]",
	text "解析されていない文字列が残っていれば",
	itext 4 "パースは失敗する"
	]

summary :: Page
summary = pageTitle "まとめ" :| [
	text "構文解析に使う基本的な道具を定義した",
	text "以下のパーサやパーサをあつかう関数だ",
	itext 4 "succeed, check, char",
	itext 4 "alt, build, (>@>), (>@), (@>)",
	text "これらを使ってパーサを組み立てていく"
	]
