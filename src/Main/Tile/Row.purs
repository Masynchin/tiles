module Main.Tile.Row
  ( FRow
  , rotateTileAt
  , row1
  , row2
  , row3
  , rowCompleted
  , showRow
  )
  where

import Prelude

import Data.Foldable (and, foldMap)
import Data.List.NonEmpty (cons, modifyAt, snoc, zipWith)
import Data.List.Types (NonEmptyList)
import Data.Maybe (Maybe(..))
import Extra.NEL (nel1, nel2, nel3)
import Main.Tile.Tile (Tile, connectsHorizontal, empty, rotate)

-- | Row of field.
type FRow = NonEmptyList Tile

-- | Is row completed. Row is completed when
-- | all its tiles connects horizonally and first tile left
-- | and last tile right ends are open. 
rowCompleted :: FRow -> Boolean
rowCompleted row = and $ zipWith connectsHorizontal (prependTile empty row) (appendTile row empty)

-- | Add tile to start of row.
prependTile :: Tile -> FRow -> FRow
prependTile = cons

-- | Add tile to end of row.
appendTile :: FRow -> Tile -> FRow
appendTile = snoc

row3 :: Tile -> Tile -> Tile -> FRow
row3 = nel3

-- | Constructor of row of two tiles.
row2 :: Tile -> Tile -> FRow
row2 = nel2

-- | Constructor of row of one tile.
row1 :: Tile -> FRow
row1 = nel1

-- | String representation of Row.
showRow :: FRow -> String
showRow = foldMap show

-- | Rotate tile with index.
rotateTileAt :: Int -> FRow -> FRow
rotateTileAt x row =
  case modifyAt x rotate row of
    Just rotated -> rotated
    Nothing -> row
