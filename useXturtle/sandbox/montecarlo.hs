import System.Random

randomPoints :: Int -> [(Double, Double)]
randomPoints n = let
	(g, g') = split (mkStdGen 8)
	xs = randomRs (-1, 1) g
	ys = randomRs (-1, 1) g' in
	zip xs ys
