module Test.Edge
  ( testEdge
  )
  where

import Prelude

import Effect (Effect)
import Main.Edge (Edge(..), edges2, rowFromEdges)
import Main.Row (row3)
import Main.Tile (empty, left, right, (∩))
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)

testEdge :: Effect Unit
testEdge = do
  runTest do
    suite "Edge" do
      suite "Horizontal row" do
        test "of empty" do
          let edges = edges2 NoEdge NoEdge
              row = row3 empty empty empty
          equal (rowFromEdges edges) row
        test "of half full and empty" do
          let edges = edges2 HorizontalEdge NoEdge
              row = row3 right left empty
          equal (rowFromEdges edges) row
        test "on full" do
          let edges = edges2 HorizontalEdge HorizontalEdge
              row = row3 right (left ∩ right) left
          equal (rowFromEdges edges) row
