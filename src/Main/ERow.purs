module Main.ERow
  ( HorizontalEdge(..)
  , edges2
  , rowFromEdges
  )
  where

import Prelude

import Data.List (List(..), (:))
import Data.List.NonEmpty (NonEmptyList(..), cons, singleton)
import Data.NonEmpty ((:|))
import Extra.NEL (mapFirst)
import Main.Row (FRow, row2)
import Main.Tile (Tile, empty, intersect, left, right)

newtype HorizontalEdge = HorizontalEdge Boolean

type ERow = NonEmptyList HorizontalEdge

rowFromEdges :: ERow -> FRow
rowFromEdges edges =
  case edges of
    (NonEmptyList (e :| Nil)) -> row2 (leftTile e) (rightTile e)
    (NonEmptyList (e :| e2 : es)) -> cons (leftTile e) $ mapFirst intersectWith rowTail
      where
        intersectWith = intersect (rightTile e)
        rowTail = rowFromEdges (NonEmptyList (e2 :| es))

leftTile :: HorizontalEdge -> Tile
leftTile (HorizontalEdge true) = right
leftTile (HorizontalEdge false) = empty

rightTile :: HorizontalEdge -> Tile
rightTile (HorizontalEdge true) = left
rightTile (HorizontalEdge false) = empty

edges2 :: HorizontalEdge -> HorizontalEdge -> ERow
edges2 e1 e2 = cons e1 $ singleton e2
