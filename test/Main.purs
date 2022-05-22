module Test.Main where

import Prelude

import Effect (Effect)
import Test.Field (testField)
import Test.Row (testRow)
import Test.Tile (testTile)

main :: Effect Unit
main = do
  testTile
  testRow
  testField
