-- | Example of a library file. It is also used for testing the test suites.
module Math
    (
      -- * Exported functions
      exampleI
    , exampleF
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


-- | Squares a 'Num' value.
--
--  Examples:
--
--  >>> square (5 :: Int)
--  25
--
--  Properties:
--
--  prop> square (-x) == (square x)
--
square :: Num a => a -- ^ value to increment
                -> a -- ^ result
square x = x*x

{- | Cubes a number

>>> cube (2 :: Int)
8

-}
cube :: Num a => a -> a
cube x = x*x*x

{- | Fibonacci sequence

-}
fibonacci :: Integral a => a -> a
fibonacci n = fromInteger $ fibs !! ( fromIntegral n :: Int)
  where fibs = 0 : 1 : zipWith (+) fibs (tail fibs)
