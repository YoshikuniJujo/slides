import qualified Data.Map as M

-- type Memo a b = [(a, b)]
type Memo a b = M.Map a b

getResult :: Ord a => a -> Memo a b -> Maybe b
getResult = M.lookup

putResult :: Ord a => (a, b) -> Memo a b -> Memo a b
putResult = uncurry M.insert

sEmpty :: Memo a b
sEmpty = M.empty

newtype Mc s b = McD { runMc :: s -> (b, s) }

instance Functor (Mc s) where
	fmap = (=<<) . (return .)

instance Applicative (Mc s) where
	pure = return
	mf <*> mx = do f <- mf; x <- mx; return $ f x

instance Monad (Mc s) where
	return x = McD (\s -> (x, s))
	x >>= g = McD $ \s -> let (a, s1) = runMc x s in runMc (g a) s1

memo :: Ord a => (a -> Mc (Memo a b) b) -> a -> Mc (Memo a b) b
memo f n = McD $ \s -> case getResult n s of
	Just v -> (v, s)
	Nothing -> let (v, s1) = runMc (f n) s in
		(v, putResult (n, v) s1)

type MemoFunc a b = a -> Mc (Memo a b) b

mfib :: MemoFunc Int Integer
mfib 0 = return 0
mfib 1 = return 1
mfib n = do
	f1 <- memo mfib (n - 1)
	f2 <- memo mfib (n - 2)
	return $ f1 + f2

type Amount = Integer
type Coin = Integer
type Count = Integer

mcc :: MemoFunc (Amount, [Coin]) Count
mcc (0, _) = return 1
mcc (_, []) = return 0
mcc (a, ca@(c : cs))
	| a < 0 = return 0
	| otherwise = do
		n1 <- memo mcc (a - c, ca)
		n2 <- memo mcc (a, cs)
		return $ n1 + n2
