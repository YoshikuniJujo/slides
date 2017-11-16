import System.Environment

getAbsolute = do
	c <- getLine
	return $ read c + 273

printArgs = do
	as <- getArgs
	print as
