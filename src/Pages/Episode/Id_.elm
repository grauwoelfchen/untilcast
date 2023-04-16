module Pages.Episode.Id_ exposing (page)

import Components.Sidebar
import Html exposing (Html)
import View exposing (View)


page : { id : String } -> View msg
page params =
  Components.Sidebar.view
    { page =
      { title = "Pages.Episode.Id_"
      , body = [ Html.text ("/episode/" ++ params.id) ]
      }
    }
