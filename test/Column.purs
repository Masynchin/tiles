module Test.Column where

import Prelude

import Effect (Effect)
import Test.Unit (suite, test)
import Test.Unit.Assert (assert)
import Test.Unit.Main (runTest)
import Column (column2, columnCompleted)
import Tile (empty)

testColumn :: Effect Unit
testColumn = do
  runTest do
    suite "Completed" do
      test "on empty" do
        let column = column2 empty empty
        assert "yes" (columnCompleted column)
