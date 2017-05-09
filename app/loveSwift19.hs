module Main where

import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = do
	runLecture version ([writeTitle "Swiftの中心で、Haskellをさけぶ"] :| [])
