import System.Random

points :: Int -> [(Double, Double)]
points x = let
	(g, g') = split (mkStdGen x)
	xs = randomRs (-1, 1) g
	ys = randomRs (-1, 1) g' in
	zip xs ys

inCircle :: (Double, Double) -> Bool
inCircle (x, y) = x ^ 2 + y ^ 2 <= 1

guessPi :: Int -> Int -> Double
guessPi x n = let
	ps = take n (points x)
	is = filter inCircle ps in
	4 * fromIntegral (length is) / fromIntegral (length ps)
