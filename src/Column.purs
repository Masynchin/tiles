module Column
  ( FieldColumn
  , column1
  , column2
  , columnCompleted
  )
  where

import Prelude

import Data.Foldable (and)
import Data.List.NonEmpty (cons, singleton, snoc, zipWith)
import Data.List.Types (NonEmptyList)
import Tile (Tile, connectsVertical, empty)

type FieldColumn = NonEmptyList Tile

columnCompleted :: FieldColumn -> Boolean
columnCompleted col = and $ zipWith connectsVertical (prependTile empty col) (appendTile col empty)

prependTile :: Tile -> FieldColumn -> FieldColumn
prependTile = cons

appendTile :: FieldColumn -> Tile -> FieldColumn
appendTile = snoc

column2 :: Tile -> Tile -> FieldColumn
column2 t1 t2 = prependTile t1 $ column1 t2

column1 :: Tile -> FieldColumn
column1 = singleton
