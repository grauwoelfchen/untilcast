module Components.Sidebar exposing (view)

import Html exposing (Html)
import Html.Attributes as Attr
import View exposing (View)


view : { page : View msg } -> View msg
view { page } =
  { title = page.title
  , body =
    [ Html.div [ Attr.class "layout" ]
      [ viewSidebar
      , Html.div [ Attr.class "page" ] page.body
      ]
    ]
  }

viewSidebar : Html msg
viewSidebar =
  Html.aside [ Attr.class "sidebar" ]
    [ Html.a [ Attr.href "/" ] [ Html.text "Episodes" ]
    , Html.a [ Attr.href "/settings" ] [ Html.text "Settings" ]
    ]
