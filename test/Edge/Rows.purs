module Test.Edge.Rows
  ( testEdgeRows
  )
  where

import Prelude

import Effect (Effect)
import Main.Edge.Horizontal (HorizontalEdge(..))
import Main.Edge.Row (edges2)
import Main.Edge.Rows (edgesRows2, edgesRowsToField)
import Main.Tile.Field (field2)
import Main.Tile.Row (row3)
import Main.Tile.Tile (empty, left, right, (∩))
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)

testEdgeRows :: Effect Unit
testEdgeRows = do
  runTest do    
    suite "Edge rows" do
      test "empty 2x2" do
        let edgesRows = edgesRows2
              (edges2 (HorizontalEdge false) (HorizontalEdge false))
              (edges2 (HorizontalEdge false) (HorizontalEdge false))
            field = field2
              (row3 empty empty empty)
              (row3 empty empty empty)
        equal (edgesRowsToField edgesRows) field
      test "full 2x2" do
        let edgesRows = edgesRows2
              (edges2 (HorizontalEdge true) (HorizontalEdge true))
              (edges2 (HorizontalEdge true) (HorizontalEdge true))
            field = field2
              (row3 right (left ∩ right) left)
              (row3 right (left ∩ right) left)
        equal (edgesRowsToField edgesRows) field
