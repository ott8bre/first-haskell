{- | Module header documentation

This is my first module in Haskell

-}

module Math
    ( exampleI, exampleF
    , square
    , cube
    , fibonacci
    ) where

nums :: Num a => [(String, a -> a)]
nums =
  [ (" identity", id)
  , ("   square", square)
  , ("     cube", cube)
--          , ("fibonacci", fibonacci $ round x)
  ]

integrals :: Integral a => [(String, a -> a)]
integrals =
  [ ("fibonacci", fibonacci)
  ]


display :: Show a => a -> (String, a -> a) -> String
display x (l, f) = concat [ l, " of ", show x, " is ", show $ f x]

{- | Shows Examples

-}
exampleF :: (Fractional a, Show a) => a -> [String]
exampleF x = map (display x) nums

exampleI :: (Integral a, Show a) => a -> [String]
exampleI x = map (display x) $ nums ++ integrals


{- | Squares a number

>>> square -1
1

-}
square :: Num a => a -> a
square x = x*x

{- | Cubes a number

>>> cube -1
-1

-}
cube :: Num a => a -> a
cube x = x*x*x

{- | Fibonacci sequence

-}
fibonacci :: Integral a => a -> a
fibonacci n = fromInteger $ fibs !! ( fromIntegral n :: Int)
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
