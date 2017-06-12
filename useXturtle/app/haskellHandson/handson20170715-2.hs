import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	whatsRecursion, sumN, listVsRecursion,
	amount, amount2, amount3,
	structureOfList, structureOfList2, repetition,
	enumeration, enumeration2, filterRec, mapRec
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン!" "2. 再帰" :| []

whatsRecursion :: Page
whatsRecursion = pageTitle "再帰とは" :| [
	text "関数の定義のなかに、その関数自体が出てくる",
	text "「くりかえし」は再帰で表現できる",
	text "単純な「くりかえし」以上のことも表現できる"
	]

sumN :: Page
sumN = pageTitle "1からNまでの和" :| [
	text "1からNまでの和を、再帰で定義すると",
	itext 4 "1. 1から1までの和は1",
	itext 4 "2. 1からNまでの和は",
	itext 8 "1からN - 1までの和に、Nを足したもの",
	text "コードを書く",
	itext 4 "% vim recursion.hs",
	itext 4 "sumN 1 = 1",
	itext 4 "sumN n = sumN (n - 1) + n",
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load recursion.hs",
	itext 4 "*Main> sumN 10",
	itext 4 "55"
	]

listVsRecursion :: Page
listVsRecursion = pageTitle "単純な「くりかえし」でない例" :| [
	text "単純な「くりかえし」には、リストが使える",
	text "直接、再帰を使うよりも、リストのほうがわかりやすい",
	text "単純な「くりかえし」ではないような例を考える",
	text "1円玉から100円玉を使って200円をはらう、はらいかたの数",
	text "どう考えるか?",
	text "200円のはらいかたを分類すると、つぎのふたつ",
	itext 4 "1. 100円玉を1枚以上使う",
	itext 4 "2. 100円玉を使わない",
	text "1は、1円玉から100円玉を使って100をはらう",
	itext 4 "はらいかたの数に等しい",
	text "わかりますか?"
	]

amount :: Page
amount = pageTitle "お金のはらいかた" :| [
	text "1円玉から100円玉を使って200円をはらうとは",
	itext 4 "1円玉から100円玉を使って100円をはらう、と",
	itext 4 "1円玉から50円玉を使って200円はらう",
	text "ということ",
	text "それぞれについて、さらに分類していくことができる",
	text "コードにしてみましょう。まず、型シノニムを定義する",
	itext 4 "% vim recursion.hs",
	itext 4 "type Coin = Integer",
	itext 4 "type Amount = Integer",
	itext 4 "type Count = Integer"
	]

amount2 :: Page
amount2 = pageTitle "お金のはらいかた" :| [
	text "関数の本体を書きます",
	itext 4 "% vim recursion.hs",
	itext 4 "cases :: [Coin] -> Amount -> Count",
	itext 4 "cases _ am | am < 0 = 0",
	itext 4 "cases _ 0 = 1",
	itext 4 "cases ca@(c : cs) am =",
	itext 8 "cases ca (am - c) + cases cs am",
	text "100円玉から1円玉までのコインを定義します",
	itext 4 "% vim recursion.hs",
	itext 4 "coins :: [Coin]",
	itext 4 "coins = [100, 50, 10, 5, 1]"
	]

amount3 :: Page
amount3 = pageTitle "お金のはらいかた" :| [
	text "試してみましょう",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load recursion.hs",
	itext 4 "*Main> cases coins 200",
	itext 4 "1014",
	text "1円玉から100円玉で200円を作る作りかたは1014通り",
	text "この関数は、処理の流れが直線ではなく、樹構造",
	text "リストではなく、直接、再帰を使うほうが書きやすい"
	]

structureOfList :: Page
structureOfList = pageTitle "リストの構造" :| [
	text "ここで、話はすこし変わって、リストの構造について",
	text "リストは、つぎのように作ることができる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> 3 : 2 : 8 : 5 : 1 : []",
	itext 4 "[3,2,8,5,1]",
	text "「空リスト」と「先頭への要素の追加」だけで",
	itext 4 "リストは作成できる",
	text "そのように見える",
	text "しかし、本当は、そのように「作成されている」のではなく",
	text "リストは本質的に、空リストに値が追加されていったもの",
	text "[3,2,8,5,1]のような表示は、「読みやすく表示」しただけ"
	]

structureOfList2 :: Page
structureOfList2 = pageTitle "リストの構造" :| [
	text "リストは、つぎのような形で保存されていると考えていい",
	itext 4 "3 : 2 : 8 : 5 : 1 : []",
	text "演算子(:)は右結合",
	text "丸括弧を明示するなら、つぎのようになるだろう",
	itext 4 "3 : (2 : (8 : (5 : (1 : []))))",
	text "なので、このリストから5を取り出そうとすると",
	itext 4 "3, 2, 8を、つぎつぎに削っていく必要がある",
	text "リストは、要素を前から順に使っていくのに向いている"
	]

repetition :: Page
repetition = pageTitle "リストによる「くりかえし」" :| [
	text "リストによる「くりかえし」に使われる4つの段階",
	itext 4 "1. 列挙",
	itext 4 "2. ろ過",
	itext 4 "3. 転写",
	itext 4 "4. 集計",
	text "「2. ろ過」と「3. 転写」は順不同で、複数あってもいい",
	text "これらの操作自体が再帰的に定義される"
	]

enumeration :: Page
enumeration = pageTitle "列挙" :| [
	text "1からNまでの整数を要素とするリストの作成",
	text "これは、「列挙」のひとつ",
	text "これを再帰を使って定義してみよう",
	itext 4 "% vim recursion.hs",
	itext 4 "enumerateFromTo ::",
	itext 8 "Integer -> Integer -> [Integer]",
	itext 4 "enumerateFromTo f t",
	itext 8 "| f > t = []",
	itext 8 "| otherwise =",
	itext 12 "f : enumerateFromTo (f + 1) t"
	]

enumeration2 :: Page
enumeration2 = pageTitle "列挙" :| [
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load recursion.hs",
	itext 4 "*Main> enumerateFromTo 1 10",
	itext 4 "[1,2,3,4,5,6,7,8,9,10]"
	]

filterRec :: Page
filterRec = pageTitle "ろ過" :| [
	text "ろ過関数filterも定義してみる",
	itext 4 "% vim recursion.hs",
	itext 4 "myFilter :: (a -> Bool) -> [a] -> [a]",
	itext 4 "myFilter p (x : xs)",
	itext 8 "| p x = x : myFilter p xs",
	itext 8 "| otherwise = myFilter p xs",
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load recursion.hs",
	itext 4 "*Main> myFilter ((/= 0) . (`mod` 3)) [1 .. 10]",
	itext 4 "[1,2,4,5,7,8,10]"
	]

mapRec :: Page
mapRec = pageTitle "転写" :| [
	text "転写関数mapも定義してみる",
	itext 4 "% vim recursion.hs",
	itext 4 "myMap :: (a -> b) -> [a] -> [b]",
	itext 4 "myMap _ [] = []",
	itext 4 "myMap f (x : xs) = f x : myMap f xs",
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "Prelude> :load recursion.hs",
	itext 4 "*Main> myMap (`mod` 5) [1 .. 10]",
	itext 4 "[1,2,3,4,0,1,2,3,4,0]"
	]
