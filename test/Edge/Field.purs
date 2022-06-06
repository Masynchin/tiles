module Test.Edge.Field
  ( testEdgeField
  )
  where

import Prelude

import Effect (Effect)
import Main.Edge.Column (columnEdges2)
import Main.Edge.Columns (edgesColumns2)
import Main.Edge.Field (edgeField, toTilesField)
import Main.Edge.Horizontal (HorizontalEdge(..))
import Main.Edge.Row (edges2)
import Main.Edge.Rows (edgesRows2)
import Main.Edge.Vertical (VerticalEdge(..))
import Main.Tile.Field (field3)
import Main.Tile.Row (row3)
import Main.Tile.Tile (empty, bottom, left, right, top, (∩))
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)

testEdgeField :: Effect Unit
testEdgeField = do
  runTest do    
    suite "Edge field" do
      test "empty 2x2" do
        let edgesField = edgeField (
            edgesRows2
              (edges2 (HorizontalEdge false) (HorizontalEdge false))
              (edges2 (HorizontalEdge false) (HorizontalEdge false))) (
            edgesColumns2
              (columnEdges2 (VerticalEdge false) (VerticalEdge false))
              (columnEdges2 (VerticalEdge false) (VerticalEdge false)))
            field = field3
              (row3 empty empty empty)
              (row3 empty empty empty)
              (row3 empty empty empty)
        equal (toTilesField edgesField) field
      test "full 2x2" do
        let edgesField = edgeField (
            edgesRows2
              (edges2 (HorizontalEdge true) (HorizontalEdge true))
              (edges2 (HorizontalEdge true) (HorizontalEdge true))) (
            edgesColumns2
              (columnEdges2 (VerticalEdge true) (VerticalEdge true))
              (columnEdges2 (VerticalEdge true) (VerticalEdge true)))
            field = field3
              (row3 (right ∩ bottom) (left ∩ right) (left ∩ bottom))
              (row3 (right ∩ bottom ∩ top) (left ∩ top ∩ bottom ∩ right) (left ∩ top ∩ bottom))
              (row3 (right ∩ top) (left ∩ top ∩ right) (left ∩ top))
        equal (toTilesField edgesField) field
