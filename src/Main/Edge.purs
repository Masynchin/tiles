module Main.Edge
  ( Edge(..)
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
import Main.Row (FRow)
import Main.Tile (Tile, empty, intersect, left, right)

data Edge = HorizontalEdge | NoEdge

type ERow = NonEmptyList Edge

rowFromEdges :: ERow -> FRow
rowFromEdges edges =
  case edges of
    (NonEmptyList (e :| Nil)) -> fromTuple $ toTiles e
    (NonEmptyList (e :| e2 : es)) -> cons (leftTile e) $ mapFirst intersectWith rowTail
      where
        intersectWith = intersect (rightTile e)
        rowTail = rowFromEdges (NonEmptyList (e2 :| es))

leftTile :: Edge -> Tile
leftTile HorizontalEdge = right
leftTile NoEdge = empty

rightTile :: Edge -> Tile
rightTile HorizontalEdge = left
rightTile NoEdge = empty

toTiles :: Edge -> Tuple Tile Tile
toTiles HorizontalEdge = Tuple right left
toTiles NoEdge = Tuple empty empty

edges2 :: Edge -> Edge -> ERow
edges2 e1 e2 = cons e1 $ singleton e2
