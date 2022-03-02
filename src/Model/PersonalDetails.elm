module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, id, href)


type alias DetailWithName =
    { name : String
    , detail : String
    }


type alias PersonalDetails =
    { name : String
    , contacts : List DetailWithName
    , intro : String
    , socials : List DetailWithName
    }


view : PersonalDetails -> Html msg
view details =
    div [] 
    [ 
        h1 [id "name"] [text details.name]
        , em [id "intro"] [text details.intro]
        , div [] (details.contacts |> List.map (\x -> div [class "contact-detail"] [text (x.name ++ ": " ++ x.detail)]))
        , div [] (details.socials |> List.map (\x -> div [class "social-link"] [ a [href x.detail][text x.name]]))
    ]