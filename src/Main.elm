module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Url


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = UrlRequested
        , onUrlChange = UrlChanged
        , view = view
        }



-- Model


type alias Model =
    {}


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( {}, Cmd.none )



-- Update


type Msg
    = None
    | UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlRequested (Browser.Internal url) ->
            ( {}, Cmd.none )

        UrlRequested (Browser.External href) ->
            ( {}, Cmd.none )

        UrlChanged url ->
            ( {}, Cmd.none )

        None ->
            ( {}, Cmd.none )



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- View


view : Model -> Browser.Document Msg
view model =
    { title = "Hello Elm"
    , body =
        [ div [] [ text "hello" ]
        ]
    }
