module Field where

import Data.Bool
import System.Random

width = 40
height = 20

toField ls = ([], map (\l -> ([], l)) ls)

sample = [
	[False, False, False, True, True],
	[True, False, False, False, True],
	[True, True, False, False, True],
	[True, True, True, False, False] ]

showL = map (bool ' ' '*') . reverse
showR = map (bool ' ' '*')

showLine (l, r) = showL l ++ showR r

showField (t, (l, _ : r) : b) = unlines $
	map showLine (reverse t) ++
	[showL l ++ "A" ++ showR r] ++
	map showLine b ++
	[replicate (width - 2) ' ' ++ "GOAL"]

putField = putStr . showField

downf (as, [h]) = (as, [h])
downf (as, h : bs) = (h : as, bs)

upf ([], hbs) = ([], hbs)
upf (a : as, hbs) = (as, a : hbs)

mapTuple f (x, y) = (f x, f y)

rightf = mapTuple . map $ \lhr -> case lhr of
	(_, [_]) -> lhr
	(ls, h : rs) -> (h : ls, rs)

leftf = mapTuple . map $ \lhr -> case lhr of
	([], _) -> lhr
	(l : ls, hrs) -> (ls, l : hrs)

[up, down, left, right] =
	map check [upf, downf, leftf, rightf]
	where check m f = case m f of
		(_, (_, True : _) : _) -> f
		f' -> f'
