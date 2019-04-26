module Router exposing (Route(..), urlToRoute)

import Url
import Url.Parser exposing (Parser, map, oneOf, parse, s, top)


type Route
    = Top
    | Profile


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Top top
        , map Profile (s "profile")
        ]


urlToRoute : Url.Url -> Maybe Route
urlToRoute url =
    parse routeParser url