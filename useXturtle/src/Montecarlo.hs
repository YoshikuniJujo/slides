module Montecarlo (
	circleInSquare,
	runMontecarloRightTop,
	runMontecarloRightBottom
	) where

import Control.Arrow ((***))
import Control.Monad
import Control.Concurrent
import Data.Foldable
import Data.Bool
import Data.IORef
import System.Random
import Graphics.X11.Turtle

import Lecture

type Position = (Double, Double)
type Size = Double

runMontecarloRightTop :: Int -> Int -> Line
runMontecarloRightTop = runMontecarlo (2 / 3, 1 / 6) (1 / 5) 

runMontecarloRightBottom = runMontecarlo (2 / 3, 1 / 2) (1 / 5)

circleInSquare :: Position -> Size -> Line
circleInSquare (xr, yr) s st = do
	hideturtle t
	backLine st
	(x0, y0) <- position t
	goto t (width st * xr) (height st * yr)
	pendown t
	setheading t 0
	replicateM_ 4 $ forward t (s * width st) >> right t 90
	forward t $ s * width st / 2
	circle t (- s * width st / 2)
	penup t
	goto t x0 y0
	where
	t = bodyTurtle st

runMontecarlo :: Position -> Size -> Int -> Int -> Line
runMontecarlo (xr, yr) s g n st = do
	modifyIORef (needEnd st) succ
	hideturtle t
	backLine st
	(x0, y0) <- position t
	goto t (width st * xr) (height st * yr)
	pendown t
	setheading t 0
	speed t "fastest"
	flushoff t
	replicateM_ 4 $ forward t (s * width st) >> right t 90
	forward t $ s * width st / 2
	circle t (- s * width st / 2)
	penup t
	flushon t
	it <- newTurtle $ field t
	penup it >> hideturtle it >> pencolor it "red"
	goto it (x + sz + ratio st * 10) (y + ratio st * 13)
	at <- newTurtle $ field t
	penup at >> hideturtle at >> pencolor at "black"
	goto at (x + sz + ratio st * 10) (y + ratio st * 40)
	pit <- newTurtle $ field t
	penup pit >> hideturtle pit >> pencolor pit "black"
	goto pit (x + sz + ratio st * 10) (y + ratio st * 67)
	for_ (take n $ zip ps cs) $ \(xy, (ipt, apt)) -> do
		uncurry (goto t) $ convert (x, y) sz xy
		pencolor t . bool "blue" "red" $ inCircle xy
		dot t $ 1 * ratio st
		clear it; write it fontName (13 * ratio st) $ show ipt
		clear at; write at fontName (13 * ratio st) $ show apt
		clear pit; write pit fontName (13 * ratio st) . take 5 $ show
			(fromIntegral ipt / fromIntegral apt * 4 :: Double)
	pencolor t "black"
	goto t x0 y0
	_ <- forkIO $ do
		_ <- readChan $ end st
		clear it
		clear at
		clear pit
	return ()
	where
	t = bodyTurtle st
	sz = s * width st
	(x, y) = (width st * xr, height st * yr)
	xys = map (convert (x, y) sz) ps
	cs = tail $ calcs ps
	ps = points g

points :: Int -> [(Double, Double)]
points g_ = zip xs ys
	where
	xs = randomRs (-1, 1) g
	ys = randomRs (-1, 1) g'
	(g, g') = split $ mkStdGen g_

calcs :: [(Double, Double)] -> [(Int, Int)]
calcs = flip scanl (0, 0)
	(flip $ \p -> (if inCircle p then (+ 1) else id) *** (+ 1))

inCircle :: (Double, Double) -> Bool
inCircle = (<= 1) . uncurry (+) . ((^ (2 :: Int)) *** (^ (2 :: Int)))

convert :: Position -> Size -> (Double, Double) -> (Double, Double)
convert (x0, y0) s (x, y) =
	(x0 + s / 2 + s * x / 2, y0 + s / 2 + s * y / 2)
