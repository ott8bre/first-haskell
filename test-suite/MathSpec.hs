module MathSpec (main, spec) where

import Math

--import Control.Applicative
import Control.Exception
import System.Timeout

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
      it "is even" $ property $
        \x -> square x == square (- (x :: Int) )            

  describe "cube" $ do
    context "when used with ints" $ do
      it "is odd" $ property $
        \x -> - (cube x) == cube (- (x :: Int) )            

  describe "fibonacci" $ do
    it "is efficient" $ do
      timeout 10000 (evaluate $ fibonacci 32) `shouldReturn` Just 2178309
    it "is throws ErrorCall on negative argument" $ do
      (evaluate $ fibonacci (-5)) `shouldThrow` anyErrorCall