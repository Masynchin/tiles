module Main.Column
  ( Column
  , column1
  , column2
  , columnCompleted
  )
  where

import Prelude

import Data.Foldable (and)
import Data.List.NonEmpty (cons, singleton, snoc, zipWith)
import Data.List.Types (NonEmptyList)
import Main.Tile (Tile, connectsVertical, empty)

-- | Column of field.
type Column = NonEmptyList Tile

-- | Is column completed. Column is completed when
-- | all its tiles connects vertically and first tile top
-- | and last tile bottom ends are open.
columnCompleted :: Column -> Boolean
columnCompleted col = and $ zipWith connectsVertical (prependTile empty col) (appendTile col empty)

-- | Add tile to start of column.
prependTile :: Tile -> Column -> Column
prependTile = cons

-- | Add tile to end of column.
appendTile :: Column -> Tile -> Column
appendTile = snoc

-- | Constructor of column of two tiles.
column2 :: Tile -> Tile -> Column
column2 t1 t2 = prependTile t1 $ column1 t2

-- | Constructor of column of one tile.
column1 :: Tile -> Column
column1 = singleton
