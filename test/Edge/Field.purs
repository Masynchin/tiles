module Test.Edge.Field
  ( testEdgeField
  )
  where

import Prelude hiding (bottom, top)

import Effect (Effect)
import Main.Edge.Column (columnEdges1)
import Main.Edge.Columns (edgesColumns3)
import Main.Edge.Field (edgeField, toTilesField)
import Main.Edge.Horizontal (HorizontalEdge(..))
import Main.Edge.Row (edges2)
import Main.Edge.Rows (edgesRows2)
import Main.Edge.Vertical (VerticalEdge(..))
import Main.Tile.Field (field2)
import Main.Tile.Row (row3)
import Main.Tile.Tile (empty, bottom, left, right, top)
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)

testEdgeField :: Effect Unit
testEdgeField = do
  runTest do    
    suite "Edge field" do
      test "to empty 3x2" do
        let edgesField = edgeField (
            edgesRows2
              (edges2 (HorizontalEdge false) (HorizontalEdge false))
              (edges2 (HorizontalEdge false) (HorizontalEdge false))) (
            edgesColumns3
              (columnEdges1 (VerticalEdge false))
              (columnEdges1 (VerticalEdge false))
              (columnEdges1 (VerticalEdge false)))
            field = field2
              (row3 empty empty empty)
              (row3 empty empty empty)
        equal (toTilesField edgesField) field
      test "full 2x2" do
        let edgesField = edgeField (
            edgesRows2
              (edges2 (HorizontalEdge true) (HorizontalEdge true))
              (edges2 (HorizontalEdge true) (HorizontalEdge true))) (
            edgesColumns3
              (columnEdges1 (VerticalEdge true))
              (columnEdges1 (VerticalEdge true))
              (columnEdges1 (VerticalEdge true)))
            field = field2
              (row3 (right <> bottom) (left <> bottom <> right) (left <> bottom))
              (row3 (right <> top) (left <> top <> right) (left <> top))
        equal (toTilesField edgesField) field
