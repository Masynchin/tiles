module Column
  ( FieldColumn
  , column2
  , columnCompleted
  )
  where

import Prelude

import Data.Foldable (and)
import Data.List (zipWith)
import Data.List.NonEmpty (cons, singleton, tail, toList)
import Data.List.Types (NonEmptyList)
import Tile (Tile, connectsVertical)

type FieldColumn = NonEmptyList Tile

columnCompleted :: FieldColumn -> Boolean
columnCompleted col = and $ zipWith connectsVertical (toList col) (tail col)

column2 :: Tile -> Tile -> FieldColumn
column2 t1 t2 = cons t1 $ singleton t2
