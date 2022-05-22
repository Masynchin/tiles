module Test.Field
  ( testField
  )
  where

import Prelude

import Effect (Effect)
import Field (field1, field2, transposeN)
import Row (row1, row2)
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)
import Tile (tile)

testField :: Effect Unit
testField = do
  runTest do
    suite "Transposes" do
      test "1x2" do
        let top = tile true false false false
            bottom = tile false false true false
            field = field2 (row1 top) (row1 bottom)
            transposed = field1 (row2 top bottom)
        equal (transposeN field) transposed
      test "2x1" do
        let top = tile true false false false
            bottom = tile false false true false
            field = field1 (row2 top bottom)
            transposed = field2 (row1 top) (row1 bottom)
        equal (transposeN field) transposed
      test "2x2" do
        let top = tile true false false false
            right = tile false true false false
            bottom = tile false false true false
            left = tile false false false true
            field = field2 (row2 top right) (row2 bottom left)
            transposed = field2 (row2 top bottom) (row2 right left)
        equal (transposeN field) transposed
