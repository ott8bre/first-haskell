module Main where

import System.Environment
import Text.Read
import Math

main :: IO ()
main = do
  args <- getArgs
  putStrLn $ unlines $ exec args

exec ::  [String] -> [String]
exec args =
  case args of
    [] ->
      exampleI 0
    (x:_)  ->
      --let r = readMaybe x in
      case readMaybe x :: Maybe Int of
        Just i ->
          exampleI i
        Nothing ->
          case readMaybe x :: Maybe Double of
            Just d -> exampleF d
            Nothing -> []
