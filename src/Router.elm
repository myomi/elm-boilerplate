module Router exposing (Route(..), fromUrl)

import Url
import Url.Parser as Parser exposing (Parser, oneOf, s, top)


type Route
    = Top
    | Profile


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ Parser.map Top top
        , Parser.map Profile (s "profile")
        ]


fromUrl : Url.Url -> Maybe Route
fromUrl url =
    Parser.parse routeParser url