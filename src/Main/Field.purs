module Main.Field
  ( Field
  , field1
  , field2
  , isComplete
  , rotateFieldTileAt
  , transposeN
  )
  where

import Prelude

import Data.Foldable (all)
import Data.List (transpose)
import Data.List.NonEmpty (cons, cons', fromList, head, modifyAt, singleton, tail, toList)
import Data.List.Types (NonEmptyList)
import Data.Maybe (Maybe(..))
import Data.Traversable (sequence)
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

-- | Transpose for NonEmptyList (NonEmptyList a).
transposeN :: forall a. NonEmptyList (NonEmptyList a) -> NonEmptyList (NonEmptyList a)
transposeN xss =
  case sequence $ fromList <$> tails of
    Nothing -> singleton heads
    Just tss -> cons' heads tss
    where
      heads = head <$> xss
      tails = transpose <<< toList $ tail <$> xss

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
