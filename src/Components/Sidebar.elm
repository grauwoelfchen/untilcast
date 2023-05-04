module Components.Sidebar exposing (view)

import Html as H exposing (Html)
import Html.Attributes as A
import View exposing (View)


view : { page : View msg } -> View msg
view { page } =
  { title = page.title
  , body =
    [ H.div [ A.class "layout" ]
      [ viewSidebar
      , H.div [ A.class "page" ] page.body
      ]
    ]
  }

viewSidebar : Html msg
viewSidebar =
  H.aside [ A.class "sidebar" ]
    [
      H.a [ A.href "/", A.class "title" ] [ H.text "Until" ]
    , H.a [ A.href "/episodes", A.class "disabled", A.disabled True ] [ H.text "Episodes" ]
    , H.a [ A.href "/about" ] [ H.text "About" ]
    ]
