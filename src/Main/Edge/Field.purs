module Main.Edge.Field
  ( edgeField
  , toTilesField
  )
  where

import Prelude

import Data.Tuple (Tuple(..))
import Extra.NEL (transposeN)
import Main.Edge.Columns (EColumns, edgesColumnsToField)
import Main.Edge.Rows (ERows, edgesRowsToField)
import Main.Tile.Field (Field, intersectFields)

type EField = Tuple ERows EColumns

edgeField :: ERows -> EColumns -> EField
edgeField = Tuple

toTilesField :: EField -> Field
toTilesField (Tuple rows columns) =
  intersectFields (edgesRowsToField rows) (transposeN $ edgesColumnsToField columns)
