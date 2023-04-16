module Pages.Home_ exposing (page)

import Components.Sidebar
import Html exposing (Html)
import Html.Attributes as Attr
import Layouts
import View exposing (View)


page : View msg
page =
  Components.Sidebar.view
    { page =
      { title = "Until"
      , body =
        [ Html.text "/"
        , Html.h1 [] [ Html.text "Episodes" ]
        , Html.div []
          [ Html.ul []
            [ Html.li []
              [ Html.a [ Attr.href "/episode/1" ]
                [ Html.h2 [] [ Html.text "#1 TIL xxx" ] ]
              ]
            , Html.li []
              [ Html.a [ Attr.href "/episode/0" ]
                [ Html.h2 [] [ Html.text "#0 TIL xxx" ] ]
              ]
            ]
          ]
        ]
      }
    }
