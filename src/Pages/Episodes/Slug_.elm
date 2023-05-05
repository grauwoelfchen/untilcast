module Pages.Episodes.Slug_ exposing (Model, Msg, page)

import Components.Sidebar
import Html as H exposing (Html)
import Html.Attributes as A
import Http
import Markdown
import Page exposing (Page)
import View exposing (View)

import API
import API.Episode exposing (Episode)


page : { slug : String } -> Page Model Msg
page params =
  Page.element
  { init = init params
  , update = update
  , subscriptions = subscriptions
  , view = view params
  }

-- init

type alias Model =
  { episode : API.Data Episode
  }

init : { slug: String } -> ( Model, Cmd Msg )
init params =
  ( { episode = API.Loading }
  , API.Episode.get
      { slug = params.slug
      , onResponse = APIResponded
      }
  )

-- update

type Msg =
  APIResponded (Result Http.Error Episode)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    APIResponded (Ok episode) ->
      ( { model | episode = API.Success episode }
      , Cmd.none
      )
    APIResponded (Err httpError) ->
      ( { model | episode = API.Failure httpError }
      , Cmd.none
      )

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

view : { slug: String } -> Model -> View Msg
view params model =
  Components.Sidebar.view
    { page =
      { title = params.slug ++ " - Until"
      , body =
        [ H.p [ A.class "breadcrumbs" ]
          [ H.span [] [ H.text "/" ]
          , H.span [] [ H.a
            [ A.href "/episodes"
            , A.class "disabled"
            , A.disabled True
            ] [ H.text "episodes" ]]
          , H.span [] [ H.text "/" ]
          , H.span [] [ H.text params.slug ]
          ]
        , case model.episode of
            API.Loading ->
              H.div [ A.class "loading" ] [ H.text "Loading..." ]
            API.Success episode ->
              viewEpisode episode
            API.Failure httpError ->
              H.div [] [ H.text (API.toMessage httpError) ]
        ]
      }
    }

viewEpisode : Episode -> Html msg
viewEpisode episode =
  H.div []
    [ H.div []
      [ H.h1 [] [ H.text episode.title ]
      , H.span [ A.class "number" ]
          [ H.text ("#" ++ String.fromInt(episode.number)) ]
      , H.span [ A.class "date" ] [ H.text episode.created_at ]
      ]
    , H.ul [ A.class "tags" ]
        (List.map
          (\tag -> H.li []
            [ H.span [ A.class "tag" ] [ H.text tag ] ])
          episode.tags
        )
    , H.div []
        [
          H.div [ A.class "description" ] [ toHtml episode.description ]
        , H.div [ A.class "screencast" ] [
            H.h3 [] [ H.text "Screencast" ]
          , H.video [ A.class "video", A.controls True, A.width 770 ]
            [
              H.source [ A.src ("/video/" ++ episode.slug ++ "-"
                ++ String.replace "-" "" episode.created_at ++ ".mp4") ] []
            ]
          ]
        , H.div [ A.class "text" ]
          [ H.h3 [] [ H.text "Note" ]
          , toHtml episode.note
          ]
        ]
      ]

toHtml : String -> Html msg
toHtml s =
  -- TODO: sanitize = True
  Markdown.toHtmlWith
    {
      defaultHighlighting = Just "text"
    , sanitize = False
    , githubFlavored = Just { tables = True, breaks = False }
    , smartypants = False
    } [] s
