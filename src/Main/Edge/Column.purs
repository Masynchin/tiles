module Main.Edge.Column where

import Prelude

import Data.List (List(..), (:))
import Data.List.NonEmpty (NonEmptyList(..), cons)
import Data.NonEmpty ((:|))
import Extra.NEL (mapFirst, nel2)
import Main.Edge.Vertical (VerticalEdge, bottomTile, topTile)
import Main.Tile.Column (FColumn, column2)
import Main.Tile.Tile (intersect)

type EColumn = NonEmptyList VerticalEdge

columnFromEdges :: EColumn -> FColumn
columnFromEdges edges =
  case edges of
    (NonEmptyList (e :| Nil)) -> column2 (topTile e) (bottomTile e)
    (NonEmptyList (e :| e2 : es)) -> cons (topTile e) $ mapFirst intersectWith rowTail
      where
        intersectWith = intersect (bottomTile e)
        rowTail = columnFromEdges (NonEmptyList (e2 :| es))

columnEdges2 :: VerticalEdge -> VerticalEdge -> EColumn
columnEdges2 = nel2
