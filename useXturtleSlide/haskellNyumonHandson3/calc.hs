import Data.Maybe (listToMaybe, fromJust)
import Data.Char (isDigit, isSpace, digitToInt)

type Parse a = String -> [(a, String)]

succeed :: a -> Parse a
succeed v inp = [(v, inp)]

check :: (Char -> Bool) -> Parse Char
check p (c : cs) | p c = [(c, cs)]
check _ _ = []

char :: Char -> Parse Char
char c = check (== c)

alt :: Parse a -> Parse a -> Parse a
(p1 `alt` p2) inp = p1 inp ++ p2 inp

build :: Parse a -> (a -> b) -> Parse b
build p f inp = [ (f x, r) | (x, r) <- p inp ]

(>@>) :: Parse a -> Parse b -> Parse (a, b)
(p1 >@> p2) inp = [ ((x, y), r') | (x, r) <- p1 inp, (y, r') <- p2 r ]

(>@) :: Parse a -> Parse b -> Parse a
p1 >@ p2 = (p1 >@> p2) `build` fst

(@>) :: Parse a -> Parse b -> Parse b
p1 @> p2 = (p1 >@> p2) `build` snd
