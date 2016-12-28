{- | Module header documentation

This is my first module in Haskell

-}

module Lib
    ( example
    , square
    , cube
    ) where

{- | Shows Examples

-}
example :: (Num a, Show a) => a -> [String]
example x = 
    let 
        funs = 
            [ ("identity", id x)
            , ("  square", square x)
            , ("    cube", cube x)
            ]
        f x (l, y) = concat
            [ l
            , " of "
            , show x
            , " is "
            , show y    
            ]
    in
        map (f x) funs

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