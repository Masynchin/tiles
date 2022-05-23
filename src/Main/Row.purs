module Main.Row
  ( Row
  , row1
  , row2
  , rowCompleted
  )
  where

import Prelude

import Data.Foldable (and)
import Data.List.NonEmpty (cons, singleton, snoc, zipWith)
import Data.List.Types (NonEmptyList)
import Main.Tile (Tile, connectsHorizontal, empty)

type Row = NonEmptyList Tile

rowCompleted :: Row -> Boolean
rowCompleted row = and $ zipWith connectsHorizontal (prependTile empty row) (appendTile row empty)

prependTile :: Tile -> Row -> Row
prependTile = cons

appendTile :: Row -> Tile -> Row
appendTile = snoc

row2 :: Tile -> Tile -> Row
row2 t1 t2 = prependTile t1 $ row1 t2

row1 :: Tile -> Row
row1 = singleton
