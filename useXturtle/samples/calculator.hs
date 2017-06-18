type Parse a = String -> [(a, String)]

succeed :: a -> Parse a
succeed v inp = [(v, inp)]
