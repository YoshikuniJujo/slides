addition :: IO ()
addition =
	putStrLn "Please input two numbers:" >>
	getLine >>= \x ->
	getLine >>= \y ->
	putStrLn (show (read x + read y))
