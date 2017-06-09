sumN :: Integer -> Integer
sumN n = sum [1 .. n]

sumNot3N :: Integer -> Integer
sumNot3N n = sum
	$ filter ((/= 0) . (`mod` 3)) [1 .. n]

sumMod5N :: Integer -> Integer
sumMod5N n = sum $ map (`mod` 5) [1 .. n]
