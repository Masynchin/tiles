module Main.Edge.Column
  ( EColumn
  , columnEdges2
  , columnEdges3
  , columnFromEdges
  )
  where

import Prelude

import Data.List (List(..), (:))
import Data.List.NonEmpty (NonEmptyList(..), cons)
import Data.NonEmpty ((:|))
import Extra.NEL (mapFirst, nel2, nel3)
import Main.Edge.Vertical (VerticalEdge, bottomTile, topTile)
import Main.Tile.Column (FColumn, column2)

type EColumn = NonEmptyList VerticalEdge

columnFromEdges :: EColumn -> FColumn
columnFromEdges edges =
  case edges of
    (NonEmptyList (e :| Nil)) -> column2 (topTile e) (bottomTile e)
    (NonEmptyList (e :| e2 : es)) -> cons (topTile e) $ mapFirst intersectWith rowTail
      where
        intersectWith = append (bottomTile e)
        rowTail = columnFromEdges (NonEmptyList (e2 :| es))

columnEdges3 :: VerticalEdge -> VerticalEdge -> VerticalEdge -> EColumn
columnEdges3 = nel3

columnEdges2 :: VerticalEdge -> VerticalEdge -> EColumn
columnEdges2 = nel2
