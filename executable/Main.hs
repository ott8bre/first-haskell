module Main where

import System.Environment

import Math

main :: IO ()
main = do
  args <- getArgs
  x <- parse args
  putStrLn $ unlines $ example x

parse :: Num a => [String] -> a
parse args =
  case args of
    [] -> 0
    _  -> read $ head args
