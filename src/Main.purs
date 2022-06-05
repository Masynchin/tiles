module Main where

import Prelude

import Data.Array (fromFoldable)
import Data.FunctorWithIndex (mapWithIndex)
import Effect (Effect)
import Flame (QuerySelector(..), Html)
import Flame.Application.NoEffects as FAN
import Flame.Html.Attribute as HA
import Flame.Html.Element as HE
import Main.Tile.Field (Field, field2, rotateFieldTileAt)
import Main.Tile.Row (FRow, row3)
import Main.Tile.Tile (Tile, bottom, left, right, showTile, top, (∩))

type Model = Field

init :: Model
init = field2 row row
  where
    hLeft = top ∩ bottom ∩ right
    hRight = top ∩ bottom ∩ left
    iFull = top ∩ bottom
    row = row3 hLeft hRight iFull

data Message = Rotate Int Int

update :: Model -> Message -> Model
update model =
  case _ of
    Rotate x y -> rotateFieldTileAt x y model

view :: Model -> Html Message
view model = HE.main "main" [renderField model]

renderField :: Field -> Html Message
renderField field = HE.table_ $ fromFoldable $ mapWithIndex renderRow field

renderRow :: Int -> FRow -> Html Message
renderRow y row = HE.tr_ $ fromFoldable $ mapWithIndex (renderTile y) row

renderTile :: Int -> Int -> Tile -> Html Message
renderTile y x tile = HE.td [HA.onClick $ Rotate x y] $ HE.text (showTile tile)

main :: Effect Unit
main = FAN.mount_ (QuerySelector "body") app
  where
    app = { init
          , subscribe: []
          , update
          , view
          }
