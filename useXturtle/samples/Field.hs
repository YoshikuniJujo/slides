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
