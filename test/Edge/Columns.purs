module Test.Edge.Columns
  ( testEdgeColumns
  )
  where

import Prelude

import Effect (Effect)
import Main.Edge.Column (columnEdges2)
import Main.Edge.Columns (edgesColumns2, edgesColumnsToField)
import Main.Edge.Vertical (VerticalEdge(..))
import Main.Tile.Column (column3)
import Main.Tile.Field (field2)
import Main.Tile.Tile (empty, bottom, top, (∩))
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)

testEdgeColumns :: Effect Unit
testEdgeColumns = do
  runTest do    
    suite "Edge columns" do
      test "empty 2x2" do
        let edgesColumns = edgesColumns2
              (columnEdges2 (VerticalEdge false) (VerticalEdge false))
              (columnEdges2 (VerticalEdge false) (VerticalEdge false))
            field = field2
              (column3 empty empty empty)
              (column3 empty empty empty)
        equal (edgesColumnsToField edgesColumns) field
      test "full 2x2" do
        let edgesColumns = edgesColumns2
              (columnEdges2 (VerticalEdge true) (VerticalEdge true))
              (columnEdges2 (VerticalEdge true) (VerticalEdge true))
            field = field2
              (column3 bottom (top ∩ bottom) top)
              (column3 bottom (top ∩ bottom) top)
        equal (edgesColumnsToField edgesColumns) field
