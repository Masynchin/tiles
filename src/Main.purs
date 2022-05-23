module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Main.Tile (showTile, top)

main :: Effect Unit
main = log $ showTile top
