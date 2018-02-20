module Main where

import Data.List.NonEmpty
import Graphics.X11.Slide

version :: Version
version = [0, 0, 0, 1]

main :: IO ()
main = runSlide version someSlide

someSlide :: Slide
someSlide = title :| [
	prelude
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #3" "0. はじめに" :| []

prelude :: Page
prelude = pageTitle "自己紹介" :| [
	text "おあつまりいただき、ありがとうございます"
	]
