module Model.Event.Category exposing (EventCategory(..), SelectedEventCategories, allSelected, eventCategories, isEventCategorySelected, set, view)

import Html exposing (Html, div, input, text)
import Html.Attributes exposing (checked, class, style, type_)
import Html.Events exposing (onCheck)


type EventCategory
    = Academic
    | Work
    | Project
    | Award


eventCategories : List EventCategory
eventCategories =
    [ Academic, Work, Project, Award ]


{-| Type used to represent the state of the selected event categories
-} 
type SelectedEventCategories 
    = SelectedEventsCategories {
        academics : Bool
        , works : Bool
        , projects : Bool
        , awards : Bool }


{-| Returns an instance of `SelectedEventCategories` with all categories selected

    isEventCategorySelected Academic allSelected --> True
-}
allSelected : SelectedEventCategories
allSelected = SelectedEventsCategories {academics = True, works = True, projects = True,awards = True}
    

{-| Given a the current state and a `category` it returns whether the `category` is selected.

    isEventCategorySelected Academic allSelected --> True

-}
isEventCategorySelected : EventCategory -> SelectedEventCategories -> Bool
isEventCategorySelected category current =
    let
        (SelectedEventsCategories newCurrent) = current
    in
    case category of 
        Academic ->
                    newCurrent.academics  

        Work ->
                    newCurrent.works

        Project ->
                    newCurrent.projects

        Award ->
                    newCurrent.awards

{-| Given an `category`, a boolean `value` and the current state, it sets the given `category` in `current` to `value`.

    allSelected |> set Academic False |> isEventCategorySelected Academic --> False

    allSelected |> set Academic False |> isEventCategorySelected Work --> True

-}
set : EventCategory -> Bool -> SelectedEventCategories -> SelectedEventCategories
set category value current =
    let
        (SelectedEventsCategories newCurrent) = current
    in
    case category of 
        Academic ->
                    SelectedEventsCategories {academics = value, works = newCurrent.works, projects = newCurrent.projects, awards = newCurrent.awards}

        Work ->
                   SelectedEventsCategories {academics = newCurrent.academics, works = value, projects = newCurrent.projects, awards = newCurrent.awards}

        Project ->
                    SelectedEventsCategories {academics = newCurrent.academics, works = newCurrent.works, projects = value, awards = newCurrent.awards}

        Award ->
                    SelectedEventsCategories {academics = newCurrent.academics, works = newCurrent.works, projects = newCurrent.projects, awards = value}


checkbox : String -> Bool -> EventCategory -> Html ( EventCategory, Bool )
checkbox name state category =
    div [ style "display" "inline", class "category-checkbox" ]
    [ input [ type_ "checkbox", onCheck (\c -> ( category, c )), checked state ] []
        , text name
    ]


view : SelectedEventCategories -> Html ( EventCategory, Bool )
view model =
    let
        (SelectedEventsCategories newModel) = model
    in
    div [] [
        checkbox "Academic" newModel.academics Academic
        , checkbox "Work" newModel.works Work
        , checkbox "Project" newModel.projects Project
        , checkbox "Award" newModel.awards Award
    ]
