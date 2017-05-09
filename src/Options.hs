module Options (
	Option(..), getOptions
	) where

import Control.Monad
import System.Environment
import System.Console.GetOpt

data Option
	= Version
	| CountPages
	| OptRatio Double
	deriving (Show, Eq)

getOptions :: IO ([Option], [String])
getOptions = do
	(opts, noOpts, emsg) <- getOpt Permute optDescrs <$> getArgs
	when (not $ null emsg) . error $ unlines emsg
	return (opts, noOpts)

optDescrs :: [OptDescr Option]
optDescrs = [
	Option "" ["version"] (NoArg Version) "show version",
	Option "" ["count-pages"] (NoArg CountPages) "count pages",
	Option "r" ["ratio"] (ReqArg (OptRatio . read) "ratio") "set ratio"
	]
