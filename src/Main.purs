module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Tile (showTile, top)

main :: Effect Unit
main = log s
  where
    s = showTile top
