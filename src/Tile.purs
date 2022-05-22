module Tile
  ( Tile
  , bottom
  , connectsHorizontal
  , connectsVertical
  , empty
  , intersect
  , left
  , right
  , rotate
  , showTile
  , top
  )
  where

import Prelude

type Tile =
  { top    :: Boolean
  , right  :: Boolean
  , bottom :: Boolean
  , left   :: Boolean
  }

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
rotate t = { top: t.left, right: t.top, bottom: t.right, left: t.bottom }

connectsVertical :: Tile -> Tile -> Boolean
connectsVertical t b = t.bottom == b.top

connectsHorizontal :: Tile -> Tile -> Boolean
connectsHorizontal l r = l.right == r.left

empty :: Tile
empty = { top: false, right: false, bottom: false, left: false}

top :: Tile
top = { top: true, right: false, bottom: false, left: false}

right :: Tile
right = { top: false, right: true, bottom: false, left: false}

bottom :: Tile
bottom = { top: false, right: false, bottom: true, left: false}

left :: Tile
left = { top: false, right: false, bottom: false, left: true}

intersect :: Tile -> Tile -> Tile
intersect t1 t2 =
  { top: t1.top || t2.top
  , right: t1.right || t2.right
  , bottom: t1.bottom || t2.bottom
  , left: t1.left || t2.left
  }
