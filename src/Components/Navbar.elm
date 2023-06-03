module Components.Navbar exposing (view)

import Html as H exposing (Html)
import Html.Attributes as A
import View exposing (View)


view : { page : View msg } -> View msg
view { page } =
  { title = page.title
  , body =
    [ H.div [ A.class "layout" ]
      [
        H.header []
          [
            H.div [ A.class "nav" ]
              [
                H.div [ A.class "container" ]
                  [
                    H.div [ A.class "title" ]
                      [
                        H.a [ A.href "/", A.class "title" ]
                          [
                            H.div [ A.class "square" ] []
                          , H.text "Untilcast"
                          ]
                      ]
                  , H.div [ A.class "content" ]
                      [
                        -- nav
                      ]
                  ]
              ]
          ]
      , viewNavbar
      , H.div [ A.class "page" ]
          [
            H.div [ A.class "curtain" ] []
          , H.div [ A.class "content" ] page.body
          ]
      ]
    ]
  }

viewNavbar : Html msg
viewNavbar =
  H.aside [ A.class "navbar" ]
    [
      H.div [ A.class "curtain" ] []
    , H.a [ A.href "/episodes", A.class "disabled", A.disabled True ]
        [ H.text "Episodes" ]
    , H.a [ A.href "/about" ] [ H.text "About" ]
    ]
