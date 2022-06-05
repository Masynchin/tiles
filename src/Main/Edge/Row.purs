module Main.Edge.Row
  ( ERow
  , edges2
  , rowFromEdges
  )
  where

import Prelude

import Data.List (List(..), (:))
import Data.List.NonEmpty (NonEmptyList(..), cons)
import Data.NonEmpty ((:|))
import Extra.NEL (mapFirst, nel2)
import Main.Edge.Horizontal (HorizontalEdge, leftTile, rightTile)
import Main.Tile.Row (FRow, row2)
import Main.Tile.Tile (intersect)

type ERow = NonEmptyList HorizontalEdge

rowFromEdges :: ERow -> FRow
rowFromEdges edges =
  case edges of
    (NonEmptyList (e :| Nil)) -> row2 (leftTile e) (rightTile e)
    (NonEmptyList (e :| e2 : es)) -> cons (leftTile e) $ mapFirst intersectWith rowTail
      where
        intersectWith = intersect (rightTile e)
        rowTail = rowFromEdges (NonEmptyList (e2 :| es))

edges2 :: HorizontalEdge -> HorizontalEdge -> ERow
edges2 = nel2
