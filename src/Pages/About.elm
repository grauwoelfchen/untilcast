module Pages.About exposing (page)

import Components.Navbar
import Html as H exposing (Html)
import Html.Attributes as A
import View exposing (View)


page : View msg
page =
  Components.Navbar.view
    { page =
      { title = "About - Untilcast"
      , body =
        [ H.p [ A.class "breadcrumbs" ]
          [ H.span [] [ H.text "/about" ]
          ]
        , H.p []
            [
              H.img [ A.src "/assets/img/logo.png", A.class "logo" ] []
            , H.span [] [ H.text "Untilcast" ]
            , H.i [] [ H.text "—untilcats.ch (yes, it's *cats*, not cast. I pretended to make a cute typo, ha ha)—" ]
            , H.text """is an experimental space for
my miscellaneous UNuttered TIL (Today I Learnt) screencasts. Briefly speaking, it's a something like Video in the Void!
"""
            ]
        , H.p [] [ H.text "I'm very whimsical. Let's see what I can do :)" ]
        , H.p [] [ H.text "Miaow!!" ]
        , H.p [] [
            H.a [ A.href "https://gitlab.com/grauwoelfchen/until" ]
              [ H.text "Source code" ]
          ]
        ]
      }
    }
