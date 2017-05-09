import System.Environment
import System.Console.GetOpt

main :: IO ()
main = do
	opts <- getOpt Permute optDescr <$> getArgs
	print opts

data Option
	= Version
	deriving Show

optDescr :: [OptDescr Option]
optDescr = [
	Option "v" ["version"] (NoArg Version) "version"
	]
