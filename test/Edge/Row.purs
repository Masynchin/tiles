module Test.Edge.Row
  ( testEdgeRow
  )
  where

import Prelude

import Effect (Effect)
import Main.Edge.Horizontal (HorizontalEdge(..))
import Main.Edge.Row (edges2, rowFromEdges)
import Main.Tile.Row (row3)
import Main.Tile.Tile (empty, left, right, (∩))
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)

testEdgeRow :: Effect Unit
testEdgeRow = do
  runTest do    
    suite "Edge row" do
      test "of empty" do
        let edges = edges2 (HorizontalEdge false) (HorizontalEdge false)
            row = row3 empty empty empty
        equal (rowFromEdges edges) row
      test "of half full and empty" do
        let edges = edges2 (HorizontalEdge true) (HorizontalEdge false)
            row = row3 right left empty
        equal (rowFromEdges edges) row
      test "on full" do
        let edges = edges2 (HorizontalEdge true) (HorizontalEdge true)
            row = row3 right (left ∩ right) left
        equal (rowFromEdges edges) row
