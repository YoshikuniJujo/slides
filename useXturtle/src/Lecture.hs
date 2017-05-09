module Lecture (
	Page, Version, runLecture, writeTitle
	) where

import Control.Applicative
import Data.Maybe
import Data.List
import Data.List.NonEmpty (NonEmpty(..))
import Data.Function
import System.Exit

import Graphics.X11.Turtle
import Options

import qualified Data.List.NonEmpty as NE

type Page = [Turtle -> Setting -> IO ()]

type Version = [Int]

type Action = (Int, IO Setting)

data Setting = Setting {
	ratio :: Maybe Double
	} deriving Show

initialSetting :: Setting
initialSetting = Setting {
	ratio = Nothing
	}

appendSettings :: Setting -> Setting -> Setting
appendSettings s1 s2 = Setting {
	ratio = ratio s1 <|> ratio s2
	}

instance Monoid Setting where
	mempty = initialSetting
	mappend = appendSettings

getRatio :: Setting -> Double
getRatio = fromMaybe 1 . ratio

width, height :: Setting -> Double
width = (512 *) . getRatio
height = (375 *) . getRatio

fontName :: String
fontName = "KochiGothic"

data Zipper a = Zipper [a] [a] deriving Show

runLecture :: Version -> NonEmpty Page -> IO ()
runLecture v pga@(pg :| pgs) = do
	os <- getOptions
	st <- (mergeSettings <$>) $ sequence . map snd
		. sortBy (compare `on` fst) . map (getAction v pga) $ fst os
	print st
	let	rt = getRatio st
	fld <- openField
	topleft fld
	p <- newTurtle fld
	hideturtle p
	penup p
	goto p (width st * 44 / 50) (height st * 48 / 50)
	write p fontName (12 * rt) $ show (1 :: Int)
	forward p (24 * rt)
	write p fontName (12 * rt) $ "/" ++ show (NE.length pga)
	t <- newTurtle fld
	hideturtle t
	penup t
	goto t 0 0
	showturtle t
	sequence_ $ map (($ st) . ($ t)) pg
	sleep t 500
	hideturtle t
	onkeypress fld $ \c -> do
		case c of
			'q' -> return False
			_ -> return True
	waitField fld

getAction :: Version -> NonEmpty Page -> Option -> Action
getAction v _ Version = (1, printVersion v >> exitSuccess)
getAction _ pgs CountPages = (2, print (NE.length pgs) >> exitSuccess)
getAction _ _ (OptRatio r) = (3, return $ initialSetting { ratio = Just r })

printVersion :: Version -> IO ()
printVersion v = putStrLn . intercalate "." $ map show v

mergeSettings :: [Setting] -> Setting
mergeSettings = mconcat

writeTitle :: String -> Turtle -> Setting -> IO ()
writeTitle ttl t st = do
	hideturtle t
	speed t "fastest"
	goto t
		((width st - (20 * getRatio st) * fromIntegral (length ttl))
			* 1 / 2)
		(height st * 1 / 2)
	write t fontName (20 * getRatio st) ttl
	speed t "slow"
