module Pages.Settings exposing (page)

import Components.Sidebar
import Html as H exposing (Html)
import View exposing (View)


page : View msg
page =
  Components.Sidebar.view
    { page =
      { title = "Pages.Settings"
      , body =
        [ H.text "/settings"
        , H.h1 [] [ H.text "Settings" ]
        ]
      }
    }
