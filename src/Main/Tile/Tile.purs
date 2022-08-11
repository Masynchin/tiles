module Main.Tile.Tile
  ( (∩)
  , Tile
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

-- | Build block of field.
type Tile =
  { top    :: Boolean
  , right  :: Boolean
  , bottom :: Boolean
  , left   :: Boolean
  }

-- | String representation of Tile.
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

-- | Rotate Tile. All edges shifts clockwise.
rotate :: Tile -> Tile
rotate t = { top: t.left, right: t.top, bottom: t.right, left: t.bottom }

-- | Is two tiles connects vertically.
connectsVertical :: Tile -> Tile -> Boolean
connectsVertical t b = t.bottom == b.top

-- | Is two tiles connects horizontally.
connectsHorizontal :: Tile -> Tile -> Boolean
connectsHorizontal l r = l.right == r.left

-- | Tile with no edges.
empty :: Tile
empty = { top: false, right: false, bottom: false, left: false}

-- | Tile with top edge.
top :: Tile
top = empty { top = true }

-- | Tile with right edge.
right :: Tile
right = empty { right = true }

-- | Tile with bottom edge.
bottom :: Tile
bottom = empty { bottom = true }

-- | Tile with left edge.
left :: Tile
left = empty { left = true }

-- | New tile of intersection of two others.
intersect :: Tile -> Tile -> Tile
intersect t1 t2 =
  { top: t1.top || t2.top
  , right: t1.right || t2.right
  , bottom: t1.bottom || t2.bottom
  , left: t1.left || t2.left
  }

infixl 5 intersect as ∩
