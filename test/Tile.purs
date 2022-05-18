module Test.Tile where

import Prelude
import Effect (Effect)
import Tile (tile, rotate)
import Test.Unit (suite, test)
import Test.Unit.Assert (equal)
import Test.Unit.Main (runTest)

main :: Effect Unit
main = do
  runTest do
    suite "Tile" do
      test "rotates 360" do
        let t = tile true false true false
        equal t (rotate $ rotate $ rotate $ rotate t)
      test "rotates once" do
        let top = tile true false false false
            left = tile false false false true
        equal left (rotate top)
