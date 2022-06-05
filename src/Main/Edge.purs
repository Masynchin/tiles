module Main.Edge
  ( HorizontalEdge(..)
  , VerticalEdge(..)
  , columnEdges2
  , columnFromEdges
  , edges2
  , rowFromEdges
  )
  where

import Prelude

import Data.List (List(..), (:))
import Data.List.NonEmpty (NonEmptyList(..), cons, singleton)
import Data.NonEmpty ((:|))
import Data.Tuple (Tuple(..))
import Extra.NEL (fromTuple, mapFirst)
import Main.Column (FColumn, column2)
import Main.Row (FRow)
import Main.Tile (Tile, empty, intersect, left, right)

newtype HorizontalEdge = HorizontalEdge Boolean

type ERow = NonEmptyList HorizontalEdge

rowFromEdges :: ERow -> FRow
rowFromEdges edges =
  case edges of
    (NonEmptyList (e :| Nil)) -> fromTuple $ toTiles e
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

toTiles :: HorizontalEdge -> Tuple Tile Tile
toTiles (HorizontalEdge true) = Tuple right left
toTiles (HorizontalEdge false) = Tuple empty empty

edges2 :: HorizontalEdge -> HorizontalEdge -> ERow
edges2 e1 e2 = cons e1 $ singleton e2

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
columnEdges2 e1 e2 = cons e1 $ singleton e2
