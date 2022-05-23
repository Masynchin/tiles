module Test.Field
  ( testField
  )
  where

import Prelude

import Effect (Effect)
import Main.Field (field1, field2, rotateFieldTileAt, transposeN)
import Main.Row (row1, row2)
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)
import Main.Tile (bottom, left, right, top)

testField :: Effect Unit
testField = do
  runTest do
    suite "Field" do
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
      suite "Rotates tile" do
        test "that in bounds" do
          let field = field2 (row2 top right) (row2 bottom left)
              updated00 = field2 (row2 right right) (row2 bottom left)
              updated01 = field2 (row2 top right) (row2 left left)
              updated10 = field2 (row2 top bottom) (row2 bottom left)
          equal (rotateFieldTileAt 0 0 field) updated00
          equal (rotateFieldTileAt 0 1 field) updated01
          equal (rotateFieldTileAt 1 0 field) updated10
      suite "Not rotates tile" do
        test "that out of bounds" do
          let field = field2 (row2 top right) (row2 bottom left)
          equal (rotateFieldTileAt 2 0 field) field
          equal (rotateFieldTileAt 0 2 field) field
          equal (rotateFieldTileAt (-1) 0 field) field
          equal (rotateFieldTileAt 0 (-1) field) field
