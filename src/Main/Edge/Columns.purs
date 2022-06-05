module Main.Edge.Columns
  ( edgesColumns2
  , edgesColumnsToField
  )
  where

import Prelude

import Data.List.Types (NonEmptyList)
import Extra.NEL (nel2)
import Main.Edge.Column (EColumn, columnFromEdges)
import Main.Tile.Field (Field)

-- Edges columns.
type EColumns = NonEmptyList EColumn

-- | Tiles field from Edges columns.
edgesColumnsToField :: EColumns -> Field
edgesColumnsToField = map columnFromEdges

-- | Constructor of two edges columns.
edgesColumns2 :: EColumn -> EColumn -> EColumns
edgesColumns2 = nel2
