module Page.Top exposing (Model, Msg, init, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- Model


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



-- Update


type Msg
    = None


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( {}, Cmd.none )



-- View


view : Model -> Html Msg
view model =
    ul []
        [ viewLink "/profile" "Profile"
        , viewLink "https://elm-lang.org/" "Elm Home Page"
        ]


viewLink : String -> String -> Html Msg
viewLink path label =
    li [] [ a [ href path ] [ text label ] ]
