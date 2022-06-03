module Extra.NEL
  ( fromTuple
  , mapFirst
  )
  where

import Prelude

import Data.List.NonEmpty (cons, singleton)
import Data.List.Types (NonEmptyList(..))
import Data.NonEmpty ((:|))
import Data.Tuple (Tuple, fst, snd)

-- | NonEmptyList from Tuple.
fromTuple :: forall a. Tuple a a -> NonEmptyList a
fromTuple pair = cons (fst pair) (singleton $ snd pair)

mapFirst :: forall a. (a -> a) -> NonEmptyList a -> NonEmptyList a
mapFirst f (NonEmptyList (x :| xs)) = NonEmptyList ((f x) :| xs)
