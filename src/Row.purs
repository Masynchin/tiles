module Row
  ( FieldRow
  , row1
  , row2
  , rowCompleted
  )
  where

import Prelude

import Data.Foldable (and)
import Data.List (zipWith)
import Data.List.NonEmpty (cons, singleton, tail, toList)
import Data.List.Types (NonEmptyList)
import Tile (Tile, connectsHorizontal)

type FieldRow = NonEmptyList Tile

rowCompleted :: FieldRow -> Boolean
rowCompleted row = and $ zipWith connectsHorizontal (toList row) (tail row)

row2 :: Tile -> Tile -> FieldRow
row2 t1 t2 = cons t1 $ row1 t2

row1 :: Tile -> FieldRow
row1 = singleton
