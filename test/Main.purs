module Test.Main where

import Prelude

import Effect (Effect)
import Test.Tile (testTile)

main :: Effect Unit
main = do
  testTile
