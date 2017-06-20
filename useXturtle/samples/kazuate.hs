doWhile_ :: IO Bool -> IO ()
doWhile_ act = do
	c <- act
	if c then doWhile_ act else return ()
