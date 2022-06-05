module Test.Edge.Column
  ( testEdgeColumn
  )
  where

import Prelude

import Effect (Effect)
import Main.Edge.Column (columnEdges2, columnFromEdges)
import Main.Edge.Vertical (VerticalEdge(..))
import Main.Tile.Column (column3)
import Main.Tile.Tile (bottom, empty, top, (∩))
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)

testEdgeColumn :: Effect Unit
testEdgeColumn = do
  runTest do
    suite "Edge column" do
      test "of empty" do
        let edges = columnEdges2 (VerticalEdge false) (VerticalEdge false)
            column = column3 empty empty empty
        equal (columnFromEdges edges) column
      test "of half full and empty" do
        let edges = columnEdges2 (VerticalEdge true) (VerticalEdge false)
            column = column3 bottom top empty
        equal (columnFromEdges edges) column
      test "on full" do
        let edges = columnEdges2 (VerticalEdge true) (VerticalEdge true)
            column = column3 bottom (top ∩ bottom) top
        equal (columnFromEdges edges) column
