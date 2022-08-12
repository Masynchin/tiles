module Test.Tile.Tile
  ( testTile
  )
  where

import Prelude

import Effect (Effect)
import Test.Unit (suite, test)
import Test.Unit.Assert (assert, assertFalse, equal)
import Test.Unit.Main (runTest)
import Main.Tile.Tile (bottom, connectsHorizontal, connectsVertical, empty, left, right, rotate, top)

testTile :: Effect Unit
testTile = do
  runTest do
    suite "Tile" do
      suite "Rotates" do
        test "360" do
          equal top (rotate $ rotate $ rotate $ rotate top)
        test "once" do
          equal right (rotate top)
      suite "Connects" do
        test "horizontal" do
          assert "yes" (connectsHorizontal left right)
          assertFalse "no" (connectsHorizontal left left)
        test "vertical" do
          assert "yes" (connectsVertical top bottom)
          assertFalse "no" (connectsVertical top top)
      suite "Intersects" do
        test "with empty" do
          equal empty (empty <> empty)
          equal top (empty <> top)
          equal top (top <> empty)
        test "when equal" do
          equal right (right <> right)
        test "when different" do
          equal (left <> right) (left <> right)
          equal (top <> left) (top <> left)
        test "three" do
          equal (top <> right <> bottom) (top <> right <> bottom)
