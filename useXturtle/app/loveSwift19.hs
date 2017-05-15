module Main where

import Data.List.NonEmpty

import Lecture
import LoveSwift19.SelfIntroduction
import LoveSwift19.Book
import LoveSwift19.Haskell

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = do
	runLecture version $ titlePage :|
		selfIntroduction ++
		book ++
		haskell ++ [
		]

titlePage :: Page
titlePage =
	writeTitle "Swiftの中心で、Haskellをさけぶ" "第19回 Swift愛好会" :| []
