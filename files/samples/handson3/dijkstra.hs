{-# LANGUAGE TupleSections #-}
{-# OPTIONS_GHC -Wall -fno-warn-tabs #-}

import Control.Arrow
import Data.Maybe

data Vertex = V1 | V2 | V3 | V4 | V5 | V6 deriving (Show, Eq, Enum)

type Path = (Vertex, [(Vertex, Int)])

big :: Int
big = 9999

sample :: [Path]
sample = [
	(V1, [(V2, 7), (V3, 9), (V6, 14)]),
	(V2, [(V1, 7), (V3, 10), (V4, 15)]),
	(V3, [(V1, 9), (V2, 10), (V4, 11), (V6, 2)]),
	(V4, [(V2, 7), (V3, 11), (V5, 6)]),
	(V5, [(V4, 6), (V6, 9)]),
	(V6, [(V1, 14), (V3, 2), (V5, 9)])
	]

initList :: [(Vertex, Int)]
initList = (V1, 0) : map (, big) [V2 .. V6]

initQ :: [Vertex]
initQ = [V1 .. V6]

dijkstra :: [Vertex] -> [(Vertex, Int)] -> [(Vertex, Int)]
dijkstra [] d = d
dijkstra q d = dijkstra q' d'
	where
	(u, q') = popMinimumBy (fromMaybe big . (`lookup` d)) q
	vs = fromJust $ lookup u sample
	d0 = fromJust $ lookup u d
	d' = map (check d0 vs) d

check :: Int -> [(Vertex, Int)] -> (Vertex, Int) -> (Vertex, Int)
check d0 vs (v, d) = (v, min d d')
	where
	d' = d0 + fromMaybe big (lookup v vs)

popMinimumBy :: Ord b => (a -> b) -> [a] -> (a, [a])
popMinimumBy _ [] = error "bad"
popMinimumBy k (h : t) = dm h t
	where
	dm m [] = (m, [])
	dm m (x : xs)
		| k m <= k x = (x :) `second` dm m xs
		| otherwise = (m :) `second` dm x xs
