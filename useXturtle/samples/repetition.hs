sumN :: Integer -> Integer
sumN n = sum [1 .. n]

sumNot3N :: Integer -> Integer
sumNot3N n = sum
	$ filter ((/= 0) . (`mod` 3)) [1 .. n]

sumMod5N :: Integer -> Integer
sumMod5N n = sum $ map (`mod` 5) [1 .. n]

coins :: [Integer]
coins = [500, 100, 50, 10, 5, 1]

cases :: [Integer] -> Integer -> Integer
cases _ am | am < 0 = 0
cases _ 0 = 1
cases [] _ = 0
cases ca@(c : cs) am = cases ca (am - c) + cases cs am

type Amount = Integer
type Coin = Integer
type Count = Integer

type Memo = [(([Coin], Amount), Count)]
type Memoized = Memo -> (Count, Memo)

memo :: (([Coin], Amount) -> Memoized) -> ([Coin], Amount) -> Memoized
memo f k m = case lookup k m of
	Just v -> (v, m)
	Nothing -> let (v, m1) = f k m in (v, (k, v) : m1)

mcases :: ([Coin], Amount) -> Memoized
mcases (_, am) m | am < 0 = (0, m)
mcases (_, 0) m = (1, m)
mcases ([], _) m = (0, m)
mcases (ca@(c : cs), a) m = let
	(n1, m1) = memo mcases (ca, a - c) m
	(n2, m2) = memo mcases (cs, a) m1 in
	(n1 + n2, m2)
