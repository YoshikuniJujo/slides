import Data.List.NonEmpty

import Lecture

version :: Version
version = [0, 1, 0, 0]

main :: IO ()
main = runLecture version $ titlePage :| [
	]

titlePage :: Page
titlePage = writeTitle "Haskell入門ハンズオン!" "4. 代数的データ型" :| []
