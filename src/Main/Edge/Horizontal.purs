module Main.Edge.Horizontal
  ( HorizontalEdge(..)
  , leftTile
  , rightTile
  )
  where

import Prelude

import Main.Tile.Tile (Tile, empty, left, right)

newtype HorizontalEdge = HorizontalEdge Boolean

leftTile :: HorizontalEdge -> Tile
leftTile (HorizontalEdge true) = right
leftTile (HorizontalEdge false) = empty

rightTile :: HorizontalEdge -> Tile
rightTile (HorizontalEdge true) = left
rightTile (HorizontalEdge false) = empty
