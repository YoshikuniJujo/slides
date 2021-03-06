memo
====

さて、そろそろ「Haskell入門ハンズオン #2」の準備をはじめなくては。
ということで、とりあえず、メモメモ。

前回の反省
----------

「本当のこと」を教えようと思ったが、3時間ではムリだ。
「すこしウソ」でも、ハンズオンしやすい教えかたをしたほうが良さそう。
IOのモナドとしての側面を教えるよりも、
do記法で「手続き型」とおなじように書く、やりかたを教えるほうが良さそう。
「本当のことを知りたい人は拙書へ」のように宣伝しておくのがいいかもしれない。

前回、実際に紹介できたスライドのページ数は、合計で145枚。
つまり、145枚を目安にすれば良さそうだ。

### 前回の構成

0. 事前資料のおさらい (47)
1. 多相関数を2, 3紹介 (20)
2. リストによる「くりかえし」 (21)
3. 再帰関数の定義 (15)
4. IOモナドによる入出力 (28)
5. 代数的データ型の定義 (23)
6. 電卓の例と、数当てゲームの例 (38)

I. 対話的アプリ作成用の「わくぐみ」紹介 (14)

このうち、0, 1, 2, 3, 4, Iが実際に紹介できた内容(145)。

Qiitaへの事前投稿
-----------------

Qiitaへの事前投稿は良さげだ。
「ネタバレ」になるかと思ったが、そうでもないようだ。

今回のやりかた
--------------

「網羅性」はもとめない。
シャベルカーで土をすくうのではなく、ドリルで穴をほりながら進む感じ。

TODO
----

* とりあえず前回のハンズオンのスライドを通して読んでおく
* とりあえずスライド0のスタブをつくる

構成の計画
----------

0. あいさつ、前置き 15 (14)
	* 「型」という重要な半分に触れないことをアナウンスすること
	* それ以外にも、重要な側面を、あえてとばすことのアナウンスも
1. 対話環境を使う 5 (8)
	* ここで上下左右の矢印の使いかたにふれる
	* タブ補完についても触れようかな
2. 関数、再帰、パターンマッチ 20 (11)
3. タプル、リスト、case式 20 (21)
	* つぎは、case式
4. 関数適用演算子と関数合成演算子 10 (10)
	* 演算子($), (.)
	* 使いかたを説明する
	* ここでは定義のしかたにはふれない
5. いくつかの関数を学ぶ(1) 20 (10)
	* map, filter, replicate, take, drop, reverse, (++)など
		+ このあたりで関数リテラルについて学ぶ
	* 使いかたを説明する
	* 再帰的に定義されていて、自分でも定義できるということをつたえる
		+ ここでは定義自体にはふれない
6. いくつかの関数を学ぶ(2) 20 (7)
	* randoms, mkStdGen
	* unlines
	* read
7. 入出力を学ぶ (do記法で) 15 (13)
	* 以下の関数についても触れる
		+ return, putStrLn
8. いくつかの入出力に関する関数、動作を学ぶ 10 (10)
	* putStr, print, getChar
	* getArgs
	* hGetBuffering, hSetBuffering
9. モジュールの作りかたと、単独で実行可能なアプリケーションの作りかた 10 (5)
10. 迷路ゲーム(1) 15 (33)
	* 仕様
	* 現在位置のあるターミナル上でのデータの表現
11. 迷路ゲーム(2) 10 (13)
	* 関数main
12. 書籍の宣伝 5

!!!do-let構文をどこかで説明する。

QiitaとGithubに迷路ゲームのコード全体をのせたい。

「関数を学ぶ」と「再帰関数を学ぶ」とは、いっしょにしてしまおうかな。
今回は「型」について学ばない。
「Haskellを学ぶ」のに「型」を学ばないのはおかしいが、
「ハンズオン」というコンセプトということで、「型」は大切だけど、
今回はとりあえず「値」だけに注目しましょうということ。
とすると「多相関数」を学ぶということもないかもしれない。
多相関数を学ぶかわりに、パターンマッチを追加した。

ライフゲームあたりの例を示すのはどうかな。
うーん、ライフゲームだと「周囲との比較」のところで、
なんらかの複雑またはイレギュラーなコードが必要になる。

迷路ゲーム、あるいは地底探索ゲームあたりはどうかな?

地底探索ゲームなら、比較的シンプルなコードで楽しめそうだな。

迷路ゲームとした。
