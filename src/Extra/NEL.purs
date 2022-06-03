module Extra.NEL
  ( fromTuple
  , mapFirst
  , transposeN
  )
  where

import Prelude

import Data.List (transpose)
import Data.List.NonEmpty (cons, cons', fromList, head, singleton, tail, toList)
import Data.List.Types (NonEmptyList(..))
import Data.Maybe (Maybe(..))
import Data.NonEmpty ((:|))
import Data.Traversable (sequence)
import Data.Tuple (Tuple, fst, snd)

-- | NonEmptyList from Tuple.
fromTuple :: forall a. Tuple a a -> NonEmptyList a
fromTuple pair = cons (fst pair) (singleton $ snd pair)

mapFirst :: forall a. (a -> a) -> NonEmptyList a -> NonEmptyList a
mapFirst f (NonEmptyList (x :| xs)) = NonEmptyList ((f x) :| xs)

-- | Transpose for NonEmptyList (NonEmptyList a).
transposeN :: forall a. NonEmptyList (NonEmptyList a) -> NonEmptyList (NonEmptyList a)
transposeN xss =
  case sequence $ fromList <$> tails of
    Nothing -> singleton heads
    Just tss -> cons' heads tss
    where
      heads = head <$> xss
      tails = transpose <<< toList $ tail <$> xss
