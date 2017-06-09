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
