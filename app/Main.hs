{-# LANGUAGE Arrows #-}
module Main where

import qualified GameOfLife (someFunc)
import FRP.Yampa

main :: IO ()
main = do
  reactimate undefined undefined undefined undefined
  GameOfLife.someFunc
