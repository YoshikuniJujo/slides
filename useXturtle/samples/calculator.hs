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

build :: Parse a -> (a -> b) -> Parse b
build p f inp =
	[ (f x, r) | (x, r) <- p inp ]

(>@>) :: Parse a -> Parse b -> Parse (a, b)
(p1 >@> p2) inp = [ ((x, y), r') |
	(x, r) <- p1 inp, (y, r') <- p2 r ]
