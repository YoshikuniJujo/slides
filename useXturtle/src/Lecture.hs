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

type Page = [State -> IO ()]

type Version = [Int]

type Action = (Int, IO Setting)

data Setting = Setting {
	stRatio :: Maybe Double,
	stPageTurtle :: Maybe Turtle,
	stBodyTurtle :: Maybe Turtle,
	stAllPages :: Maybe Int }

initialSetting :: Setting
initialSetting = Setting {
	stRatio = Nothing,
	stPageTurtle = Nothing,
	stBodyTurtle = Nothing,
	stAllPages = Nothing }

appendSettings :: Setting -> Setting -> Setting
appendSettings s1 s2 = Setting {
	stRatio = stRatio s1 <|> stRatio s2,
	stPageTurtle = stPageTurtle s1 <|> stPageTurtle s2,
	stBodyTurtle = stBodyTurtle s1 <|> stBodyTurtle s2,
	stAllPages = stAllPages s1 <|> stAllPages s2 }

setTurtles :: Turtle -> Turtle -> Setting -> Setting
setTurtles p t s = s {
	stPageTurtle = Just p,
	stBodyTurtle = Just t }

setAllPages :: Int -> Setting -> Setting
setAllPages p s = s { stAllPages = Just p }

instance Monoid Setting where
	mempty = initialSetting
	mappend = appendSettings

getRatio :: Setting -> Double
getRatio = fromMaybe 1 . stRatio

data State = State {
	ratio :: Double,
	pageTurtle :: Turtle,
	bodyTurtle :: Turtle,
	allPages :: Int }

settingToState :: Setting -> IO State
settingToState st = fromMaybe
	(putStrLn "Settings are not enough" >> exitFailure) $ do
		let	r = fromMaybe 1 $ stRatio st
		p <- stPageTurtle st
		t <- stBodyTurtle st
		ap <- stAllPages st
		return (return $ State r p t ap)

width, height :: State -> Double
width = (512 *) . ratio
height = (375 *) . ratio

fontName :: String
fontName = "KochiGothic"

data Zipper a = Zipper [a] [a] deriving Show

runLecture :: Version -> NonEmpty Page -> IO ()
runLecture v pga@(pg :| pgs) = do
	os <- getOptions
	st <- (mergeSettings <$>) $ sequence . map snd
		. sortBy (compare `on` fst) . map (getAction v pga) $ fst os

	let	rt = getRatio st
	fld <- openField
	topleft fld
	p <- newTurtle fld
	hideturtle p
	penup p
	t <- newTurtle fld
	hideturtle t
	penup t
	stt <- settingToState . setAllPages (NE.length pga) $ setTurtles p t st
	runPage stt pg
	onkeypress fld $ \c -> do
		case c of
			'q' -> return False
			_ -> return True

	waitField fld

runPage :: State -> Page -> IO ()
runPage st pg = do
	goto p (width st * 44 / 50) (height st * 48 / 50)
	write p fontName (12 * rt) $ show (1 :: Int)
	forward p (24 * rt)
	write p fontName (12 * rt) $ "/" ++ show ap
	goto t 0 0
	showturtle t
	sequence_ $ map ($ st) pg
	sleep t 500
	hideturtle t
	where
	rt = ratio st
	p = pageTurtle st
	t = bodyTurtle st
	ap = allPages st

getAction :: Version -> NonEmpty Page -> Option -> Action
getAction v _ Version = (1, printVersion v >> exitSuccess)
getAction _ pgs CountPages = (2, print (NE.length pgs) >> exitSuccess)
getAction _ _ (OptRatio r) = (3, return $ initialSetting { stRatio = Just r })

printVersion :: Version -> IO ()
printVersion v = putStrLn . intercalate "." $ map show v

mergeSettings :: [Setting] -> Setting
mergeSettings = mconcat

writeTitle :: String -> String -> State -> IO ()
writeTitle ttl sttl st = do
	hideturtle t
	speed t "fastest"
	goto t
		((width st - (20 * ratio st) * fromIntegral (length ttl))
			* 1 / 2)
		(height st * 1 / 2)
	write t fontName (20 * ratio st) ttl
	goto t
		((width st - (12 * ratio st) * fromIntegral (length ttl))
			* 1 / 2 + 48 * ratio st)
		(height st * 1 / 2 + 20 * ratio st)
	write t fontName (12 * ratio st) sttl
	speed t "slow"
	where
	t = bodyTurtle st
