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

type Memo = [(([Integer], Integer), Integer)]
type Memoized = Memo -> (Integer, Memo)

ret :: Integer -> Memoized
ret x = \m -> (x, m)

memo :: (([Integer], Integer) -> Memoized) -> ([Integer], Integer) -> Memoized
memo f n s = case lookup n s of
	Just v -> (v, s)
	Nothing -> let (v, s1) = f n s in (v, (n, v) : s1)

mcases :: ([Integer], Integer) -> Memoized
mcases (_, am) | am < 0 = ret 0
mcases (_, 0) = ret 1
mcases ([], _) = ret 0
mcases (ca@(c : cs), a) = \s -> let
	(n1, s1) = memo mcases (ca, a - c) s
	(n2, s2) = memo mcases (cs, a) s1 in
	ret (n1 + n2) s2
