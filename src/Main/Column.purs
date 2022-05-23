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

type Column = NonEmptyList Tile

columnCompleted :: Column -> Boolean
columnCompleted col = and $ zipWith connectsVertical (prependTile empty col) (appendTile col empty)

prependTile :: Tile -> Column -> Column
prependTile = cons

appendTile :: Column -> Tile -> Column
appendTile = snoc

column2 :: Tile -> Tile -> Column
column2 t1 t2 = prependTile t1 $ column1 t2

column1 :: Tile -> Column
column1 = singleton
