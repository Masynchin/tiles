module Test.Row
  ( testRow
  )
  where

import Prelude

import Effect (Effect)
import Test.Unit (suite, test)
import Test.Unit.Assert (assert)
import Test.Unit.Main (runTest)
import Row (row2, rowCompleted)
import Tile (empty)

testRow :: Effect Unit
testRow = do
  runTest do
    suite "Completed" do
      test "on empty" do
        let row = row2 empty empty
        assert "yes" (rowCompleted row)
