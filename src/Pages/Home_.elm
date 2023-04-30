module Pages.Home_ exposing (page)

import Components.Sidebar
import Html as H exposing (Html)
import Html.Attributes as A
import View exposing (View)


page : View msg
page =
  Components.Sidebar.view
    { page =
      { title = "Until"
      , body =
        [ H.p [ A.class "breadcrumbs" ]
          [ H.span [] [ H.text "/" ]
          ]
        , H.h1 [] [ H.text "Recent episodes" ]
        , H.div []
          [ H.ul []
            [ H.li [] []
            , H.li []
              [ H.a [ A.href "/episodes/curried-function" ]
                [ H.h2 [] [ H.text "Curried function" ] ]
              , H.span [ A.class "date" ] [ H.text "2023-05-01" ]
              ]
            ]
          ]
        ]
      }
    }
