module Extra.NEL
  ( mapFirst
  , nel1
  , nel2
  , nel3
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

-- | NonEmptyList of one element.
nel1 :: forall a. a -> NonEmptyList a
nel1 = singleton

-- | NonEmptyList of two elements.
nel2 :: forall a. a -> a -> NonEmptyList a
nel2 a1 = cons a1 <<< nel1

-- | NonEmptyList of three elements.
nel3 :: forall a. a -> a -> a -> NonEmptyList a
nel3 a1 a2 = cons a1 <<< nel2 a2
