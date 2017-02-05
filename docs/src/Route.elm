module Route exposing (decode, Route(..))


import UrlParser exposing (Parser, parseHash, s, top, (</>))
import Navigation exposing (Location)


type Route
    = Home
    | Grid
    | Table
    | NotFound




routeParser : Parser (Route -> a) a
routeParser =
    UrlParser.oneOf
        [ UrlParser.map Home top
        , UrlParser.map Grid (s "grid")
        , UrlParser.map Table (s "table")
        ]

decode : Location -> Maybe Route
decode location =
    UrlParser.parseHash routeParser location

