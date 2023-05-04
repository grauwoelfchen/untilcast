module Pages.About exposing (page)

import Components.Sidebar
import Html as H exposing (Html)
import Html.Attributes as A
import View exposing (View)


page : View msg
page =
  Components.Sidebar.view
    { page =
      { title = "About - Until"
      , body =
        [ H.text "/about"
        , H.p [] [ H.text "Until — untilcats.ch (yes, it's *cats*, not cast. I just pretended a cute typo ha ha) — is an experimental space for my miscellaneous UNuttered TIL (Today I Learnt) screencasts. Let's see what I can :)" ]
        , H.p [] [ H.text "I'm very whimsical. Miaow!!" ]
        , H.p [] [
            H.a [ A.href "https://gitlab.com/grauwoelfchen/until" ] [ H.text "Source code" ]
          ]
        ]
      }
    }