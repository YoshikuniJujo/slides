module Lecture (
	Page, Version, runLecture, writeTitle, text
	) where

import Control.Applicative
import Control.Concurrent
import Control.Concurrent.Chan
import Data.Maybe
import Data.List
import Data.List.NonEmpty (NonEmpty(..), (<|))
import Data.Function
import Data.Char
import Data.IORef
import System.Exit

import Graphics.X11.Turtle
import Options

import qualified Data.List.NonEmpty as NE

type Page = NonEmpty (State -> IO ())

type Version = [Int]

type Action = (Int, IO Setting)

data Setting = Setting {
	stRatio :: Maybe Double,
	stPageTurtle :: Maybe Turtle,
	stBodyTurtle :: Maybe Turtle,
	stAllPages :: Maybe Int,
	stPageNumber :: Maybe (IORef Int),
	stPageZipper :: Maybe (IORef (Zipper Page)),
	stPageEnd :: Maybe (IORef Bool),
	stAllEnd :: Maybe (IORef Bool),
	stClock :: Maybe (Chan ()) }

initialSetting :: Setting
initialSetting = Setting {
	stRatio = Nothing,
	stPageTurtle = Nothing,
	stBodyTurtle = Nothing,
	stAllPages = Nothing,
	stPageNumber = Nothing,
	stPageZipper = Nothing,
	stPageEnd = Nothing,
	stAllEnd = Nothing,
	stClock = Nothing }

appendSettings :: Setting -> Setting -> Setting
appendSettings s1 s2 = Setting {
	stRatio = stRatio s1 <|> stRatio s2,
	stPageTurtle = stPageTurtle s1 <|> stPageTurtle s2,
	stBodyTurtle = stBodyTurtle s1 <|> stBodyTurtle s2,
	stAllPages = stAllPages s1 <|> stAllPages s2,
	stPageNumber = stPageNumber s1 <|> stPageNumber s2,
	stPageZipper = stPageZipper s1 <|> stPageZipper s2,
	stPageEnd = stPageEnd s1 <|> stPageEnd s2,
	stAllEnd = stAllEnd s1 <|> stAllEnd s2,
	stClock = stClock s1 <|> stClock s2 }

setTurtles :: Turtle -> Turtle -> Setting -> Setting
setTurtles p t s = s {
	stPageTurtle = Just p,
	stBodyTurtle = Just t }

setAllPages :: Int -> Setting -> Setting
setAllPages p s = s { stAllPages = Just p }

setPageNumber :: IORef Int -> Setting -> Setting
setPageNumber pn s = s { stPageNumber = Just pn }

setPageZipper :: IORef (Zipper Page) -> Setting -> Setting
setPageZipper pz s = s { stPageZipper = Just pz }

setPageEnd :: IORef Bool -> Setting -> Setting
setPageEnd pe s = s { stPageEnd = Just pe }

setAllEnd :: IORef Bool -> Setting -> Setting
setAllEnd ae s = s { stAllEnd = Just ae }

setClock :: Chan () -> Setting -> Setting
setClock cl s = s { stClock = Just cl }

instance Monoid Setting where
	mempty = initialSetting
	mappend = appendSettings

getRatio :: Setting -> Double
getRatio = fromMaybe 1 . stRatio

data State = State {
	ratio :: Double,
	pageTurtle :: Turtle,
	bodyTurtle :: Turtle,
	allPages :: Int,
	pageNumber :: IORef Int,
	pageZipper :: IORef (Zipper Page),
	pageEnd :: IORef Bool,
	allEnd :: IORef Bool,
	clock :: Chan () }

settingToState :: Setting -> IO State
settingToState st = fromMaybe
	(putStrLn "Settings are not enough" >> exitFailure) $ do
		let	r = fromMaybe 1 $ stRatio st
		p <- stPageTurtle st
		t <- stBodyTurtle st
		apg <- stAllPages st
		pn <- stPageNumber st
		pz <- stPageZipper st
		pe <- stPageEnd st
		ae <- stAllEnd st
		cl <- stClock st
		return (return $ State r p t apg pn pz pe ae cl)

width, height :: State -> Double
width = (512 *) . ratio
height = (375 *) . ratio

fontName :: String
fontName = "KochiGothic"

data Zipper a = Zipper [a] (NonEmpty a) deriving Show

nonEmptyToZipper :: NonEmpty a -> Zipper a
nonEmptyToZipper = Zipper []

peekZipper :: Zipper a -> a
peekZipper (Zipper _ (x :| _)) = x

nextZipper, backZipper :: Zipper a -> Maybe (Zipper a)
nextZipper (Zipper b n) = case NE.uncons n of
	(x, Just n') -> Just $ Zipper (x : b) n'
	(_, Nothing) -> Nothing

backZipper (Zipper (x : b) n) = Just $ Zipper b (x <| n)
backZipper (Zipper [] _) = Nothing

getPage :: State -> IO Page
getPage = (peekZipper <$>) . readIORef . pageZipper

nextPage :: State -> IO ()
nextPage st = do
	z <- readIORef $ pageZipper st
	case nextZipper z of
		Just z' -> do
			writeIORef (pageZipper st) z'
			modifyIORef (pageNumber st) (+ 1)
		Nothing -> writeIORef (allEnd st) True

runLecture :: Version -> NonEmpty Page -> IO ()
runLecture v pga = do
	os <- getOptions
	st <- (mergeSettings <$>) $ sequence . map snd
		. sortBy (compare `on` fst) . map (getAction v pga) $ fst os
	fld <- openField
	topleft fld
	p <- newTurtle fld
	hideturtle p
	penup p
	t <- newTurtle fld
	hideturtle t
	penup t
	pn <- newIORef 1
	pz <- newIORef $ nonEmptyToZipper pga
	pe <- newIORef True
	ae <- newIORef False
	cl <- newChan
	stt <- settingToState
		. setClock cl
		. setAllEnd ae
		. setPageEnd pe
		. setPageZipper pz
		. setPageNumber pn
		. setAllPages (NE.length pga)
		$ setTurtles p t st
	_ <- forkIO $ runPage stt
	onkeypress fld $ \c -> do
		case c of
			'q' -> return False
			' ' -> do
				e <- readIORef $ allEnd stt
				pe <- readIORef $ pageEnd stt
				case (e, pe) of
					(False, True) -> do
						_ <- forkIO $ runPage stt
						print pe
						return ()
					(False, False) -> do
						print pe
						writeChan (clock stt) ()
						return ()
					(True, _) -> return ()
				return True
			_ -> return True

	waitField fld

runPage :: State -> IO ()
runPage st = do
	writeIORef (pageEnd st) False
	clear p >> clear t
	goto p (width st * 44 / 50) (height st * 48 / 50)
	write p fontName (12 * rt) . show =<< readIORef (pageNumber st)
	forward p (24 * rt)
	write p fontName (12 * rt) $ "/" ++ show apg
	goto t (width st / 8) (height st / 8)
	showturtle t
	sequence_ . NE.toList
		. NE.intersperse (do
			readChan $ clock st
			setheading t (- 90) >> forward t (24 * rt))
		. NE.map ($ st) =<< getPage st
	nextPage st
	sleep t 500
	hideturtle t
	writeIORef (pageEnd st) True
	where
	rt = ratio st
	p = pageTurtle st
	t = bodyTurtle st
	apg = allPages st

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
		((width st - (20 * ratio st) * myLength ttl)
			* 1 / 2)
		(height st * 1 / 2)
	write t fontName (20 * ratio st) ttl
	goto t
		((width st - (12 * ratio st) * myLength ttl)
			* 1 / 2 + 48 * ratio st)
		(height st * 1 / 2 + 20 * ratio st)
	write t fontName (12 * ratio st) sttl
	speed t "slow"
	where
	t = bodyTurtle st

text :: String -> State -> IO ()
text tx st = do
	setx  t $ width st / 8
	setheading t 0
	write t fontName (10 * ratio st) tx
	showturtle t
	speed t "slowest"
	forward t $ (10 * ratio st) * myLength tx
	hideturtle t
	where
	t = bodyTurtle st

myLength :: String -> Double
myLength "" = 0
myLength (c : cs)
	| isAscii c = 0.7 + myLength cs
	| otherwise = 1.4 + myLength cs
