module MathSpec (main, spec) where

import Math

import Test.Hspec
import Test.QuickCheck


-- `main` is here so that this module can be run from GHCi on its own.  It is
-- not needed for automatic spec discovery.
main :: IO ()
main = hspec spec

spec :: Spec
spec = parallel $ do
  describe "square" $ do
    context "when used with ints" $ do
      it "is not negative" $ property $
        \x -> square x >= (0 :: Int)
      it "is even" $ property $
        \x -> square x == square (- (x :: Int) )            
      it "is not less than argument" $ property $
        \x -> square x >= (x :: Int)            

  describe "cube" $ do
    context "when used with ints" $ do
      it "is odd" $ property $
        \x -> - (cube x) == cube (- (x :: Int) )            
