module Pages.Home_ exposing (page, Model, Msg)

import Components.Navbar
import Html as H exposing (Html)
import Html.Attributes as A
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
subscriptions model =
  Sub.none

-- view

view : Model -> View Msg
view model =
  Components.Navbar.view
    { page =
      { title = "Until"
      , body =
        [ H.p [ A.class "breadcrumbs" ]
          [ H.span [] [ H.text "/" ]
          ]
        , H.h1 [] [ H.text "Recent episodes" ]
        , case model.episodes of
            API.Loading ->
              H.div [ A.class "loading" ] [ H.text "Loading..." ]
            API.Success episodes ->
              viewEpisodesList episodes
            API.Failure httpError ->
              H.div [] [ H.text (API.toMessage httpError) ]
        ]
      }
    }

viewEpisodesList : Episodes -> Html Msg
viewEpisodesList episodes =
  H.div []
    (List.indexedMap viewEpisode episodes.results)

viewEpisode : Int -> Episode -> Html Msg
viewEpisode index episode =
  H.div []
    [ H.ul []
      [ H.li [] []
      , H.li []
        [ H.a [ A.href ("/episodes/" ++ episode.slug) ]
          [ H.h2 [] [ H.text episode.title ] ]
        , H.span [ A.class "number" ]
            [ H.text ("#" ++ String.fromInt(episode.number)) ]
        , H.span [ A.class "date" ] [ H.text episode.created_at ]
        ]
      ]
    ]
