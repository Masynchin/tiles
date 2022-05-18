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
      test "rotates" do
        equal t (rotate $ rotate $ rotate $ rotate t)
        where
          t = tile true false true false
