module Test.Edge
  ( testEdge
  )
  where

import Prelude

import Effect (Effect)
import Main.Column (column3)
import Main.Edge (HorizontalEdge(..), VerticalEdge(..), columnEdges2, columnFromEdges, edges2, rowFromEdges)
import Main.Row (row3)
import Main.Tile (empty, left, right, (∩))
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)

testEdge :: Effect Unit
testEdge = do
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
