module Components.Navbar exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import View exposing (View)

view : { page : View msg } -> View msg
view { page } =
  { title = page.title
  , body =
    [ div [ class "layout" ]
      [ header []
        [ div [ class "nav" ]
          [ div [ class "container" ]
            [ div [ class "title" ]
              [ a [ href "/", class "title" ]
                  [ div [ class "square" ] []
                  , text "Untilcast"
                  ]
              ]
            , div [ class "content" ]
                [
                  -- nav
                ]
            ]
          ]
        ]
      , viewNavbar
      , div [ class "page" ]
          [ div [ class "curtain" ] []
          , div [ class "content" ] page.body
          ]
      ]
    ]
  }

viewNavbar : Html msg
viewNavbar =
  aside [ class "navbar" ]
    [ div [ class "curtain" ] []
    , a [ href "/episodes", class "disabled", disabled True ]
        [ text "Episodes" ]
    , a [ href "/about" ] [ text "About" ]
    ]
