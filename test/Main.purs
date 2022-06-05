module Test.Main where

import Prelude

import Effect (Effect)
import Test.Column (testColumn)
import Test.EColumn (testEdgeColumn)
import Test.ERow (testEdgeRow)
import Test.Field (testField)
import Test.Row (testRow)
import Test.Tile (testTile)

main :: Effect Unit
main = do
  testTile
  testColumn
  testRow
  testField
  testEdgeColumn
  testEdgeRow
