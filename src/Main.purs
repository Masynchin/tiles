module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Tile (showTile, tile)

main :: Effect Unit
main = log s
  where
    s = showTile $ tile true true false true
