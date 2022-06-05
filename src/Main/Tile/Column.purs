module Main.Tile.Column
  ( FColumn
  , column1
  , column2
  , column3
  , columnCompleted
  )
  where

import Prelude

import Data.Foldable (and)
import Data.List.NonEmpty (cons, snoc, zipWith)
import Data.List.Types (NonEmptyList)
import Extra.NEL (nel1, nel2, nel3)
import Main.Tile.Tile (Tile, connectsVertical, empty)

-- | Column of field.
type FColumn = NonEmptyList Tile

-- | Is column completed. Column is completed when
-- | all its tiles connects vertically and first tile top
-- | and last tile bottom ends are open.
columnCompleted :: FColumn -> Boolean
columnCompleted col = and $ zipWith connectsVertical (prependTile empty col) (appendTile col empty)

-- | Add tile to start of column.
prependTile :: Tile -> FColumn -> FColumn
prependTile = cons

-- | Add tile to end of column.
appendTile :: FColumn -> Tile -> FColumn
appendTile = snoc

-- | Constructor of column of three tiles.
column3 :: Tile -> Tile -> Tile -> FColumn
column3 = nel3

-- | Constructor of column of two tiles.
column2 :: Tile -> Tile -> FColumn
column2 = nel2

-- | Constructor of column of one tile.
column1 :: Tile -> FColumn
column1 = nel1
