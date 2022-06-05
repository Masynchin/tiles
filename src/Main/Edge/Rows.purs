module Main.Edge.Rows
  ( edgesRows1
  , edgesRows2
  , edgesRowsToField
  )
  where

import Prelude

import Data.List.NonEmpty (NonEmptyList)
import Extra.NEL (nel1, nel2)
import Main.Edge.Row (ERow, rowFromEdges)
import Main.Tile.Field (Field)

-- Edges rows.
type ERows = NonEmptyList ERow

-- | Tiles field from Edges rows.
edgesRowsToField :: ERows -> Field
edgesRowsToField = map rowFromEdges

-- | Constructor of two edges rows.
edgesRows2 :: ERow -> ERow -> ERows
edgesRows2 = nel2

-- | Constructor of one edge row.
edgesRows1 :: ERow -> ERows
edgesRows1 = nel1
