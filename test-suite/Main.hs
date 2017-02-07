-- TODO: add some testSpec & QuickChecks

import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.Hspec
import Test.Tasty.SmallCheck

import Control.Exception
import System.Timeout

import Math ( square
            , cube
            , fibonacci
            )

main :: IO ()
main = defaultMain $ testGroup "all-tests" tests

tests :: [TestTree]
tests =
  [ testGroup "square" squareTests
  , testGroup "cube" cubeTests
  , testGroup "fibonacci" fibonacciTests
  ]


squareTests :: [TestTree]
squareTests =
  [ testGroup "SmallCheck"
    [ testProperty "square . negate == square" prop_even
    ]
  , testGroup "Unit tests"
    [ testCase "square of 4 is 16" case_four
    ]
  ]

cubeTests :: [TestTree]
cubeTests =
  [ testGroup "SmallCheck"
    [ testProperty "cube . negate == negate . cube" prop_odd
    ]
  , testGroup "Unit tests"
    [ testCase "cube of -2 is -8" case_two
    ]
  ]

fibonacciTests :: [TestTree]
fibonacciTests =
  [ testGroup "SmallCheck" []
  , testGroup "Unit tests"
    [ testCase "is efficient" case_efficient
    , testCase "throws if negative input" case_throws_negative
    , testCase "starts with 1,1,2,3,5" case_starts_with
    ]
  ]

prop_even :: Int -> Bool
prop_even n = square (negate n) == (square n)

case_four :: Assertion
case_four = square 4 @?= (16 :: Int)

prop_odd :: Int -> Bool
prop_odd n = cube (negate n) == negate (cube n)

case_two :: Assertion
case_two = cube (-2) @?= -(8 :: Int)

case_efficient :: Assertion
case_efficient = timeout 10000 (evaluate $ fibonacci (32 :: Int)) `shouldReturn` Just (2178309 :: Int)

case_throws_negative :: Assertion
case_throws_negative = (evaluate $ fibonacci (-5 :: Int)) `shouldThrow` anyErrorCall

case_starts_with :: Assertion
case_starts_with = [fibonacci x | x <- ([1..5]::[Int])] `shouldBe` ([1,1,2,3,5]::[Int])
