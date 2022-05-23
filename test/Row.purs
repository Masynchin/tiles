module Test.Row
  ( testRow
  )
  where

import Prelude

import Effect (Effect)
import Row (row2, rowCompleted)
import Test.Unit (suite, test)
import Test.Unit.Assert (assert, assertFalse)
import Test.Unit.Main (runTest)
import Tile (empty, left, right)

testRow :: Effect Unit
testRow = do
  runTest do
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
