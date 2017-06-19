type Parse a = String -> [(a, String)]

succeed :: a -> Parse a
succeed v inp = [(v, inp)]

check :: (Char -> Bool) -> Parse Char
check p (c : cs) | p c = [(c, cs)]
check _ _ = []

char :: Char -> Parse Char
char c0 = check $ \c1 -> c1 == c0

alt :: Parse a -> Parse a -> Parse a
(p1 `alt` p2) inp = p1 inp ++ p2 inp
