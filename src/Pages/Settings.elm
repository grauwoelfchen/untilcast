module Pages.Settings exposing (page)

import Components.Sidebar
import Html exposing (Html)
import Layouts
import View exposing (View)


page : View msg
page =
  Components.Sidebar.view
    { page =
      { title = "Pages.Settings"
      , body =
        [ Html.text "/settings"
        , Html.h1 [] [ Html.text "Settings" ]
        ]
      }
    }
