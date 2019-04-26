module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Page.Profile
import Page.Top
import Router
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
    { key : Nav.Key, page : Page }


type
    Page
    -- 各ページのModelを持たせる
    = NotFound
    | TopPage Page.Top.Model
    | ProfilePage Page.Profile.Model


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        route =
            Router.urlToRoute url
    in
    goTo url { key = key, page = NotFound }


-- Update


type Msg
    = None
    | UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url
    | TopMsg Page.Top.Msg
    | ProfileMsg Page.Profile.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlRequested (Browser.Internal url) ->
            ( model, Nav.pushUrl model.key (Url.toString url) )

        UrlRequested (Browser.External url) ->
            ( model, Nav.load url )

        UrlChanged url ->
            goTo url model

        -- トップページ
        TopMsg topMsg ->
            ( model, Cmd.none )

        -- プロフィール
        ProfileMsg profileMsg ->
            ( model, Cmd.none )

        None ->
            ( model, Cmd.none )


goTo : Url.Url -> Model -> ( Model, Cmd Msg )
goTo url model =
    let
        maybeRoute =
            Router.urlToRoute url
    in
    case maybeRoute of
        Nothing ->
            ( model, Cmd.none )

        Just Router.Top ->
            let
                ( m, c ) =
                    Page.Top.init
            in
            ( { model | page = TopPage m }, Cmd.map TopMsg c )

        Just Router.Profile ->
            let
                ( m, c ) =
                    Page.Profile.init
            in
            ( { model | page = ProfilePage m }, Cmd.map ProfileMsg c )



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- View


view : Model -> Browser.Document Msg
view model =
    { title = "Hello Elm"
    , body =
        [ page model
        ]
    }

page : Model -> Html Msg
page model =
    case model.page of
        NotFound ->
            viewNotFound

        TopPage pageModel ->
            Page.Top.view pageModel |> Html.map TopMsg

        ProfilePage pageModel ->
            Page.Profile.view pageModel |> Html.map ProfileMsg

viewNotFound : Html Msg
viewNotFound =
    text "not found"