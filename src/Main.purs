module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Main.Row (row3, showRow)
import Main.Tile (bottom, left, right, top, (∩))

main :: Effect Unit
main = log $ showRow $ row3 hLeft hRight iFull
  where
    hLeft = top ∩ bottom ∩ right
    hRight = top ∩ bottom ∩ left
    iFull = top ∩ bottom
