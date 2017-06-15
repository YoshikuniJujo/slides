main, addition, addition' :: IO ()
main = do
	putStrLn "Please input two numbers:"
	x <- getLine
	y <- getLine
	putStrLn (show (read x + read y))

addition =
	putStrLn "Please input two numbers:" >>
	getLine >>= \x ->
	getLine >>= \y ->
	putStrLn (show (read x + read y))

addition' = do
	putStrLn "Please input two numbers:"
	x <- getLine
	y <- getLine
	putStrLn (show (read x + read y))
