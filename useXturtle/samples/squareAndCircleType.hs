type Square = ((Double, Double), Double)
type Circle = ((Double, Double), Double)

squareArea :: Square -> Double
squareArea (_, x) = x ^ 2
