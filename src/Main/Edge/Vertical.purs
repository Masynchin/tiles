module Main.Edge.Vertical
  ( VerticalEdge(..)
  , bottomTile
  , topTile
  )
  where

import Prelude hiding (bottom, top)

import Main.Tile.Tile (Tile, bottom, empty, top)

newtype VerticalEdge = VerticalEdge Boolean

topTile :: VerticalEdge -> Tile
topTile (VerticalEdge true) = bottom
topTile (VerticalEdge false) = empty

bottomTile :: VerticalEdge -> Tile
bottomTile (VerticalEdge true) = top
bottomTile (VerticalEdge false) = empty
