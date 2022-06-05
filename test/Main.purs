module Test.Main where

import Prelude

import Effect (Effect)
import Test.Edge.Column (testEdgeColumn)
import Test.Edge.Columns (testEdgeColumns)
import Test.Edge.Row (testEdgeRow)
import Test.Edge.Rows (testEdgeRows)
import Test.Tile.Column (testColumn)
import Test.Tile.Field (testField)
import Test.Tile.Row (testRow)
import Test.Tile.Tile (testTile)

main :: Effect Unit
main = do
  testTile
  testColumn
  testRow
  testField
  testEdgeColumn
  testEdgeColumns
  testEdgeRow
  testEdgeRows
