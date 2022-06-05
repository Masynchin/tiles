module Main.Edge.Vertical
  ( VerticalEdge(..)
  , bottomTile
  , topTile
  )
  where

import Prelude

import Main.Tile.Tile (Tile, empty, left, right)

newtype VerticalEdge = VerticalEdge Boolean

topTile :: VerticalEdge -> Tile
topTile (VerticalEdge true) = right
topTile (VerticalEdge false) = empty

bottomTile :: VerticalEdge -> Tile
bottomTile (VerticalEdge true) = left
bottomTile (VerticalEdge false) = empty
