module Test.Main where

import Prelude

import Effect (Effect)
import Test.Column (testColumn)
import Test.Edge (testEdge)
import Test.Field (testField)
import Test.Row (testRow)
import Test.Tile (testTile)

main :: Effect Unit
main = do
  testTile
  testColumn
  testRow
  testField
  testEdge
