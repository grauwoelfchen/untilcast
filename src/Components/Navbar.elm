module Components.Navbar exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Route.Path
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
              [ a [ Route.Path.href Route.Path.Home_
                  , class "title"
                  ]
                  [ div [ class "square" ] []
                  , text "Untilcats"
                  ]
              ]
            , div [ class "content" ]
                [ -- nav
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
    , a [ Route.Path.href Route.Path.Home_ ]
        [ text "Episodes" ]
    , a [ Route.Path.href Route.Path.About ]
        [ text "About" ]
    ]
