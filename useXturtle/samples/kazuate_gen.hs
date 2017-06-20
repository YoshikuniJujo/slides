import System.IO (stdout, hFlush)
import System.Random (randomRIO)
import Text.Read (readMaybe)

main :: IO ()
main = do
	n0 <- randomRIO (1, 100 :: Integer)
	putStr "Guess! (1..100): "
	hFlush stdout
	doWhile_ $ do
		l <- getLine
		case readMaybe l of
			Just n	| n == n0 -> do
					putStrLn "You Win!"
					return False
				| n < n0 -> do
					putStrLn $ "Your guess, " ++
						show n ++ ", is too low."
					return True
				| n > n0 -> do
					putStrLn $ "Your guess, " ++
						show n ++ ", is too high."
					return True
			Nothing -> do
				putStr "Oops! Guess again! (1..100): "
				hFlush stdout
				return True

doWhile_ :: IO Bool -> IO ()
doWhile_ act = do
	c <- act
	if c then doWhile_ act else return ()
