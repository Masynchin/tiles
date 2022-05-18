module Tile
  ( rotate
  , showTile
  , tile
  )
  where

type Tile =
  { top    :: Boolean
  , right  :: Boolean
  , bottom :: Boolean
  , left   :: Boolean
  }

tile :: Boolean -> Boolean -> Boolean -> Boolean -> Tile
tile top right bottom left = { top: top, right: right, bottom: bottom, left: left }

showTile :: Tile -> String
showTile { top: false, right: false, bottom: false, left: false } = " "
showTile { top: false, right: false, bottom: false, left: true } = "╴"
showTile { top: false, right: false, bottom: true, left: false } = "╵"
showTile { top: false, right: true, bottom: false, left: false } = "╶"
showTile { top: true, right: false, bottom: false, left: false } = "╷"
showTile { top: false, right: true, bottom: false, left: true } = "─"
showTile { top: true, right: false, bottom: true, left: false } = "│"
showTile { top: false, right: true, bottom: true, left: false } = "┌"
showTile { top: true, right: true, bottom: false, left: false } = "└"
showTile { top: false, right: false, bottom: true, left: true } = "┐"
showTile { top: true, right: false, bottom: false, left: true } = "┘"
showTile { top: false, right: true, bottom: true, left: true } = "┬"
showTile { top: true, right: false, bottom: true, left: true } = "┤"
showTile { top: true, right: true, bottom: false, left: true } = "┴"
showTile { top: true, right: true, bottom: true, left: false } = "├"
showTile { top: true, right: true, bottom: true, left: true } = "┼"

rotate :: Tile -> Tile
rotate { top, right, bottom, left } = { top: left, right: top, bottom: right, left: bottom }
