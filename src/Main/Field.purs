module Main.Field
  ( Field
  , columns
  , field1
  , field2
  , isComplete
  , rotateFieldTileAt
  )
  where

import Prelude

import Data.Foldable (all)
import Data.List.NonEmpty (cons, modifyAt, singleton)
import Data.List.Types (NonEmptyList)
import Data.Maybe (Maybe(..))
import Extra.NEL (transposeN)
import Main.Column (FColumn, columnCompleted)
import Main.Row (FRow, rotateTileAt, rowCompleted)

-- | Field.
type Field = NonEmptyList FRow

-- | Is all field rows and columns completed.
isComplete :: Field -> Boolean
isComplete field = (all rowCompleted field) && (all columnCompleted $ columns field)

-- | Columns of field.
columns :: Field -> NonEmptyList FColumn
columns = transposeN

-- | Constructor of field of two rows.
field2 :: FRow -> FRow -> Field
field2 r1 r2 = cons r1 $ field1 r2

-- | Constructor of field of one row.
field1 :: FRow -> Field
field1 = singleton

-- | Rotate tile with coordinates.
rotateFieldTileAt :: Int -> Int -> Field -> Field
rotateFieldTileAt x y field =
  case modifyAt y (rotateTileAt x) field of
    Just updated -> updated
    Nothing -> field
