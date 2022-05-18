module Test.Tile
  ( testTile
  )
  where

import Prelude

import Effect (Effect)
import Test.Unit (suite, test)
import Test.Unit.Assert (assert, assertFalse, equal)
import Test.Unit.Main (runTest)
import Tile (connectsHorizontal, connectsVertical, rotate, tile)

testTile :: Effect Unit
testTile = do
  runTest do
    suite "Rotates" do
      test "360" do
        let t = tile true false true false
        equal t (rotate $ rotate $ rotate $ rotate t)
      test "once" do
        let top = tile true false false false
            right = tile false true false false
        equal right (rotate top)
    suite "Connects" do
      test "horizontal" do
        let left = tile false false false true
            right = tile false true false false
        assert "yes" (connectsHorizontal left right)
        assertFalse "no" (connectsHorizontal left left)
      test "vertical" do
        let top = tile true false false false
            bottom = tile false false true false
        assert "yes" (connectsVertical top bottom)
        assertFalse "no" (connectsVertical top top)
