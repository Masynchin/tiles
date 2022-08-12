module Main.Edge.Columns
  ( EColumns
  , edgesColumns1
  , edgesColumns2
  , edgesColumns3
  , edgesColumnsToField
  )
  where

import Prelude

import Data.List.Types (NonEmptyList)
import Extra.NEL (nel1, nel2, nel3)
import Main.Edge.Column (EColumn, columnFromEdges)
import Main.Tile.Field (Field)

-- Edges columns.
type EColumns = NonEmptyList EColumn

-- | Tiles field from Edges columns.
edgesColumnsToField :: EColumns -> Field
edgesColumnsToField = map columnFromEdges

-- | Constructor of three edges columns.
edgesColumns3 :: EColumn -> EColumn -> EColumn -> EColumns
edgesColumns3 = nel3

-- | Constructor of two edges columns.
edgesColumns2 :: EColumn -> EColumn -> EColumns
edgesColumns2 = nel2

-- | Constructor of one edge columns.
edgesColumns1 :: EColumn -> EColumns
edgesColumns1 = nel1
