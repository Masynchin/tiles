module Test.Column where

import Prelude

import Effect (Effect)
import Test.Unit (suite, test)
import Test.Unit.Assert (assert, assertFalse)
import Test.Unit.Main (runTest)
import Main.Column (column2, columnCompleted)
import Main.Tile (bottom, empty, top)

testColumn :: Effect Unit
testColumn = do
  runTest do
    suite "Column" do
      suite "Completed" do
        test "on empty" do
          assert "yes" (columnCompleted $ column2 empty empty)
        test "on top and bottom" do
          assert "yes" (columnCompleted $ column2 bottom top)
      suite "Incompleted" do
        test "when one side different" do
          assertFalse "no" (columnCompleted $ column2 empty top)
          assertFalse "no" (columnCompleted $ column2 bottom empty)
        test "when ends open" do
          assertFalse "no" (columnCompleted $ column2 empty bottom)
          assertFalse "no" (columnCompleted $ column2 top empty)
          assertFalse "no" (columnCompleted $ column2 top bottom)
