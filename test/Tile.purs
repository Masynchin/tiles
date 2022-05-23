module Test.Tile
  ( testTile
  )
  where

import Prelude

import Effect (Effect)
import Test.Unit (suite, test)
import Test.Unit.Assert (assert, assertFalse, equal)
import Test.Unit.Main (runTest)
import Main.Tile (bottom, connectsHorizontal, connectsVertical, empty, intersect, left, right, rotate, top)

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
          equal { top: false, right: false, bottom: false, left: false } (intersect empty empty)
          equal { top: true, right: false, bottom: false, left: false } (intersect empty top)
          equal { top: true, right: false, bottom: false, left: false } (intersect top empty)
        test "when equal" do
          equal { top: false, right: true, bottom: false, left: false } (intersect right right)
        test "when different" do
          equal { top: false, right: true, bottom: false, left: true } (intersect left right)
          equal { top: true, right: false, bottom: false, left: true } (intersect top left)
        test "three" do
          equal { top: true, right: true, bottom: true, left: false } (top `intersect` right `intersect` bottom)
