import System.Environment (getArgs)
import System.IO (openFile, hIsEOF, hGetLine, IOMode(..))

main :: IO ()
main = do
	fp : _ <- getArgs
	h <- openFile fp ReadMode
	doWhile_ $ do
		e <- hIsEOF h
		if e then return False else do
			l0 <- hGetLine h
			putStrLn l0
			doWhile_ $ do
				l1 <- getLine
				return $ l1 /= l0
			return True

doWhile_ :: IO Bool -> IO ()
doWhile_ act = do
	b <- act
	if b then doWhile_ act else return ()
