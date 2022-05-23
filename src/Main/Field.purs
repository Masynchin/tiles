module Main.Field
  ( Field
  , field1
  , field2
  , isComplete
  , transposeN
  )
  where

import Prelude

import Main.Column (Column, columnCompleted)
import Data.Foldable (all)
import Data.List (transpose)
import Data.List.NonEmpty (cons, cons', fromList, head, singleton, tail, toList)
import Data.List.Types (NonEmptyList)
import Data.Maybe (Maybe(..))
import Data.Traversable (sequence)
import Main.Row (Row, rowCompleted)

type Field = NonEmptyList Row

isComplete :: Field -> Boolean
isComplete field = (all rowCompleted field) && (all columnCompleted $ columns field)

columns :: Field -> NonEmptyList Column
columns = transposeN

transposeN :: forall a. NonEmptyList (NonEmptyList a) -> NonEmptyList (NonEmptyList a)
transposeN xss =
  case sequence $ fromList <$> tails of
    Nothing -> singleton heads
    Just tss -> cons' heads tss
    where
      heads = head <$> xss
      tails = transpose <<< toList $ tail <$> xss

field2 :: Row -> Row -> Field
field2 r1 r2 = cons r1 $ field1 r2

field1 :: Row -> Field
field1 = singleton
