module Test.Tile
  ( testTile
  )
  where

import Prelude

import Effect (Effect)
import Test.Unit (suite, test)
import Test.Unit.Assert (assert, assertFalse, equal)
import Test.Unit.Main (runTest)
import Tile (bottom, connectsHorizontal, connectsVertical, left, right, rotate, top)

testTile :: Effect Unit
testTile = do
  runTest do
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
