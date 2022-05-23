module Main.Row
  ( FRow
  , row1
  , row2
  , row3
  , rowCompleted
  , showRow
  )
  where

import Prelude

import Data.Foldable (and, foldMap)
import Data.List.NonEmpty (cons, singleton, snoc, zipWith)
import Data.List.Types (NonEmptyList)
import Main.Tile (Tile, connectsHorizontal, empty, showTile)

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
row3 t1 t2 t3 = prependTile t1 $ row2 t2 t3

-- | Constructor of row of two tiles.
row2 :: Tile -> Tile -> FRow
row2 t1 t2 = prependTile t1 $ row1 t2

-- | Constructor of row of one tile.
row1 :: Tile -> FRow
row1 = singleton

-- | String representation of Row.
showRow :: FRow -> String
showRow = foldMap showTile
