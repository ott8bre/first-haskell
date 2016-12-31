module Main where

import System.Environment

import Math

main :: IO ()
main = do 
  args <- getArgs
  let 
    x = case args of
      [] -> 0.0
      _  -> read $ args !! 0
  putStrLn $ unlines $ example $ x
