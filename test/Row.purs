module Test.Row
  ( testRow
  )
  where

import Prelude

import Effect (Effect)
import Main.Row (rotateTileAt, row2, rowCompleted)
import Main.Tile (empty, left, right, top)
import Test.Unit (suite, test)
import Test.Unit.Assert (assert, assertFalse, equal)
import Test.Unit.Main (runTest)

testRow :: Effect Unit
testRow = do
  runTest do
    suite "Row" do
      suite "Completed" do
        test "on empty" do
          assert "yes" (rowCompleted $ row2 empty empty)
        test "on left and right" do
          assert "yes" (rowCompleted $ row2 right left)
      suite "Incompleted" do
        test "when one side different" do
          assertFalse "no" (rowCompleted $ row2 empty left)
          assertFalse "no" (rowCompleted $ row2 right empty)
        test "when ends open" do
          assertFalse "no" (rowCompleted $ row2 empty right)
          assertFalse "no" (rowCompleted $ row2 left empty)
          assertFalse "no" (rowCompleted $ row2 left right)
      suite "Rotates tile" do
        test "that in bounds" do
          equal (row2 top top) (rotateTileAt 0 $ row2 left top)
          equal (row2 left right) (rotateTileAt 1 $ row2 left top)
      suite "Not rotates tile" do
        test "that out of bounds" do
          equal (row2 left top) (rotateTileAt 2 $ row2 left top)
          equal (row2 left top) (rotateTileAt (-1) $ row2 left top)
