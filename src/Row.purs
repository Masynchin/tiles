module Row
  ( FieldRow
  , row1
  , row2
  , rowCompleted
  )
  where

import Prelude

import Data.Foldable (and)
import Data.List.NonEmpty (cons, singleton, snoc, zipWith)
import Data.List.Types (NonEmptyList)
import Tile (Tile, connectsHorizontal, empty)

type FieldRow = NonEmptyList Tile

rowCompleted :: FieldRow -> Boolean
rowCompleted row = and $ zipWith connectsHorizontal (prependTile empty row) (appendTile row empty)

prependTile :: Tile -> FieldRow -> FieldRow
prependTile = cons

appendTile :: FieldRow -> Tile -> FieldRow
appendTile = snoc

row2 :: Tile -> Tile -> FieldRow
row2 t1 t2 = prependTile t1 $ row1 t2

row1 :: Tile -> FieldRow
row1 = singleton
