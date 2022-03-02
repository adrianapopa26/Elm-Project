module Model.Event exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
import Model.Event.Category exposing (EventCategory(..))
import Model.Interval as Interval exposing (Interval)

type alias Event =
    { title : String
    , interval : Interval
    , description : Html Never
    , category : EventCategory
    , url : Maybe String
    , tags : List String
    , important : Bool
    }


categoryView : EventCategory -> Html Never
categoryView category =
    case category of
        Academic ->
            text "Academic"

        Work ->
            text "Work"

        Project ->
            text "Project"

        Award ->
            text "Award"


sortByInterval : List Event -> List Event
sortByInterval events =
    List.sortWith (\e1 e2 -> Interval.compare e1.interval e2.interval) <| events

view : Event -> Html Never
view event =
    div [classList[("event", True), ("event-important", event.important)]] [
        h4 [class "event-title"] [text event.title]
        , p [class "event-description"] [event.description]
        , p [class "event-category"] [categoryView event.category]
        , p [class "event-url"] [ a [href (Maybe.withDefault "string" event.url)][text (Maybe.withDefault "No url available" event.url)]]
        , p [class "event-interval"] [Interval.view event.interval]
    ]
