module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Main.Row (row2, showRow)
import Main.Tile (left, right)

main :: Effect Unit
main = log $ showRow $ row2 right left
