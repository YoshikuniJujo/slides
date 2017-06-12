type Coin = Integer
type Amount = Integer
type Count = Integer

cases :: [Coin] -> Amount -> Count
cases _ am | am < 0 = 0
cases _ 0 = 1
cases [] _ = 0
cases ca@(c : cs) am = cases ca (am - c) + cases cs am

coins :: [Coin]
coins = [100, 50, 10, 5, 1]

enumerateFromTo :: Integer -> Integer -> [Integer]
enumerateFromTo f t
	| f > t = []
	| otherwise = f : enumerateFromTo (f + 1) t
