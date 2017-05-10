module Montecarlo (
	runMontecarloRightTop
	) where

import Lecture

type Position = (Double, Double)
type Size = Double

runMontecarloRightTop :: Int -> Int -> Line
runMontecarloRightTop = runMontecarlo (2 / 3, 1 / 6) (1 / 6) 

runMontecarlo :: Position -> Size -> Int -> Int -> Line
runMontecarlo (x, y) s g n st = do
	backLine st
	return ()
