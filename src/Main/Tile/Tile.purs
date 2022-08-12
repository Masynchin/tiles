module Main.Tile.Tile
  ( Tile
  , bottom
  , connectsHorizontal
  , connectsVertical
  , empty
  , left
  , right
  , rotate
  , top
  )
  where

import Prelude

-- | Build block of field.
newtype Tile = Tile
  { top    :: Boolean
  , right  :: Boolean
  , bottom :: Boolean
  , left   :: Boolean
  }

-- | Show for Tile.
-- |
-- | Used in web repsentation.
instance showTile :: Show Tile where
  show = case _ of
    Tile { top: false, right: false, bottom: false, left: false } -> " "
    Tile { top: false, right: false, bottom: false, left: true } -> "╴"
    Tile { top: false, right: false, bottom: true, left: false } -> "╵"
    Tile { top: false, right: true, bottom: false, left: false } -> "╶"
    Tile { top: true, right: false, bottom: false, left: false } -> "╷"
    Tile { top: false, right: true, bottom: false, left: true } -> "─"
    Tile { top: true, right: false, bottom: true, left: false } -> "│"
    Tile { top: false, right: true, bottom: true, left: false } -> "┌"
    Tile { top: true, right: true, bottom: false, left: false } -> "└"
    Tile { top: false, right: false, bottom: true, left: true } -> "┐"
    Tile { top: true, right: false, bottom: false, left: true } -> "┘"
    Tile { top: false, right: true, bottom: true, left: true } -> "┬"
    Tile { top: true, right: false, bottom: true, left: true } -> "┤"
    Tile { top: true, right: true, bottom: false, left: true } -> "┴"
    Tile { top: true, right: true, bottom: true, left: false } -> "├"
    Tile { top: true, right: true, bottom: true, left: true } -> "┼"

-- | Equal for Tile
-- |
-- | Tiles are equal if all their edges are equal.
instance eqTile :: Eq Tile where
  eq (Tile t1) (Tile t2) = eq t1 t2

-- | Semigroup for Tile.
-- |
-- | Tile behaves as semigroup in terms of intersection.
instance semigroupTile :: Semigroup Tile where
  append (Tile t1) (Tile t2) = Tile
    { top: t1.top || t2.top
    , right: t1.right || t2.right
    , bottom: t1.bottom || t2.bottom
    , left: t1.left || t2.left
    }

-- | Rotate Tile. All edges shifts clockwise.
rotate :: Tile -> Tile
rotate (Tile t) = Tile { top: t.left, right: t.top, bottom: t.right, left: t.bottom }

-- | Is two tiles connects vertically.
connectsVertical :: Tile -> Tile -> Boolean
connectsVertical (Tile t) (Tile b) = t.bottom == b.top

-- | Is two tiles connects horizontally.
connectsHorizontal :: Tile -> Tile -> Boolean
connectsHorizontal (Tile l) (Tile r) = l.right == r.left

-- | Empty record for Tile.
-- |
-- | It used for constructing other Tile's
-- | by changing on of its directions
-- | like in the `top` or `right`.
template :: { top :: Boolean , right :: Boolean , bottom :: Boolean , left :: Boolean }
template = { top: false, right: false, bottom: false, left: false}

-- | Tile with no edges.
empty :: Tile
empty = Tile template

-- | Tile with top edge.
top :: Tile
top = Tile (template { top = true })

-- | Tile with right edge.
right :: Tile
right = Tile (template { right = true })

-- | Tile with bottom edge.
bottom :: Tile
bottom = Tile (template { bottom = true })

-- | Tile with left edge.
left :: Tile
left = Tile (template { left = true })
