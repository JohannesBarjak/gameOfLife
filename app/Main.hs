module Main where

import qualified GameOfLife (someFunc)

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  GameOfLife.someFunc
