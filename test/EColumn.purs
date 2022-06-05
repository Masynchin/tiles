module Test.EColumn
  ( testEdgeColumn
  )
  where

import Prelude

import Effect (Effect)
import Main.Column (column3)
import Main.EColumn (VerticalEdge(..), columnEdges2, columnFromEdges)
import Main.Tile (empty, left, right, (∩))
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
            column = column3 right left empty
        equal (columnFromEdges edges) column
      test "on full" do
        let edges = columnEdges2 (VerticalEdge true) (VerticalEdge true)
            column = column3 right (left ∩ right) left
        equal (columnFromEdges edges) column
