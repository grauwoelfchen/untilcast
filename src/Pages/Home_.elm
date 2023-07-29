module Pages.Home_ exposing (page, Model, Msg)

import Components.Navbar
import Html exposing (..)
import Html.Attributes exposing (..)
import Http
import Page exposing (Page)
import View exposing (View)

import API
import API.Episodes exposing (Episode, Episodes)

page : Page Model Msg
page =
  Page.element
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }

-- init

type alias Model =
  { episodes : API.Data Episodes
  }


init : ( Model, Cmd Msg )
init =
  ( { episodes = API.Loading }
  , API.Episodes.getRecent
      { onResponse = APIResponded
      }
  )

-- update

type Msg
  = APIResponded (Result Http.Error Episodes)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    APIResponded (Ok episodes) ->
      ( { model | episodes = API.Success episodes }
      , Cmd.none
      )
    APIResponded (Err httpError) ->
      ( { model | episodes = API.Failure httpError }
      , Cmd.none
      )

-- subscriptions

subscriptions: Model -> Sub Msg
subscriptions _ =
  Sub.none

-- view

view : Model -> View Msg
view model =
  Components.Navbar.view
    { page =
      { title = "Untilcast"
      , body =
        [ p [ class "breadcrumbs" ]
          [ span [] [ text "/" ]
          ]
        , h1 [] [ text "Recent episodes" ]
        , case model.episodes of
            API.Loading ->
              div [ class "loading" ] [ text "Loading..." ]
            API.Success episodes ->
              viewEpisodesList episodes
            API.Failure httpError ->
              div [] [ text (API.toMessage httpError) ]
        ]
      }
    }

viewEpisodesList : Episodes -> Html Msg
viewEpisodesList episodes =
  div []
    (List.indexedMap viewEpisode episodes.results)

viewEpisode : Int -> Episode -> Html Msg
viewEpisode _ episode =
  div []
    [ ul []
      [ li [] []
      , li []
        [ a [ href ("/episodes/" ++ episode.slug) ]
          [ h2 [] [ text episode.title ] ]
        , span [ class "number" ]
            [ text ("#" ++ String.fromInt(episode.number)) ]
        , span [ class "date" ] [ text episode.created_at ]
        ]
      ]
    ]
