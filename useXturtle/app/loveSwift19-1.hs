import Control.Monad
import Data.List.NonEmpty

import Graphics.X11.Turtle
import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	greeting, introduction, mosadomo,
	benefit1, benefit2, benefit3, benefit4, benefit5,
	simpleFunction, composition, composition2,
	monad, monad2, monad3, monad4, monad5, monad6, monad7, monad8,
	ioMonad, ioMonad2, summary1,
	book, book2, book3,
	turtle, turtle2, turtle3,
	bookbookbook
	]

titlePage :: Page
titlePage = writeTitle "Swiftの中心で、Haskellをさけぶ(仮)"
		"第19回 Swift愛好会" :| []

greeting :: Page
greeting = pageTitle "ごあいさつ" :| [
	text "はじめまして。おまねきいただき、ありがとうござい(ry",
	(>>)
		<$> writeImageCenter
			(515 * 22 / 60, 654 * 22 / 60, "images/cover.png")
		<*> replicateM_ 10 . nextLine,
	text "「Haskell 教養としての関数型プログラミング」の著者",
	itext 4 "です"
	]

introduction :: Page
introduction = pageTitle "本の紹介" :| [
	writeImageMoreRight (515 / 6, 654 / 6, "images/cover.png"),
	text "Haskellの入門書です",
	text "僕の理想をつめこんだ入門書です",
	text "本に書かれた内容を愚直に実行していけば",
	itext 4 "Haskellの考えかたが身につく",
	text "それを目指して書きました",
	text "あつかう内容を最小限とするように腐心しました",
	text "入門書は、すくない内容にたいして",
	itext 4 "たくさんの実例で説明するべき、と考えています",
	text "僕とおなじ「とにかく手を動かして結果を見たい」",
	itext 4 "そういうかたに最適な入門書です",
	text "よろしくおねがいします"
	]

mosadomo :: Page
mosadomo = pageTitle "どうしよう" :| [
	text "「Swift愛好会」にまねいていただき光栄に思っています",
	text "しかし、おそらく、ここは、実践できたえられた",
	itext 4 "Swiftの猛者たちの集まっている場かと思います",
	text "僕のような「もやしっ子」が何を話せばいいのか",
	itext 4 "と、たじろいでいます",
	text "まず、第一に言いたいことは",
	itext 4 "Haskellを学ぶことで、絶対に得する",
	itext 4 "それと、Haskellは難しくない、ということです"
	]

benefit1 :: Page
benefit1 = pageTitle "コードがきれいになる" :| [
	text "Haskellを学ぶことで、得することはたくさんある",
	text "まず、Haskellを学ぶと、他の言語を使っていても",
	itext 4 "コードがきれいになる",
	text "きたないコードとは、たとえば",
	itext 4 "ある手続きを実行することで",
	itext 4 "他の手続きの動作が変わってしまう",
	text "そういうコードは、「よごれて」いる",
	text "「グローバル変数を使うな」というのは、そういうこと",
	text "Haskellを学ぶと",
	itext 4 "「よごれ」を「よごれ」として感じられる"
	]

benefit2 :: Page
benefit2 = pageTitle "自分が何をしているのか、わかる" :| [
	text "自分が何をしているのか、わかる",
	itext 4 "関数の入口と出口とが、それぞれ、ひとつである",
	itext 4 "型によって、関数に入るものと出るものとが決まる",
	text "ということ",
	text "関数doubleを定義することを考える",
	text "Haskellでは、関数の型は、引数の型と返り値の型とを",
	(>>)	<$> itext 4 "->の左右に置くことで、あらわす"
		<*> nextLine,
	(>>)	<$> itext 4 "double :: Integer -> Integer"
		<*> nextLine,
	text "この関数doubleは整数を整数に置き換える以外には",
	itext 4 "何もしないことが保証される(ただし黒魔術は(ry"
	]

benefit3 :: Page
benefit3 = pageTitle "単純で簡単" :| [
	(>>)	<$> text "たとえば、Swiftでジェネリックな関数を定義するには"
		<*> nextLine,
	(>>)	<$> itext 4 "func letItBe<T>(_ x : T) -> T { return x }"
		<*> nextLine,
	(>>)	<$> text "こんな感じかと思います。Haskellでは、おなじものを"
		<*> nextLine,
	itext 4 "letItBe :: a -> a",
	(>>)	<$> itext 4 "letItBe x = x"
		<*> nextLine,
	text "のように書けます"
	]

benefit4 :: Page
benefit4 = pageTitle "単純で簡単" :| [
	text "関数letItBeの例では、関数の型は単純なものでした",
	text "より複雑な型になると",
	itext 4 "表記の単純さは、大きな助けになります",
	text "多くの場合に「Haskellは、むずかしい」とされるのは",
	itext 4 "Haskellだと、より、むずかしいことができるため",
	itext 4 "より、むずかしい分野でHaskellが使われるため"
	]

benefit5 :: Page
benefit5 = pageTitle "本当に、つたえたい「得」" :| [
	text "本当に、つたえたい「得」は、言葉にできない",
	text "Haskellの持つ、単純さや、純粋さのなかには",
	itext 4 "それを学ぶことで",
	itext 4 "プログラムについての見方を変える力がある",
	text "はじめてプログラミングを学んだときに感じた、あれ",
	text "Haskellを学ぶと",
	itext 4 "その「あれ」を、もう一度、体験できる",
	text "それは「がっつり学ぶ」ことでしか、体験できない",
	text "ぜひぜひ、拙書を読んでいただきたい",
	text "今日は、ほんのちょっとだけ",
	itext 4 "いくつかの要素を紹介する"
	]

simpleFunction :: Page
simpleFunction = pageTitle "関数の定義" :| [
	text "Haskellは簡単です",
	(>>)	<$> text "整数を2倍する関数の定義を示します"
		<*> nextLine,
	(>>) <$> itext 4 "double x = x * 2" <*> nextLine,
	text "これ以上ないくらい、わかりやすく、シンプルな表記",
	(>>)	<$> text "これは対話環境で評価できる完全な定義。対話環境で"
		<*> nextLine,
	itext 4 "> double 3",
	(>>) <$> itext 4 "6" <*> nextLine,
	text "のように試すことができます"
	]

composition :: Page
composition = pageTitle "関数合成" :| [
	text "関数を合成する演算子について、理解することが",
	itext 4 "モナドを理解する、ひとつの道",
	text "2倍する関数doubleと、3を足す関数add3とが、あるとする",
	(>>)	<$> text "このとき、値8を2倍して、3を考す式を、みる"
		<*> nextLine,
	(>>)	<$> itext 4 "add3 (double 8)"
		<*> nextLine,
	text "これは、「8を2倍して3を足し」ています",
	(>>)	<$> text "おなじことを、ふたつの関数を、さきに合成すると考えて"
		<*> nextLine,
	(>>)	<$> itext 4 "(add3 . double) 8"
		<*> nextLine,
	text "のように書けます"
	]

composition2 :: Page
composition2 = pageTitle "関数合成" :| [
	text "Haskellでは演算子と関数とは、ほとんど、おなじ",
	text "演算子を関数として、あつかうときには()でかこむ",
	text "さっき、みた例は関数(.)に",
	itext 4 "引数として関数add3, doubleをあたえたもの",
	text "(.)は第2引数である関数の返り値を",
	itext 4 "第1引数である関数に引数としてあたえる",
	(>>)	<$> text "関数(.)の型は、つぎのようになる"
		<*> nextLine,
	(>>)	<$> itext 4 "(.) :: (b -> c) -> (a -> b) -> (a -> c)"
		<*> nextLine,
	text "f :: b -> c, g :: a -> bとしたとき",
	itext 4 "f . g :: a -> cとなるということ"
	]

monad :: Page
monad = pageTitle "モナド" :| [
	text "Haskellは簡単って言うけれど",
	itext 4 "じゃあ、モナドは、どうなる?",
	itext 4 "圏論を知らないと、だめなんでしょ?",
	itext 4 "何やら、むずかしそう",
	text "圏論は、知らなくても大丈夫",
	text "モナドは、むずかしくないよ",
	text "誤解しやすいところがある",
	itext 4 "モナドとIOモナドとは",
	itext 4 "切りわけて学んだほうがいい"
	]

monad2 :: Page
monad2 = pageTitle "モナド" :| [
	text "モナドの導入にはMaybeモナドを使うのがいい",
	(>>)	<$> text "たとえば、偶数だけ2でわる関数halveを考える"
		<*> nextLine,
	itext 4 "halve n | even n = Just (n `div` 2)",
	(>>)	<$> itext 9 "| otherwise = Nothing"
		<*> nextLine,
	text "nが偶数(even)ならJust値としてnを2でわった値を",
	text "そうでない(otherwise)ならNothing値をかえす"
	]

monad3 :: Page
monad3 = pageTitle "モナド" :| [
	(>>)	<$> text "おなじようにdiv3を定義する"
		<*> nextLine,
	itext 4 "div3 n  | n `mod` 3 == 0 = Just (n `div` 3)",
	(>>)	<$> itext 9 "| otherwise = Nothing"
		<*> nextLine,
	text "halveとdiv3を使って、「6の倍数なら6でわる関数」を",
	(>>)	<$> text "関数合成演算子(.)を使いたいが、型が合わない"
		<*> nextLine,
	itext 4 "halve :: Integer -> Maybe Integer",
	itext 4 "div3 :: Integer -> Maybe Integer"
	]

monad4 :: Page
monad4 = pageTitle "モナド" :| [
	text "Maybe値をかえす関数の関数合成演算子(<=<)を考える",
	(>>)	<$> text "関数合成演算子(.)と比較して、型を示す"
		<*> nextLine,
	itext 4 "(.) :: (b -> c) -> (a -> b) -> (a -> c)",
	itext 4 "(<=<) :: (b -> Maybe c) -> (a -> Maybe b)",
	itext 19 "-> (a -> Maybe c)",
	(>>)	<$> text "このような演算子を使うと、もとめる関数は"
		<*> nextLine,
	(>>) <$> itext 4 "div3 <=< halve" <*> nextLine,
	text "のようになる",
	text "関数div3、halveの、どちらかが失敗すれば、全体も失敗"
	]

monad5 :: Page
monad5 = pageTitle "モナド" :| [
	text "a -> bに対してa -> Maybe bでは",
	itext 4 "「失敗するかもしれない」という性質が追加される",
	text "このような「追加される性質」を「文脈」とよぶ",
	(>>)	<$> text "より一般的に文脈mに対して"
		<*> nextLine,
	(>>)	<$> itext 4 "a -> m b"
		<*> nextLine,
	text "のように書ける",
	text "このようなmに対して、関数合成演算子が定義できれば",
	itext 4 "そのようなmがモナドとなる(すこしウソだけど)"
	]

monad6 :: Page
monad6 = pageTitle "モナド" :| [
	(>>)	<$> text "モナドmに対して、つぎのような演算子が定義できる"
		<*> nextLine,
	(>>)	<$> itext 4 "(<=<) :: (b -> m c) -> (a -> m b) -> (a -> m c)"
		<*> nextLine,
	text "雑な言いかたをすれば",
	itext 4 "文脈mつきの値をかえす関数同士をつなげられれば",
	itext 4 "そのような文脈mがモナドとなる"
	]

monad7 :: Page
monad7 = pageTitle "モナド" :| [
	(>>) <$> text "たとえば、つぎのような関数を考える" <*> nextLine,
	(>>) <$> itext 4 "fun :: a -> s -> (b, s)" <*> nextLine,
	text "これはa型の引数とs型の引数をとって",
	itext 4 "b型の値とs型の値のタプルをかえす関数",
	text "この関数を「s型の値を変化させながら",
	(>>)	<$> itext 4 "a型の値からb型の値を計算する関数」とみなせる"
		<*> nextLine,
	(>>)	<$> itext 4 "type State b = s -> (b, s)"
		<*> nextLine,
	text "型の別名Stateを定義した"
	]

monad8 :: Page
monad8 = pageTitle "モナド" :| [
	(>>)	<$> text "さっきの関数funの型は、つぎのように書ける"
		<*> nextLine,
	(>>) <$> itext 4 "fun :: a -> State b" <*> nextLine,
	text "お、a -> m bの、かたちだ!",
	text "そう、これもモナドになるのです",
	text "僕の推奨するモナドの学習法",
	itext 2 "MaybeモナドとStateモナドのふたつを学ぶ",
	itext 2 "「全然ちがうこのふたつ、どっちもモナド?」と混乱",
	itext 2 "モナドという「わくぐみ」は、ただ「形式」だと理解"
	]

ioMonad :: Page
ioMonad = pageTitle "入出力" :| [
	text "Haskellでは",
	itext 4 "入出力はIOモナドという仕組みであつかう",
	text "大事なことは",
	itext 4 "入出力は関数の評価とは独立しているということ",
	text "「入出力を実行する機械」を考える",
	text "その「機械」を値として結合していく",
	text "「結合」のしかたにモナドのわくぐみを使う"
	]

ioMonad2 :: Page
ioMonad2 = pageTitle "入出力" :| [
	(>>)	<$> text "機械をつなぐイメージとして、つぎのコードを示す"
		<*> nextLine,
	(>>)	<$> itext 4 "printHello >> printWorld"
		<*> nextLine,
	text "このように、入出力をする機械をつないでいくことで",
	itext 4 "実行される動作を組み立てていく",
	text "この「組み立て」に、たまたま",
	itext 4 "モナドという「わくぐみ」がぴったりだった"
	]

summary1 :: Page
summary1 = pageTitle "まとめ" :| [
	text "Haskellは美しい、Haskellは楽しい",
	text "プログラミングのセンスがみがかれる",
	text "より複雑なことにチャレンジするための道具になる",
	text "もう一度、新鮮だった、あのころの気持ちが",
	text "関数を作る構文が単純で、直観的",
	text "モナドである文脈をつける関数どうしは、合成できる",
	text "Haskellでは関数の評価時に入出力をしない",
	text "入出力は「機械」として抽象化される",
	text "「機械」どうしの結合にモナドの「わくぐみ」が使われる"
	]

book :: Page
book = pageTitle "書籍の紹介、ふたたび" :| [
	text "本当に、ちゃんと、説明しようとすると",
	(>>)
		<$> writeImageCenter
			(515 * 22 / 60, 654 * 22 / 60, "images/cover.png")
		<*> replicateM_ 10 . nextLine,
	text "この書籍の内容をすべて説明することになる"
	]

book2 :: Page
book2 = pageTitle "書籍の流れ" :| [
	writeImageMoreRight (515 / 6, 654 / 6, "images/cover.png"),
	text "まずは関数、型、多相性を説明する",
	text "タプル、リストというデータ構造を説明し",
	itext 4 "再帰について説明する",
	text "自作の型の作りかたを説明し(代数的データ型)",
	itext 4 "それらの型に共通する性質をくくりだす(型クラス)",
	text "より単純な性質からモナドまでを、説明する",
	(>>)	<$> text "入出力をあつかうやりかたとしてIOモナドを説明する"
		<*> nextLine,
	text "途中には演習問題として、やや大きめなコード例を",
	itext 4 "構文解析",
	itext 4 "XML類似の構造を解析",
	itext 4 "ライフゲーム"
	]

book3 :: Page
book3 = pageTitle "サポート"  :| [
	text "Shinjuku.hsという勉強会で読書会をはじめました",
	text "勉強会自体は月1で、隔月で読書会とする予定です",
	text "以下でサポートを行います",
	itext 4 "funpaala@gmail.com",
	itext 4 "twitter #funpaala",
	text "本、買う前でも、何かあったら、どうぞ"
	]

turtle :: Page
turtle = pageTitle "xturtle" :| [
	text "このスライドにはxturtleというパッケージを利用",
	text "いわゆるタートルグラフィック",
	\st -> let
		t = bodyTurtle st
		r = ratio st in do
		showturtle t
		speed t "slowest"
		setheading t 0
		goto t (200 * r) (300 * r)
		pendown t
		replicateM_ 4 $ forward t (100 * r) >> left t 90
		beginfill t
		replicateM_ 3 $ forward t (80 * r) >> left t 120
		endfill t
		penup t,
	\st -> let
		t = bodyTurtle st
		r = ratio st in do
		showturtle t
		speed t "slowest"
		setheading t 0
		pendown t
		pencolor t "red"
		beginfill t
		circle t (50 * r)
		endfill t
		penup t,
	\st -> let
		t = bodyTurtle st
		r = ratio st in do
		showturtle t
		speed t "slowest"
		setheading t 0
		backward t (100 * r)
		goto t (100 * r) (150 * r)
		shape t "turtle"
		shapesize t 3 3
		pencolor t "green",
	\st -> let
		t = bodyTurtle st
		r = ratio st in do
		setheading t 0
		pendown t
		forward t (100 * r)
		sleep t 1000
		pensize t 3
		forward t (100 * r)
		sleep t 1000
		pensize t 10
		forward t (100 * r)
		penup t,
	\st -> let
		t = bodyTurtle st
		r = ratio st in do
		pencolor t "darkgreen"
		pensize t 1
		setheading t 0
		goto t (50 * r) (120 * r)
		speed t "slowest"
		pendown t
		koch t (200 * r) 1
		penup t
		goto t (50 * r) (180 * r)
		speed t "slow"
		pendown t
		koch t (200 * r) 3
		penup t
		goto t (50 * r) (240 * r)
		speed t "fast"
		pendown t
		koch t (200 * r) 4
		penup t
		goto t (50 * r) (300 * r)
		speed t "fastest"
		pendown t
		koch t (200 * r) 6
		penup t,
	initTurtle
	]

turtle2 :: Page
turtle2 = pageTitle "xturtle" :| [
	text "ちなみにパッケージxturtleは自作",
	text "対話環境で対話的に試すことができる",
	text "いろいろと凝った機能を搭載",
	itext 4 "複数のタートルが並行して動く",
	itext 4 "undo機能",
	itext 4 "マウス、キー入力(日本語可)",
	itext 4 "書いた絵はSVGで出力可",
	itext 4 "PNG, JPGなど画像の表示も",
	itext 4 "タートルごとのスリープ機能",
	text "拙書の「図」もほとんど、これで作成",
	text "スライドから、お絵描きまで"
	]

turtle3 :: Page
turtle3 = pageTitle "xturtleの作成苦労話" :| [
	text "xturtleの作成のときの苦労話",
	text "X11の日本語入力のためにXIMが必要",
	itext 4 "なかったのでC言語でインターフェースを作成",
	itext 4 "Haskellからは「かんたんに」Cの関数が使える",
	text "タートルが動くときに、ちらつく",
	itext 4 "ダブルバッファリングや、画像の差分を利用",
	text "画像のぬりつぶし",
	itext 4 "単純に実装すると凹のところがうまくいかない",
	itext 4 "図形を三角形に分割するアルゴリズムが必要",
	(>>) <$> text "などなど...何のために?" <*> nextLine,
	text "「それが僕には楽しかったから」"
	]

bookbookbook :: Page
bookbookbook = pageTitle "また本の宣伝か?" :| [
	text "本当は「たたみこみ」等々も説明したいが...",
	writeImageMoreRight (515 / 6, 654 / 6, "images/cover.png"),
	text "Haskellは、どういうところがいいの?",
	itext 4 "それに対する僕の答えが、この本",
	text "ここがいい、そこがいい、と言っても",
	itext 4 "実際に「がっつり」やってもらわないと",
	itext 4 "本当の「良さ」がつたわらない",
	(>>) <$> text "ぜひぜひ" <*> nextLine,
	text "「Haskell 教養としての関数型プログラミング」",
	text "サポートサイト(工事中): https://support.funpaala.jp",
	text "サポートアドレス: funpaala@gmail.com",
	text "twitter: #funpaala"
	]

koch :: Turtle -> Double -> Int -> IO ()
koch t s 0 = forward t s
koch t s n = do
	let run = koch t (s / 3) (n - 1)
	run
	left t 60
	run
	right t 120
	run
	left t 60
	run
