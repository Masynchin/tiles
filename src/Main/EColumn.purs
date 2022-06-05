module Main.EColumn where

import Prelude

import Data.List (List(..), (:))
import Data.List.NonEmpty (NonEmptyList(..), cons)
import Data.NonEmpty ((:|))
import Extra.NEL (mapFirst, nel2)
import Main.Column (FColumn, column2)
import Main.Tile (Tile, empty, intersect, left, right)

newtype VerticalEdge = VerticalEdge Boolean

type EColumn = NonEmptyList VerticalEdge

columnFromEdges :: EColumn -> FColumn
columnFromEdges edges =
  case edges of
    (NonEmptyList (e :| Nil)) -> column2 (topTile e) (bottomTile e)
    (NonEmptyList (e :| e2 : es)) -> cons (topTile e) $ mapFirst intersectWith rowTail
      where
        intersectWith = intersect (bottomTile e)
        rowTail = columnFromEdges (NonEmptyList (e2 :| es))

topTile :: VerticalEdge -> Tile
topTile (VerticalEdge true) = right
topTile (VerticalEdge false) = empty

bottomTile :: VerticalEdge -> Tile
bottomTile (VerticalEdge true) = left
bottomTile (VerticalEdge false) = empty

columnEdges2 :: VerticalEdge -> VerticalEdge -> EColumn
columnEdges2 = nel2
