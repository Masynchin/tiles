module Test.Field
  ( testField
  )
  where

import Prelude

import Effect (Effect)
import Main.Field (field1, field2, transposeN)
import Main.Row (row1, row2)
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)
import Main.Tile (bottom, left, right, top)

testField :: Effect Unit
testField = do
  runTest do
    suite "Transposes" do
      test "1x2" do
        let field = field2 (row1 top) (row1 bottom)
            transposed = field1 (row2 top bottom)
        equal (transposeN field) transposed
      test "2x1" do
        let field = field1 (row2 top bottom)
            transposed = field2 (row1 top) (row1 bottom)
        equal (transposeN field) transposed
      test "2x2" do
        let field = field2 (row2 top right) (row2 bottom left)
            transposed = field2 (row2 top bottom) (row2 right left)
        equal (transposeN field) transposed
